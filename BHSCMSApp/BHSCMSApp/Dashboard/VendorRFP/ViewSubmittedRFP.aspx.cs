using BHSCMSApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.VendorRFP
{
    public partial class ViewSubmittedRFP : System.Web.UI.Page
    {
        int rId;
        int vendorID;
        


        protected void Page_Load(object sender, EventArgs e)
        {
            rId = Convert.ToInt32(Request.QueryString["rfpid"]);//gets and convert to int the rfiif passed in the querystring
            vendorID = Convert.ToInt32(Request.QueryString["vId"]);


            GetRFPData();

            if (!IsPostBack)
            {
                PopulateUploadedFiles();
            }       
                      
        }

        private void PopulateUploadedFiles()
        {
            using (BHSCMS_Entities dc = new BHSCMS_Entities())
            {
                List<DocumentTable> allFiles = dc.DocumentTables.Where(a => (a.ReferenceID == rId && a.TypeID == 6 && a.VendorID == vendorID)).ToList();
                listFiles.DataSource = allFiles;
                listFiles.DataBind();
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
                string strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorRFPSubmitted.sql"), rId);
                SqlCommand command = new SqlCommand(strSQL, conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.txtcategory.Text = reader["Category"].ToString();
                    this.txtproduct.Text = reader["ProductDescription"].ToString();
                    this.txtProposedPrice.Text = string.Format("{0:C2}", Convert.ToDecimal(reader["ProposedPrice"]));
                    this.startdate.Text = Convert.ToDateTime(reader["StartDate"].ToString()).ToShortDateString();
                    this.enddate.Text = Convert.ToDateTime(reader["EndDate"].ToString()).ToShortDateString();
                   
                }

            }
            catch (Exception ex)
            {
                //System.Console.Error.Write(e.Message);

            }
        }


        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("VendorRFPList.aspx");
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

    }
}