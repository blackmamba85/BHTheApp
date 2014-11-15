using BHSCMSApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.ManageContract
{
    public partial class NewContract : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data
        private int _rfpId;
        private DateTime startdate;
        private DateTime enddate;

        static List<DocumentFile> fileList;

        //parallel list used to store vendors permissions
        


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
                FillInRFPDropDownList();
                
            }
        }

        /// <summary>
        /// Fills vendor dropdownlist based on RFP selected.
        /// </summary>
        protected void ddRFP_SelectedIndexChanged(object sender, EventArgs e)
        {                    
            
            FillInVendorDropDownList();
            
        }


        /// <summary>
        /// Fills the in RFP dropdown list.
        /// </summary>
        protected void FillInRFPDropDownList()
        {
           
            string connectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                string qry = "SELECT RFP_ID, I.ProductDescription FROM [BHSCMS].[dbo].[RFPTable] P inner join [BHSCMS].[dbo].[RFITable] I on P.RFI_ID=I.RFI_ID  ";

                SqlCommand cmd = new SqlCommand(qry, connection);
                cmd.Connection.Open();

                SqlDataReader ddlRFPs;
                ddlRFPs = cmd.ExecuteReader();

                ddRFP.DataSource = ddlRFPs;
                ddRFP.DataValueField = "RFP_ID";
                ddRFP.DataTextField = "ProductDescription";
                ddRFP.DataBind();
            }
        }


        /// <summary>
        /// Fills the in Vendor dropdown list.
        /// </summary>
        protected void FillInVendorDropDownList()
        {

            _rfpId = Convert.ToInt32(ddRFP.SelectedValue);
            ddvendor.Enabled = true;

            string connectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                string qry = string.Format("SELECT V.VendorID, V.CompanyName FROM [BHSCMS].[dbo].[VendorTable] V inner join [BHSCMS].[dbo].[VendorRFPTable] VR on V.VendorID=VR.VendorID where VR.RFP_ID={0} ", _rfpId);

                SqlCommand cmd = new SqlCommand(qry, connection);
                cmd.Connection.Open();

                SqlDataReader ddlvendors;
                ddlvendors = cmd.ExecuteReader();


                ddvendor.DataSource = ddlvendors;
                ddvendor.DataValueField = "VendorID";
                ddvendor.DataTextField = "CompanyName";
                ddvendor.DataBind();
            }
        }


        /// <summary>
        /// Continue button is clicked and the start date and endate are setup, also document is uploaded
        /// </summary>
        protected void btnCont_Click(object sender, EventArgs e)
        {

            ddRFP.Visible = false;
            ddlRFIlabel.Visible = false;
            ddvendor.Visible = false;
            lblvendor.Visible = false;

            txtRFIProduct.Text = ddRFP.SelectedItem.Text;
            txtRFIProduct.Visible = true;
            txtRFIProductlabel.Visible = true;


            txtvendor.Text = ddvendor.SelectedItem.Text;
            txtvendor.Visible = true;
            lblselectedvendor.Visible = true;


            btnCont.Visible = false;
            setupPanel.Visible = true;
            

        }

        //Go back to select category and vendors 
        protected void goback_Click(object sender, EventArgs e)
        {
           
            setupPanel.Visible = false;


            ddRFP.Visible = true;
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
                FailureText.Text = "Please select start and end date for Contract";
                ErrorMessage.Visible = true;
            }

        }


        /// <summary>
        /// Submit the COntract in the system
        /// </summary>
        protected void Submit_Click(object sender, EventArgs e)
        {
            Contract c = new Contract();

            int contractid;
            
            c.CreateNewContract(this.txtTitle.Text, this.txtDescription.Text, lblstartdate.Text, lblenddate.Text, Convert.ToInt32(ddvendor.SelectedValue), UserInfoBoxControl.UserID, Convert.ToInt32(ddRFP.SelectedValue), Convert.ToDecimal(this.contractPrice.Text));
            contractid = c.GetLastContract_IDinserted();
                    


            if (fileList != null && fileList.Count > 0)
            {
                foreach (DocumentFile file in fileList)
                {
                    file.ReferenceID = contractid;
                    file.TypeID = 4;
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


            ddRFP.Visible = false;
            ddlRFIlabel.Visible = false;
            txtRFIProduct.Visible = false;
            txtRFIProductlabel.Visible = false;
            txtvendor.Visible = false;
            lblselectedvendor.Visible = false;
            Contractsubmit.Visible = true;
            lblsuccess.Text = "The Contract has been successfully submitted";

            fileList = null;
    
           

        }

        protected void back_Click(object sender, EventArgs e)
        {
            reviewPanel.Visible = false;
            setupPanel.Visible = true;
        }



    }
}