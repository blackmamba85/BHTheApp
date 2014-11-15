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
    public class Employee : SysUser
    {
        //private int _empID;
        //private string _lastName;
        //private string _firstName;


        public Employee()
        {

        }


        public void RegisterEmployee(int userID, string lastName, string firstName, int roleId)
        {           
            string connectionString = GetConnectionString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertQry = "Insert into [BHSCMS].[dbo].[EmployeeTable] (UserID, LastName, FirstName, RoleID) values (@userid,@lastname,@firstname,@roleid)";
                SqlCommand command = new SqlCommand(insertQry, connection);
                command.Parameters.AddWithValue("@userID", userID);
                command.Parameters.AddWithValue("@lastname", lastName);
                command.Parameters.AddWithValue("@firstname", firstName);
                command.Parameters.AddWithValue("@roleid", roleId);

                command.ExecuteNonQuery();
                connection.Close();                

            }            
        }

        //Updates Employee information
        public void UpdateEmployee(string fname, string lname, int userid)
        {
            string connectionString = GetConnectionString();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateQry = "update BHSCMS.dbo.EmployeeTable set FirstName=@fname, LastName=@lname where UserID=@userid";

                    SqlCommand updateCmd = new SqlCommand(updateQry, connection);

                    updateCmd.Parameters.AddWithValue("@fname", fname);
                    updateCmd.Parameters.AddWithValue("@lname", lname);    
                    updateCmd.Parameters.AddWithValue("@userid", userid);
                    updateCmd.ExecuteNonQuery();

                    connection.Close();
                }

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }


        //Returns the EmployeeID that matches the UserID
        public int GetEmpIDbyUserID(int userid)
        {
            int empid = 0;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = string.Format("select EmpID from [BHSCMS].[dbo].[EmployeeTable] where UserID='{0}'", userid);
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    empid = Convert.ToInt32(reader["EmpID"]);
                }
            }
            return empid;
        }


    }
}