using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.Register
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        
        private int _userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            _userID = Convert.ToInt32(Request.QueryString["userID"]);//gets and convert to int the userid passed in the querystring

            BindGrid();//calls this method to get data for grid      



        }

        private void BindGrid()
        {
            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                //string cmd = String.Format("Select E.EmpID, E.LastName, E.FirstName, R.Name, U.UserID, U.UserName, U.Password, U.PrimaryEmail, U.SecondaryEmail from BHSCMS.dbo.EmployeeTable E join BHSCMS.dbo.SysUserTable U on e.UserID=u.UserID join BHSCMS.dbo.RoleTable R on E.RoleID=u.UserID Where u.UserID={0}", _userID);
                
                SqlCommand command = new SqlCommand(String.Format("Select E.EmpID, E.LastName, E.FirstName, R.RoleID, U.UserID, U.UserName, U.Password, U.PrimaryEmail, U.SecondaryEmail from BHSCMS.dbo.EmployeeTable E join BHSCMS.dbo.SysUserTable U on e.UserID=u.UserID join BHSCMS.dbo.RoleTable R on R.RoleID=u.RoleID Where u.UserID={0}", _userID),conn);

                 SqlDataReader reader = command.ExecuteReader();

                 while (reader.Read())
                 {
                     this.lblEmpID.Text = reader["EmpID"].ToString();
                     this.lblUserID.Text = reader["UserID"].ToString();
                     this.ddrole.SelectedIndex = (Convert.ToInt32(reader["RoleID"])-1);
                     this.txtLast.Text = reader["LastName"].ToString();
                     this.txtFirst.Text = reader["FirstName"].ToString();
                     this.txtUsername.Text = reader["UserName"].ToString();
                     this.txtPassword.Text = reader["Password"].ToString();
                     this.txtPriEmail.Text = reader["PrimaryEmail"].ToString();
                     this.txtSecEmail.Text = reader["SecondaryEmail"].ToString();                     
                 }

                

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        
        protected void Save_Click(object sender, EventArgs e)
        {
            Employee emp = new Employee();

            emp.UpdateUser(Request.Form[txtUsername.UniqueID], Request.Form[txtPassword.UniqueID], Request.Form[txtPriEmail.UniqueID], Request.Form[txtSecEmail.UniqueID], Convert.ToInt32(Request.Form[ddrole.UniqueID]), _userID);
            emp.UpdateEmployee(Request.Form[txtFirst.UniqueID], Request.Form[txtLast.UniqueID], _userID);

            Page.Response.Redirect("ManageEmployees.aspx");
                
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("ManageEmployees.aspx");
        }

    }
}