using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard
{
    public partial class ManageEmployees : Page
    {
        DataTable dt;//DataTable use to store retrieved data

        private SysUser u = new SysUser();//instantiate a new user from User Class

        protected void Page_Load(object sender, EventArgs e)
        {
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

                string cmd = "Select U.UserID, U. UserName, E.LastName, E.FirstName, R.Role from BHSCMS.dbo.SysUserTable U join BHSCMS.dbo.RoleTable R on U.RoleID=R.RoleID join BHSCMS.dbo.EmployeeTable E on U.UserID=E.UserID where U.RoleID IN(1,2)";
                SqlDataAdapter adapter = new SqlDataAdapter(cmd, conn);


                DataSet ds = new DataSet();
                adapter.Fill(ds);
                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("/Dashboard/Account/NewEmployee.aspx");
        }
               

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int userID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "UserID"));//gets the userID from the row clicked on grid

                HyperLink details = (HyperLink)e.Row.FindControl("DetailsLink");
                details.NavigateUrl = String.Format("/Dashboard/Account/DetailsEmployee.aspx?userid={0}", userID);

                HyperLink edit = (HyperLink)e.Row.FindControl("EditLink");
                edit.NavigateUrl = String.Format("/Dashboard/Account/EditEmployee.aspx?userid={0}", userID);

                HyperLink delete = (HyperLink)e.Row.FindControl("DeleteLink");
                delete.NavigateUrl = String.Format("/Dashboard/Account/DeleteEmployee.aspx?userid={0}", userID);

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}