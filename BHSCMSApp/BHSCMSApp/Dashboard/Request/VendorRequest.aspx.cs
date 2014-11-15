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
    public partial class VendorRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillInCategoriesDropDownList();
            }

        }



        protected void FillInCategoriesDropDownList()
        {

            string connectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                string qry = "Select * from [BHSCMS].[dbo].[CategoryTable]";

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


        //Finish this...sometime soon.
        protected void CreateAddition_Click(object sender, EventArgs e)
        {
            string sendEmail = String.Empty;
            string subject = String.Empty;
            string body = String.Empty;
            
            sendEmail = "Miniwheatsnb@gmail.com";
            subject = "CompanyName.Text + Email.Text";
            body = Reason.Text;

            string attachmentPath = String.Empty;
            string fileName = String.Empty;

            if(FileUpload.HasFile)
            {
                fileName = Path.GetFileName(FileUpload.PostedFile.FileName);
                FileUpload.PostedFile.SaveAs(Server.MapPath(fileName));
                attachmentPath = Server.MapPath(fileName);

            }

            


        }
    }
}