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

namespace BHSCMSApp.Dashboard.VendorContract
{
    public partial class ViewContract : System.Web.UI.Page
    {
        int contractID;
        int vendorID;
        static List<DocumentFile> fileList;

        protected void Page_Load(object sender, EventArgs e)
        {
            contractID = Convert.ToInt32(Request.QueryString["contractid"]);//gets and convert to int the rfiif passed in the querystring
            vendorID = Convert.ToInt32(Request.QueryString["vId"]);

            GetContractData();

            if (!IsPostBack)
            {
                PopulateUploadedFiles();


            }
        }


        private void PopulateUploadedFiles()
        {
            using (BHSCMS_Entities dc = new BHSCMS_Entities())
            {
                List<DocumentTable> allFiles = dc.DocumentTables.Where(a => a.ReferenceID == contractID && a.TypeID == 7).ToList();
                listFiles.DataSource = allFiles;
                listFiles.DataBind();
            }
        }

        protected void GetContractData()
        {

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();
                string strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorContractDocQry.sql"), contractID);
                SqlCommand command = new SqlCommand(strSQL, conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.txtTitle.Text = reader["Title"].ToString();
                    this.txtDescription.Text = reader["Description"].ToString();
                    this.category.Text = reader["Category"].ToString();
                    this.txtProduct.Text = reader["ProductDescription"].ToString();
                    this.txtContractPrice.Text = string.Format("{0:C2}", Convert.ToDecimal(reader["ContractPrice"].ToString()));
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
            Page.Response.Redirect("VendorContractList.aspx");

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