using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BHSCMSApp.Dashboard.Register
{

    public partial class NewEmployee : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(validFirstName.IsValid && validLastName.IsValid && validPassword.IsValid && validPriEmail.IsValid && validRole.IsValid && validUserName.IsValid)
            {
                Employee emp = new Employee();
                //instantiate a new employee from Employee Class

                //variables used to create the new employee
                string username = txtUsername.Text;
                string password = txtPassword.Text;
                string priEmail = txtPriEmail.Text;
                string secEmail = txtSecEmail.Text;
                int roleid = ddrole.SelectedIndex + 1;
                string lastname = txtLast.Text;
                string firstname = txtFirst.Text;


                emp.RegisterUser(username, password, priEmail, secEmail, roleid);//register the emp in the sysusertable


                int userid = emp.GetLastUserIDinserted();//gets the user id from the sysusertable

                emp.RegisterEmployee(userid, lastname, firstname, roleid);//registers the emp in the employeetable

                Page.Response.Redirect("/Dashboard/Account/ManageEmployees.aspx");           
            }
        }
                
    }    
}