using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using BHSCMSApp;

namespace BHSCMSApp
{

    public class SysUser
    {
        //private string _userName;
        //private string _password;
        //private string _primaryEmail;
        //private string _secondaryEmail;
        //private int roleID;

        public SysUser()
        {

        }

        public SysUser (string username)
        {
            UserName = username;
        }

        public SysUser(string userName, string password, string primaryEmail, string secondaryEmail, int roleID)
        {
            UserName = userName;
            Password = password;
            PrimaryEmail = primaryEmail;
            SecondaryEmail = secondaryEmail;
            RoleID = roleID;

        }


        public string UserName { get; set; }
        public string Password { get; set; }
        public string PrimaryEmail { get; set; }
        public string SecondaryEmail { get; set; }
        public int RoleID { get; set; }



        public void RegisterUser(string username, string password, string primaryEmail, string secondaryEmail, int roleId)
        {
            string connectionString = GetConnectionString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open(); 

                //need to implement logic to have only unique usernames in the sysusertable
                string insertQry = "Insert into [BHSCMS].[dbo].[SysUserTable] (UserName, Password, PrimaryEmail, SecondaryEmail, RoleID) values (@username, @password, @priEmail, @secEmail, @roleid)";
                SqlCommand command = new SqlCommand(insertQry, connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@priEmail", primaryEmail);
                command.Parameters.AddWithValue("@secEmail", secondaryEmail);
                command.Parameters.AddWithValue("@roleid", roleId);

                command.ExecuteNonQuery();
                connection.Close();                  

            }
        }

        //Updates User account information
        public void UpdateUser(string username, string password, string primaryEmail, string secondaryEmail, int roleId, int userid)
        {           

            string connectionString = GetConnectionString();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateQry = "update BHSCMS.dbo.SysUserTable set UserName=@username, Password=@password, PrimaryEmail=@primaryemail, SecondaryEmail=@secondaryemail, RoleID=@roleID where UserID=@userid";

                    SqlCommand updateCmd = new SqlCommand(updateQry, connection);

                    updateCmd.Parameters.AddWithValue("@username", username);
                    updateCmd.Parameters.AddWithValue("@password", password);
                    updateCmd.Parameters.AddWithValue("@primaryemail", primaryEmail);
                    updateCmd.Parameters.AddWithValue("@secondaryemail", secondaryEmail);
                    updateCmd.Parameters.AddWithValue("@roleid", roleId);
                    updateCmd.Parameters.AddWithValue("@userid", userid);
                    updateCmd.ExecuteNonQuery();
                }

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
         
            
        }

        //Sets the user deleteflag to 1 in the sysusertable and employeeTable
        public void DeleteUser(int userid)
        {
            string connectionString = GetConnectionString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                
                string delQry = "update SysUserTable set DeleteFlag=1 where UserID=@userid";
                string delQry2 = "update EmployeeTable set DeleteFlag=1 where UserID=@userid";


                SqlCommand deleteComd = new SqlCommand(delQry, connection);
                SqlCommand deleteComd2 = new SqlCommand(delQry2, connection);


                deleteComd.Parameters.AddWithValue("@userid", userid);
                deleteComd.ExecuteNonQuery();

                deleteComd2.Parameters.AddWithValue("@userid", userid);
                deleteComd2.ExecuteNonQuery();

                connection.Open();
            }
        }

        //resturns the number 1 if the user is found
        public int FindUser(string username, string password)
        {
            int result = 0;
             string connectionString = GetConnectionString();

             using (SqlConnection connection = new SqlConnection(connectionString))
             {
                 connection.Open();
                 string findQry = "Select COUNT(UserID) As Count from [BHSCMS].[dbo].[SysUserTable] where UserName=@username and Password=@password";
                 SqlCommand command = new SqlCommand(findQry, connection);
                 command.Parameters.AddWithValue("@username", username);
                 command.Parameters.AddWithValue("@password", password);

                 result = Convert.ToInt32(command.ExecuteScalar());     
             }
            return result;
        }

        //returns the roleid of the user based on the username and password
        public int GetUserRole(string username, string password)
        {
            int roleID = 0;

            string connectionString = GetConnectionString();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(String.Format("Select RoleID from BHSCMS.dbo.SysUserTable Where UserName='{0}' and Password='{1}'", username, password), connection);

                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        roleID = Convert.ToInt32(reader["RoleID"]);
                    }
                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
            return roleID;
        }


        //this method will return the last user registered in the sysusertable
        public int GetLastUserIDinserted()
        {
            int id;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = "select MAX(UserID) as Max from BHSCMS.dbo.SysUserTable";
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                id = Convert.ToInt32(command.ExecuteScalar());                
            }

             return id;
        }


        public string LoginDate(int userid)
        {
            int result = 0;
            string lastloginDate = DateTime.Today.ToShortDateString();

            string connectionString = GetConnectionString();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string findQry = "Select COUNT(UserID) As Count from [BHSCMS].[dbo].[UserActivityLogTable] where UserID=@userid";
                    SqlCommand command = new SqlCommand(findQry, connection);
                    command.Parameters.AddWithValue("@userid", userid);

                    result = Convert.ToInt32(command.ExecuteScalar());
                }
               
            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

            if (result > 0)//if is not the first time user logs in
            {
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string findQry = "Select LastLogin from [BHSCMS].[dbo].[UserActivityLogTable] where UserID=@userid";
                        SqlCommand command = new SqlCommand(findQry, connection);
                        command.Parameters.AddWithValue("@userid", userid);

                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            lastloginDate = reader["LastLogin"].ToString();//gets the last date stored in database for the user
                        }
                        connection.Close();

                        connection.Open();
                        string updQry =String.Format("update UserActivityLogTable set LastLogin='{0}' where UserID={1}", DateTime.Today.ToShortDateString(), userid);
                        SqlCommand updatecommand = new SqlCommand(updQry, connection);
                        updatecommand.ExecuteNonQuery();
                        connection.Close();
                    }

                }
                catch (Exception e)
                {
                    //System.Console.Error.Write(e.Message);

                }
            }

            else//if is the first time the user logs in the system
            {
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        //need to implement logic to have only unique usernames in the sysusertable
                        string insertQry = "Insert into [BHSCMS].[dbo].[UserActivityLogTable] (UserID, [LastLogin]) values (@userid, @logindate)";
                        SqlCommand command = new SqlCommand(insertQry, connection);
                        command.Parameters.AddWithValue("@userid", userid);
                        command.Parameters.AddWithValue("@logindate", DateTime.Today.ToShortDateString());
                        
                        command.ExecuteNonQuery();
                        connection.Close();                         
                    }

                }
                catch (Exception e)
                {
                    //System.Console.Error.Write(e.Message);

                }
            }

            return lastloginDate;
        }

        //Returns the userID that matches the UserName
        public int GetUserIDbyUserName(string username)
        {
            int userid=0;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = string.Format("select UserID from BHSCMS.dbo.SysUserTable where UserName='{0}'",username);
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    userid = Convert.ToInt32(reader["UserID"]);
                }
            }
            return userid;
        }

        //this method returns BHSCMS connection string
        protected string GetConnectionString()
        {
            string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
            return connString;
        }
    }
}