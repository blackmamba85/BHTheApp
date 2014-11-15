using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.Account
{
    public partial class DeleteEmployee : Page
    {
        DataTable dt;//DataTable use to store retrieved data
        private int _userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            _userID = Convert.ToInt32(Request.QueryString["userID"]);//gets and convert to int the userid passed in the querystring

            BindGrid();//calls this method to get data for grid       
     
        }

        private void BindGrid()
        {
            //string strSQL = "";
            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();
                //strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/UserEmployeeDetails.sql"), _userID);
                string cmd = String.Format("Select E.EmpID, E.LastName, E.FirstName, R.Name, U.UserID, U.UserName, U.Password, U.PrimaryEmail, U.SecondaryEmail from BHSCMS.dbo.EmployeeTable E join BHSCMS.dbo.SysUserTable U on e.UserID=u.UserID join BHSCMS.dbo.RoleTable R on E.RoleID=R.RoleID Where U.UserID={0}", _userID);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd, conn);


                DataSet ds = new DataSet();
                adapter.Fill(ds);
                dt = ds.Tables[0];
                //Bind the fetched data to detailsview
                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bool deleteEmployee = bool.Parse(ClientMediator.Value);

            if(deleteEmployee)
            {
                string deleteCmd = "Delete From BHSCMS.dbo.EmployeeTable Where EmpID = @empID";
                using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
                {
                    con.Open();
                    using(SqlCommand com = new SqlCommand(deleteCmd, con))
                    {
                        com.Parameters.AddWithValue("@empID", _userID);
                        com.ExecuteNonQuery();
                    }
                }

            }
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("ManageEmployees.aspx");
        }
    }
}