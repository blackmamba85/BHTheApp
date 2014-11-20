using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.IO;

namespace BHSCMSApp.Dashboard.Request
{
    public partial class VendorRequest : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }



        //protected void FillInCategoriesDropDownList()
        //{

        //    string connectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {

        //        string qry = "Select * from [BHSCMS].[dbo].[CategoryTable]";

        //        SqlCommand cmd = new SqlCommand(qry, connection);
        //        cmd.Connection.Open();

        //        SqlDataReader ddlCategories;
        //        ddlCategories = cmd.ExecuteReader();

        //        chkCommodities.DataSource = ddlCategories;
        //        chkCommodities.DataValueField = "CategoryID";
        //        chkCommodities.DataTextField = "Category";
        //        chkCommodities.DataBind();
        //    }




        //}


        //Finish this...sometime soon.
        protected void CreateAddition_Click(object sender, EventArgs e)
        {
            
            string name = CompanyName.Text.Trim();
            string email = Email.Text.Trim() ;
            string message = Reason.Text.Trim();
            string cat = Category.Text.Trim();
            string number = PhoneNumber.Text;
            //string attachmentPath = String.Empty;
            //string fileName = String.Empty;

         


            try
            {
                MailMessage msg = new MailMessage();
                msg.To.Add("miniwheatsnb@gmail.com");

                MailAddress address = new MailAddress(email);
                msg.From = address;

                msg.Subject = name + ": Category Petiton - " + number;
                msg.Body ="Category Petiton for: " + cat + message;

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;

                client.Credentials = new System.Net.NetworkCredential("miniwheatsnb@gmail.com", "34kannon34");

                client.Send(msg);


                lblResult.Text = "Petition has been Sent.";
            }

            catch
            {
                lblResult.Text = "Your Petition has failed to send.";

            }
            


        }
    }
}