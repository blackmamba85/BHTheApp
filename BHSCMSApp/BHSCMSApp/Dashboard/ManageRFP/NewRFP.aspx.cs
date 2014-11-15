using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using BHSCMSApp.Models;
using BHSCMSApp;
using System.Text;
using System.IO;
using System.Net;
using System.Web;


namespace BHSCMSApp.Dashboard.ManageRFP
{
    public partial class NewRFP : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data
        private int _rfiId;
        private DateTime startdate;
        private DateTime enddate;

        static List<DocumentFile> fileList;

        //parallel list used to store vendors permissions
        static List<int> vendorlist;
        static List<int> permissionlist;
        static List<string> companylist;



        protected void Page_Load(object sender, EventArgs e)
        {
           

            //If first time page is submitted and we have file in FileUpload control but not in session 
            // Store the values to SEssion Object 
            if (Session["FileUpload1"] == null && docUpload.HasFile)
            {
                Session["FileUpload1"] = docUpload;
                Label1.Text = docUpload.FileName;
            }
            // Next time submit and Session has values but FileUpload is Blank 
            // Return the values from session to FileUpload 
            else if (Session["FileUpload1"] != null && (!docUpload.HasFile))
            {
                docUpload = (FileUpload)Session["FileUpload1"];
                Label1.Text = docUpload.FileName;
            }
            // Now there could be another sictution when Session has File but user want to change the file 
            // In this case we have to change the file in session object 
            else if (docUpload.HasFile)
            {
                Session["FileUpload1"] = docUpload;
                Label1.Text = docUpload.FileName;
            }

            if (!Page.IsPostBack)
            {
                FillInRFIDropDownList();
                vendorlist = new List<int>();
                permissionlist = new List<int>();
                companylist = new List<string>();
            }
        }

        /// <summary>
        /// Fills the in gridview based on RFI selected.
        /// </summary>
        protected void ddRFI_SelectedIndexChanged(object sender, EventArgs e)
        {
            _rfiId = (ddRFI.SelectedIndex);

            txtRFIProduct.Text = (ddRFI.SelectedItem.Text);

            BindGrid(_rfiId);

            panelVendors.Visible = true;
        }


        /// <summary>
        /// Fills the in RFI dropdown list.
        /// </summary>
        protected void FillInRFIDropDownList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                string qry = "SELECT RFI_ID, ProductDescription FROM [BHSCMS].[dbo].[RFITable]";

                SqlCommand cmd = new SqlCommand(qry, connection);
                cmd.Connection.Open();

                SqlDataReader ddlRFIs;
                ddlRFIs = cmd.ExecuteReader();

                ddRFI.DataSource = ddlRFIs;
                ddRFI.DataValueField = "RFI_ID";
                ddRFI.DataTextField = "ProductDescription";
                ddRFI.DataBind();
            }
        }


        /// <summary>
        /// Binds the grid with the vendors that are participating in the RFI
        /// </summary>
        private void BindGrid(int rfiid)
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/RFP_RFIVendors.sql"), rfiid);
                SqlDataAdapter adapter = new SqlDataAdapter(strSQL, conn);


                DataSet ds = new DataSet();
                adapter.Fill(ds);
                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }

        /// <summary>
        /// Continue button is clicked and the start date and endate are setup, also document is uploaded
        /// </summary>
        protected void btnCont_Click(object sender, EventArgs e)
        {

            ddRFI.Visible = false;
            ddlRFIlabel.Visible = false;

            txtRFIProduct.Visible = true;

            txtRFIProductlabel.Visible = true;

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBoxList rb = (CheckBoxList)row.FindControl("chkBoxParticipate");

                if( rb.SelectedItem != null)
                {
                    if (rb.SelectedItem.Value == "1" || rb.SelectedItem.Value == "2")
                    {
                        int vendorid = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);
                        int permissionid = Convert.ToInt32(rb.SelectedItem.Value);
                        string company = (GridView1.DataKeys[row.RowIndex].Values[1]).ToString();

                        vendorlist.Add(vendorid);
                        permissionlist.Add(permissionid);
                        companylist.Add(company);
                    }
                }
                

            }

            StringBuilder builderParticipate = new StringBuilder();
            StringBuilder builderView = new StringBuilder();
            int index = 0;

            foreach (string company in companylist) // Loop through all companies in list
            {
                if (permissionlist[index] == 1)
                {
                    builderParticipate.Append(company).Append("<br />"); // Append string to StringBuilder

                }
                else
                {
                    builderView.Append(company).Append("<br />"); // Append string to StringBuilder
                }

                index++;
            }

            participatelist.Text = builderParticipate.ToString();
            viewlist.Text = builderView.ToString();


            setupPanel.Visible = true;
            panelVendors.Visible = false;
            panelvendorlist.Visible = true;

        }


        //Go back to select category and vendors 
        protected void goback_Click(object sender, EventArgs e)
        {
            panelVendors.Visible = true;
            setupPanel.Visible = false;
            panelvendorlist.Visible = false;

            ddRFI.Visible = true;
            ddlRFIlabel.Visible = true;

            txtRFIProduct.Visible = false;
            txtRFIProductlabel.Visible = false;
        }


        //reviews the RFI before submitting
        protected void review_Click(object sender, EventArgs e)
        {
            try
            {
                startdate = Convert.ToDateTime(Request.Form["startdate"]);
                enddate = Convert.ToDateTime(Request.Form["enddate"]);

                if (enddate > startdate)
                {
                    ErrorMessage.Visible = false;
                    reviewPanel.Visible = true;
                    setupPanel.Visible = false;

                    lblstartdate.Text = startdate.ToShortDateString();
                    lblenddate.Text = enddate.ToShortDateString();


                    if (docUpload.HasFiles)
                    {
                        fileList = new List<DocumentFile>();
                        foreach (HttpPostedFile file in docUpload.PostedFiles)
                        {
                            byte[] fileData = null;

                            using (BinaryReader bReader = new BinaryReader(file.InputStream))
                            {
                                fileData = bReader.ReadBytes(file.ContentLength);
                            }
                            fileList.Add(new DocumentFile()
                            {
                                FileName = Path.GetFileName(file.FileName),
                                ContentType = file.ContentType,
                                FileData = fileData,
                            });
                        }
                    }

              

                }
                else
                {

                    FailureText.Text = "Invalid date range. Please select a valid date range";
                    ErrorMessage.Visible = true;
                }

            }

            catch (Exception ex)
            {
                FailureText.Text = "Please select start and end date for RFI";
                ErrorMessage.Visible = true;
            }         

        }


        /// <summary>
        /// Submit the RFP in the system
        /// </summary>
        protected void Submit_Click(object sender, EventArgs e)
        {
            RFP rfp = new RFP();
            decimal gatewayPrice = Convert.ToDecimal(this.txtgatewayPrice.Text);
            int rfpid;
            rfp.CreateNewRFP(ddRFI.SelectedIndex, UserInfoBoxControl.UserID, gatewayPrice, lblstartdate.Text, lblenddate.Text);
            rfpid = rfp.GetLastRFP_IDinserted();
            

            int index = 0;//index use to step through the permissionlist 

            foreach (var vendor in vendorlist)
            {
                try
                {
                    string insertQry = "Insert into [BHSCMS].[dbo].[VendorRFPTable] (RFP_ID, VendorID, PermissionID) Values (@rfpId, @vendorid, @permissionId)";

                    string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

                    SqlConnection conn = new SqlConnection(connString);
                    SqlCommand cmd = new SqlCommand(insertQry, conn);
                    conn.Open();

                    cmd.Parameters.AddWithValue("@rfpId", rfpid);
                    cmd.Parameters.AddWithValue("@vendorid", vendor);
                    cmd.Parameters.AddWithValue("@permissionId", permissionlist[index]);
                    cmd.ExecuteNonQuery();


                    conn.Close();

                    index++;//increases the index of permissionID list

                }
                catch (Exception ex)
                {

                }

            }


            if (fileList != null && fileList.Count > 0)
            {
                foreach (DocumentFile file in fileList)
                {
                    file.ReferenceID = rfpid;
                    file.TypeID = 3;
                    FunctionsHelper.UploadDocument(file);
                }

            }
            else
            {
                //Alert the user that something bad has happened
                string startupScript = "alert('Document Upload failed please try again. Or contact an IS Admin')";
                ClientScript.RegisterStartupScript(GetType(), "startupScript", startupScript);
            }

                     


            reviewPanel.Visible = false;
            setupPanel.Visible = false;
            panelVendors.Visible = false;
            panelvendorlist.Visible = false;
            
            ddRFI.Visible = false;
            ddlRFIlabel.Visible = false;
            txtRFIProduct.Visible = false;
            txtRFIProductlabel.Visible = false;

            RFPsubmit.Visible = true;
            lblsuccess.Text = "The RFP has been successfully submitted";

            fileList = null;
            vendorlist = null;//static lists are cleared to be used again
            permissionlist = null;
            companylist = null;         
                                    
        }

        protected void back_Click(object sender, EventArgs e)
        {
            reviewPanel.Visible = false;
            setupPanel.Visible = true;
        }

    }

    
}