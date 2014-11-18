using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard
{
    public partial class ManageVendors : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data

        const string ASCENDING = " ASC";
        const string DESCENDING = " DESC";
        int filter= 1;

        private SysUser u = new SysUser();//instantiate a new user from User Class

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["status"] != null)
                {
                    filter = Convert.ToInt32(Request.QueryString["status"]);
                    BindGrid(filter);

                }
                else
                {
                    BindGrid(filter);//calls this method to get data for grid
                }



            }


        }

        private void BindGrid(int filter)
        {
            string cmd="";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                switch(filter)
                {
                    case 1:
                        cmd = "Select U.UserID, U.PrimaryEmail, V.CompanyName, V.State, S.Status from BHSCMS.dbo.SysUserTable U join BHSCMS.dbo.VendorTable V on U.UserID=V.UserID inner join BHSCMS.dbo.StatusTable S on S.StatusID=V.StatusID Where U.RoleID=3";
                        break;
                    case 2:
                        cmd = "Select U.UserID, U.PrimaryEmail, V.CompanyName, V.State, S.Status from BHSCMS.dbo.SysUserTable U join BHSCMS.dbo.VendorTable V on U.UserID=V.UserID inner join BHSCMS.dbo.StatusTable S on S.StatusID=V.StatusID Where U.RoleID=3 and S.StatusID=1";
                        break;
                    case 3:
                        cmd = "Select U.UserID, U.PrimaryEmail, V.CompanyName, V.State, S.Status from BHSCMS.dbo.SysUserTable U join BHSCMS.dbo.VendorTable V on U.UserID=V.UserID inner join BHSCMS.dbo.StatusTable S on S.StatusID=V.StatusID Where U.RoleID=3 and S.StatusID=2";
                        break;
                    case 4:
                        cmd = "Select U.UserID, U.PrimaryEmail, V.CompanyName, V.State, S.Status from BHSCMS.dbo.SysUserTable U join BHSCMS.dbo.VendorTable V on U.UserID=V.UserID inner join BHSCMS.dbo.StatusTable S on S.StatusID=V.StatusID Where U.RoleID=3 and S.StatusID=3";
                        break;
                    case 5:
                        cmd = "Select U.UserID, U.PrimaryEmail, V.CompanyName, V.State, S.Status from BHSCMS.dbo.SysUserTable U join BHSCMS.dbo.VendorTable V on U.UserID=V.UserID inner join BHSCMS.dbo.StatusTable S on S.StatusID=V.StatusID Where U.RoleID=3 and S.StatusID=4";
                        break;

                }

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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int userID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "UserID"));//gets the userID from the row clicked on grid

                HyperLink details = (HyperLink)e.Row.FindControl("DetailsLink");
                details.NavigateUrl = String.Format("/Dashboard/Account/DetailsVendor.aspx?userid={0}", userID);//

                HyperLink edit = (HyperLink)e.Row.FindControl("EditLink");
                edit.NavigateUrl = String.Format("/Dashboard/Account/EditVendor.aspx?userid={0}", userID);// 

                HyperLink delete = (HyperLink)e.Row.FindControl("DeleteLink");
                delete.NavigateUrl = String.Format("/Dashboard/Account/DeleteVendor.aspx?userid={0}", userID);// 

            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();

                if (status == "Disapproved" || status == "Sanctioned")
                {
                    e.Row.Cells[5].ForeColor = System.Drawing.Color.FromArgb(219, 83, 51); // Column color
                    
                }


            }


        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("/Dashboard/Account/NewVendor.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
            BindGrid(filter);
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {

            

            string sortExpression = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                SortGridView(sortExpression, DESCENDING);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                SortGridView(sortExpression, ASCENDING);
            }   
        }

        public SortDirection GridViewSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;

                return (SortDirection)ViewState["sortDirection"];
            }
            set { ViewState["sortDirection"] = value; }
        }

        private void SortGridView(string sortExpression, string direction)
        {
            DataTable dt = GridView1.DataSource as DataTable;
            DataView dvsort = new DataView(dt);

            
            dvsort.Sort = sortExpression + direction;

            GridView1.DataSource = dvsort;
            GridView1.DataBind();
        }

        protected void ddstatusfilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            filter = Convert.ToInt32(Request.Form[ddstatusfilter.UniqueID]);

            BindGrid(filter);
        }


    }
}