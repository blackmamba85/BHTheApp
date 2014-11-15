using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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


        protected void Page_Load(object sender, EventArgs e)
        {
            rId = Convert.ToInt32(Request.QueryString["rfiid"]);//gets and convert to int the rfiif passed in the querystring
            vendorID = Convert.ToInt32(Request.QueryString["vId"]);
            permissionId = Convert.ToInt32(Request.QueryString["pID"]);
            _enddate = Convert.ToDateTime((Request.QueryString["status"]).ToString());

            GetRFIData();

            if (!IsPostBack)
            {
                if (_enddate < DateTime.Today || permissionId == 2)
                {
                    savebtn.Visible = false;
                    exihbitB.Visible = false;
                    docUpload.Visible = false;
                }
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
                    
                    this.category.Text = reader["Category"].ToString();
                    this.startdate.Text = Convert.ToDateTime(reader["StartDate"].ToString()).ToShortDateString();
                    this.enddate.Text = Convert.ToDateTime(reader["EndDate"].ToString()).ToShortDateString();
                    this.rfiDoc.NavigateUrl = "file:///" + reader["FilePath"].ToString();
                    
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
            Page.Response.Redirect("VendorRFIList.aspx");
        }
    }
}