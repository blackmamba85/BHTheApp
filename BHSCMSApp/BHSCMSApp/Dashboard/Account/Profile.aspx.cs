using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        private int userid;


        protected void Page_Load(object sender, EventArgs e)
        {
            userid = UserInfoBoxControl.UserID;

            GetProfile();

        }

        public void GetProfile()
        {
            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                SqlCommand command = new SqlCommand(String.Format("Select E.EmpID, E.LastName, E.FirstName, R.RoleID, U.UserID, U.UserName, U.Password, U.PrimaryEmail, U.SecondaryEmail from BHSCMS.dbo.EmployeeTable E join BHSCMS.dbo.SysUserTable U on e.UserID=u.UserID join BHSCMS.dbo.RoleTable R on R.RoleID=u.RoleID Where u.UserID={0}", userid), conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.lblempid.Text = reader["EmpID"].ToString();
                    this.lbllname.Text = reader["LastName"].ToString();
                    this.lblfname.Text = reader["FirstName"].ToString();
                    this.lblusername.Text = reader["UserName"].ToString();
                    this.lblpassword.Text = reader["Password"].ToString();
                    this.lblPriEmail.Text = reader["PrimaryEmail"].ToString();
                    this.lblsecemail.Text = reader["SecondaryEmail"].ToString();
                }


               

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        protected void editprofile_Click(object sender, EventArgs e)
        {
          
            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                SqlCommand command = new SqlCommand(String.Format("Select E.EmpID, E.LastName, E.FirstName, R.RoleID, U.UserID, U.UserName, U.Password, U.PrimaryEmail, U.SecondaryEmail from BHSCMS.dbo.EmployeeTable E join BHSCMS.dbo.SysUserTable U on e.UserID=u.UserID join BHSCMS.dbo.RoleTable R on R.RoleID=u.RoleID Where u.UserID={0}", userid), conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.empID.Text = reader["EmpID"].ToString();
                    this.lname.Text = reader["LastName"].ToString();
                    this.fname.Text = reader["FirstName"].ToString();
                    this.username.Text = reader["UserName"].ToString();
                    this.password.Text = reader["Password"].ToString();
                    this.priEmail.Text = reader["PrimaryEmail"].ToString();
                    this.secEmail.Text = reader["SecondaryEmail"].ToString();
                }




            }
            catch (Exception ex)
            {
                //System.Console.Error.Write(e.Message);

            }

            edit.Visible = true;
            profile.Visible = false;
            
        }

        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            edit.Visible = false;
            profile.Visible = true;

        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
            Employee emp = new Employee();

            emp.UpdateUser(this.username.Text, this.password.Text, this.priEmail.Text, this.secEmail.Text, UserInfoBoxControl.RoleID, userid);
            emp.UpdateEmployee(this.fname.Text, this.lname.Text, userid);

            GetProfile();

            profile.Visible= true;
            edit.Visible = false;

        }
    }
}