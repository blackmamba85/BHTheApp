using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using BHSCMSApp.Models;
using BHSCMSApp;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Collections.Generic;
using System.IO;




namespace BHSCMSApp.Account
{
    public partial class Register : Page
    {

        Vendor v = new Vendor();
        //instantiate a new vendor from Vendor Class
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString);
        static List<DocumentFile> fileList;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillInCategoriesDropDownList();
            }
            
        }

        /// <summary>
        /// Fills the in Category check down list.
        /// </summary>
        protected void FillInCategoriesDropDownList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                string qry = "SELECT * FROM [BHSCMS].[dbo].[CategoryTable]";

                SqlCommand cmd = new SqlCommand(qry, connection);
                cmd.Connection.Open();

                SqlDataReader ddlCategories;
                ddlCategories = cmd.ExecuteReader();

                chkCommodities.DataSource = ddlCategories;
                chkCommodities.DataValueField = "CategoryID";
                chkCommodities.DataTextField = "Category";
                chkCommodities.DataBind();
            }
        }



        public bool BooleanRegistration()
        {
            //Create Connection String & SQL statement
            string connStr = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
            string selectStr = "Select RegistrationCode from [BHSCMS].[dbo].[RegistrationTable]";
            string regCode = RegCode.Text;

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = selectStr;

            SqlParameter regcode = new SqlParameter("@RegistrationCode",SqlDbType.VarChar, 10);
            regcode.Value = RegCode.Text.Trim().ToString();
            cmd.Parameters.Add(regcode);

            conn.Open();
            string result = (string)cmd.ExecuteScalar();
            conn.Close();

            
            //SqlConnection conn = new SqlConnection();
            //conn.ConnectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
            //conn.Open();

            
            //SqlCommand cmd = new SqlCommand("Select RegistrationCode from [BHSCMS].[dbo].[RegistrationTable] where RegistrationCode = @regCode", conn);
            //cmd.Parameters.Add(new SqlParameter("@regCode", RegCode));

            //string result = ((string)cmd.ExecuteScalar());
            //conn.Close();
            

            if(result == regCode)
                {
                    return true;

                }

            else
                {
                    return false;
                }

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // Code for Upload file to database
            if (docUpload.HasFiles)
            {
                fileList = new List<DocumentFile>();

                if (docUpload.PostedFiles.Count == 1)
                {                    
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
                                    TypeID = 1,
                                    Document_Data = buffer,
                                    Document_Name = file.FileName,
                                    Content_Type = file.ContentType,                                    
                                    DateStamp = DateTime.Today,
                                    VendorID = v.GetLastVendorIDinserted() + 1
                                });
                            dc.SaveChanges();
                           
                        }
                    }


                    //variables used to create the new vendor
                    #region
                    string company = CompanyName.Text;
                    string phone = PhoneNumber.Text;
                    string fax = FaxNumber.Text;
                    string address1 = Address.Text;
                    string address2 = Address2.Text;
                    string city = City.Text;
                    string state = ddState.SelectedItem.Value;
                    string zipcode = Zipcode.Text;
                    string regDate = DateTime.Today.ToShortDateString();
                    int taxid = Convert.ToInt32(TaxID.Text);
                    string username = UserName.Text;
                    string password = Password.Text;
                    string priEmail = Email.Text;
                    string secEmail = AltEmail.Text;
                    int roleid = 3;//vendor role is number 3               
                    #endregion

                    if (IsValid && BooleanRegistration() == true)
                    {
                        v.RegisterUser(username, password, priEmail, secEmail, roleid);

                        int userid = v.GetLastUserIDinserted();//gets the user id from the sysusertable

                        v.RegisterVendor(company, userid, phone, fax, address1, address2, city, state, zipcode, 2, regDate, taxid);

                        AddVendorCategories();//inserts categories the vendor sells in the bridge SellTable
                        string emailmessage = "Hello " + CompanyName.Text.Trim() + " !<\br>" +
                                "Thanks for showing interest and registering in <a href='http://www.cob-blobfish.cbpa.louisville.edu'>Baptist Health Supply Chain Solution<a>" +
                                " You can now go and login in the website, however our staff still needs to validate you which can take from 2 to 3 days. Should you have any questions, please do not hesitate to contact us. Thanks for doing business with us<\br>"
                                + "Baptist Health Supply Chain Department";

                        sendemail(priEmail, emailmessage);

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Thank you for Registering!!!');", true);

                        Page.Response.Redirect("../Default.aspx");

                    }

                    else
                    {
                        ErrorMessage.Text = "Invalid field input or Registration Code is Incorrect.";
                    }                 

                }
                else
                {
                    
                    reqdocupload.Text = "***Only one tax form is required";
                }

            }  
        
        
        
        
        
        }//ends create user method


        private void clear_control()
        {
            Email.Text = string.Empty;
            CompanyName.Text = string.Empty;
            Email.Text = string.Empty;
            Password.Text = string.Empty;
            UserName.Text = string.Empty;
            PhoneNumber.Text = string.Empty;
            FaxNumber.Text = string.Empty;
            Address.Text = string.Empty;
            Address2.Text = string.Empty;
            City.Text = string.Empty;
            ddState.SelectedItem.Value = string.Empty;
            Zipcode.Text = string.Empty;
            TaxID.Text = string.Empty;
            RegCode.Text = string.Empty;
            CompanyName.Focus();
        }

        public static void sendemail(string email, string emailmessage)
        {
            string to = email;
            String subject = "Registration Confirmation!";
            String Body = emailmessage;

            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("tdngo0003@gmail.com", "LangTu-718"),
                EnableSsl = true
            };

            MailMessage message = new MailMessage("tdngo0003@gmail.com", to, subject, Body);
            message.From = new MailAddress("tdngo0003@gmail.com", "Baptist Health Supply Chain Solutions");
            message.IsBodyHtml = true;

            try
            {
                client.Send(message);
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }
        }
        //Records in SellTable the categories the vendor sells
        public void AddVendorCategories()
        {
            int vendorid;

            vendorid = v.GetLastVendorIDinserted();            

            foreach (System.Web.UI.WebControls.ListItem item in chkCommodities.Items)
            {
                if (item.Selected)
                {
                    try
                    {
                        string insertQry = "Insert into [BHSCMS].[dbo].[SellTable] (VendorID, ID) Values (@vendorid, @categoryid)";

                        string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

                        SqlConnection conn = new SqlConnection(connString);
                        SqlCommand cmd = new SqlCommand(insertQry, conn);
                        conn.Open();

                        cmd.Parameters.AddWithValue("@vendorid", vendorid);
                        cmd.Parameters.AddWithValue("@categoryid", item.Value);
                        cmd.ExecuteNonQuery(); 
                                               
                        
                        conn.Close(); 
                       
                    }
                    catch (Exception ex)
                    {
                        
                    }
                }
            }  
                     

        }

    }
}