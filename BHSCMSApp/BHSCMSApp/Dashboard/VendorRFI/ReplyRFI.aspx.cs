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

namespace BHSCMSApp.Dashboard.VendorRFI
{
    public partial class ReplyRFI : System.Web.UI.Page
    {
        int rId;
        int vendorID;
        int permissionId;
        DateTime _enddate;
        static List<DocumentFile> fileList;


        protected void Page_Load(object sender, EventArgs e)
        {
            rId = Convert.ToInt32(Request.QueryString["rfiid"]);//gets and convert to int the rfiif passed in the querystring
            vendorID = Convert.ToInt32(Request.QueryString["vId"]);
            permissionId = Convert.ToInt32(Request.QueryString["pID"]);
            _enddate = Convert.ToDateTime((Request.QueryString["status"]).ToString());

            GetRFIData();

            if (!IsPostBack)
            {
                PopulateUploadedFiles();

                if (_enddate < DateTime.Today || permissionId == 2)
                {
                    savebtn.Visible = false;
                    //exihbitB.Visible = false;
                    docUpload.Visible = false;
                }
            }       


        }

        private void PopulateUploadedFiles()
        {
            using (BHSCMS_Entities dc = new BHSCMS_Entities())
            {
                List<DocumentTable> allFiles = dc.DocumentTables.Where(a => a.ReferenceID == rId && a.TypeID==2).ToList();
                listFiles.DataSource = allFiles;
                listFiles.DataBind();                
            }
        }


        protected void GetRFIData()
        {

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();
                string strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorRFIDocQry.sql"), rId);
                SqlCommand command = new SqlCommand(strSQL, conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.startdate.Text = Convert.ToDateTime(reader["StartDate"].ToString()).ToShortDateString();
                    this.enddate.Text = Convert.ToDateTime(reader["EndDate"].ToString()).ToShortDateString();
                    this.category.Text = reader["Category"].ToString();
                    this.product.Text = reader["ProductDescription"].ToString();                  
                   
                    
                }

            }
            catch (Exception ex)
            {
                //System.Console.Error.Write(e.Message);

            }
        }


        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("VendorRFIList.aspx");
        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
            RFI r = new RFI();
            // Code for Upload file to database
            if (docUpload.HasFile)
            {
                fileList = new List<DocumentFile>();
                foreach (HttpPostedFile file in docUpload.PostedFiles)
                {
                    //HttpPostedFile file = docUpload.PostedFile;
                    BinaryReader br = new BinaryReader(file.InputStream);
                    byte[] buffer = br.ReadBytes(file.ContentLength);

                    using (BHSCMS_Entities dc = new BHSCMS_Entities())
                    {

                        dc.DocumentTables.Add(
                            new DocumentTable
                            {
                                TypeID = 5,
                                Document_Data = buffer,
                                Document_Name = file.FileName,
                                Content_Type = file.ContentType,
                                ReferenceID = rId,
                                DateStamp = DateTime.Today,
                                VendorID = vendorID



                            });
                        dc.SaveChanges();
                        PopulateUploadedFiles();
                    }
                }
            }

            r.UpdateRFIStatus(rId, vendorID);
            
            Page.Response.Redirect("VendorRFIList.aspx");
        }

        protected void listFiles_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                int docID = Convert.ToInt32(e.CommandArgument);

                using (BHSCMS_Entities dc = new BHSCMS_Entities())
                {
                    var v = dc.DocumentTables.Where(a => a.DocID==docID).FirstOrDefault();
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