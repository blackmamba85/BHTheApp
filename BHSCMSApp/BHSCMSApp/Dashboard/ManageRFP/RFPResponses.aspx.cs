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

namespace BHSCMSApp.Dashboard.ManageRFP
{
    public partial class RFPResponses : System.Web.UI.Page
    {
        int rId;
        DataTable dt;//DataTable use to store retrieved data


        protected void Page_Load(object sender, EventArgs e)
        {
            rId = Convert.ToInt32(Request.QueryString["rfpid"]);//gets and convert to int the rfiif passed in the querystring


            if (!IsPostBack)
            {
                BindGrid();//calls this method to get data for grid
                

                if (dt.Rows.Count == 0)
                {
                    ErrorMessage.Visible = true;
                    FailureText.Text = "**There are no responses for this RFP";
                }
                else
                {
                    GetRFPData();
                    pnlrfpDetails.Visible = true;
                    pnlgrid.Visible = true;
                }

            }         

        }

        private void BindGrid()
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/RFPResponses.sql"), rId);
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

        protected void GetRFPData()
        {

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();
                string strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorRFPDocQry.sql"), rId);
                SqlCommand command = new SqlCommand(strSQL, conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.category.Text = reader["Category"].ToString();
                    this.product.Text = reader["ProductDescription"].ToString();
                    this.startdate.Text = Convert.ToDateTime(reader["StartDate"].ToString()).ToShortDateString();
                    this.enddate.Text = Convert.ToDateTime(reader["EndDate"].ToString()).ToShortDateString();
                    this.txtcurrentPrice.Text = string.Format("{0:C2}", Convert.ToDecimal(reader["CurrentPrice"].ToString()));
                    this.txtgatewayPrice.Text = string.Format("{0:C2}", Convert.ToDecimal(reader["GatewayPrice"].ToString()));
                   


                }

            }
            catch (Exception ex)
            {
                //System.Console.Error.Write(e.Message);

            }
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void listFiles_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                int docID = Convert.ToInt32(e.CommandArgument);

                using (BHSCMS_Entities dc = new BHSCMS_Entities())
                {
                    var v = dc.DocumentTables.Where(a => a.DocID == docID).FirstOrDefault();
                    if (v != null)
                    {
                        byte[] fileData = v.Document_Data;
                        Response.AddHeader("Content-type", v.Content_Type);
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + v.Document_Name);

                        byte[] dataBlock = new byte[0x1000];
                        long fileSize;
                        int bytesRead;
                        long totalsBytesRead = 0;

                        using (Stream st = new MemoryStream(fileData))
                        {
                            fileSize = st.Length;
                            while (totalsBytesRead < fileSize)
                            {
                                if (Response.IsClientConnected)
                                {
                                    bytesRead = st.Read(dataBlock, 0, dataBlock.Length);
                                    Response.OutputStream.Write(dataBlock, 0, bytesRead);

                                    Response.Flush();
                                    totalsBytesRead += bytesRead;
                                }
                            }
                        }
                        Response.End();
                    }
                }

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int vendorid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "VendorID").ToString());

                using (BHSCMS_Entities dc = new BHSCMS_Entities())
                {
                    List<DocumentTable> allFiles = dc.DocumentTables.Where(a => a.ReferenceID == rId && a.TypeID == 6 && a.VendorID == vendorid).ToList();

                    DataList datalist = (DataList)e.Row.FindControl("listFiles");

                    datalist.DataSource = allFiles;
                    datalist.DataBind();
                }

                int userID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "UserID"));//gets the userID from the row clicked on grid

                HyperLink details = (HyperLink)e.Row.FindControl("vendorDetails");
                details.NavigateUrl = String.Format("/Dashboard/Account/DetailsVendor.aspx?userid={0}", userID);//
            }

        }

        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("ViewRFP.aspx");
        }




    }
}