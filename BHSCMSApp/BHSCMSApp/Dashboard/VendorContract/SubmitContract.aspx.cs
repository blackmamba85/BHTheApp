﻿using BHSCMSApp.Models;
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
    public partial class SubmitContract : System.Web.UI.Page
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


        }

        private void PopulateUploadedFiles()
        {
            using (BHSCMS_Entities dc = new BHSCMS_Entities())
            {
                List<DocumentTable> allFiles = dc.DocumentTables.Where(a => a.ReferenceID == contractID && a.TypeID == 4).ToList();
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

        protected void savebtn_Click(object sender, EventArgs e)
        {

            // Code for Upload file to database
             if (docUpload.HasFiles)
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
                                TypeID = 7,
                                Document_Data = buffer,
                                Document_Name = file.FileName,
                                Content_Type = file.ContentType,
                                ReferenceID = contractID,
                                DateStamp = DateTime.Today,
                                VendorID = vendorID

                            });
                        dc.SaveChanges();
                        PopulateUploadedFiles();
                    }
                }


                Contract c = new Contract();

                c.UpdateContractStatus(contractID, vendorID);//updates the complete status on VendorRFITable
                Page.Response.Redirect("VendorContractList.aspx");

            }
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
