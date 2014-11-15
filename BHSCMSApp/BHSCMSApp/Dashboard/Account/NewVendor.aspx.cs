using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace BHSCMSApp.Dashboard.Register
{
    public partial class NewVendor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                FillInCategoriesDropDownList();
        }
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
        protected void addButton_Click(object sender, EventArgs e)
        {
            if (ValidTaxID.IsValid == true)
            //ValidVend.IsValid == true &&
            {

                Vendor vend = new Vendor();
                //instantiate a new employee from Employee Class

                //variables used to create the new employee
                string company = CompanyName.Text;
                string phone = PhoneNumber.Text;
                string fax = Fax.Text;
                string address1 = PAddress.Text;
                string address2 = BAddress.Text;
                //int vendid = int.Parse(VendorID.Text);
                string city = City.Text;
                string state = State.Text;
                string zipcode = ZipCode.Text;
                int taxid = int.Parse(TaxID.Text);
                string email = Email.Text;
                string emailsec = EmailSec.Text;
                string username = UserId.Text;
                string password = Password.Text;
                DateTime registrationDate = System.DateTime.Now;
                int status = 1;
                int roleid = 3;



                vend.RegisterUser(username, password, email, emailsec, roleid);//register the emp in the sysusertable


                int userid = vend.GetLastUserIDinserted();//gets the user id from the sysusertable

                vend.RegisterVendor(company, userid, phone, fax, address1, address2, city, state, zipcode, status, registrationDate.ToString(), taxid);//registers the vendor in the VendorTable
                
                string emailmessage = "Hi " + CompanyName.Text.Trim() + " !\n" +
                        "Thanks for showing interest and registering with <a href='http://www.cob-blobfish.cbpa.louisville.edu'>Baptist Health Supply Chain Solution<a>" +
                        " You can now go your account and enjoy our services. Thanks!";

                sendemail(email, emailmessage);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Thank you for Registering!!!');", true);

                Page.Response.Redirect("../ManageVendors.aspx");
            } 
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
        private void clear_control()
        {
            Email.Text = string.Empty;  
            CompanyName.Text = string.Empty;
            EmailSec.Text = string.Empty;
            Password.Text = string.Empty;
            UserId.Text = string.Empty;
            PhoneNumber.Text = string.Empty;
            Fax.Text = string.Empty;
            PAddress.Text = string.Empty;
            BAddress.Text = string.Empty;
            City.Text = string.Empty;
            State.Text = string.Empty;
            ZipCode.Text = string.Empty;
            TaxID.Text = string.Empty;
            CompanyName.Focus();
        }

        public void AddVendorCategories(Vendor v)
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
