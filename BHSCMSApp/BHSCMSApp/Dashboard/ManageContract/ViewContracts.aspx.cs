using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.ManageContract
{
    public partial class ViewContracts : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();//calls this method to get data for grid
        }

        protected void addnewContract_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("NewContract.aspx");
        }

        private void BindGrid()
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = FunctionsHelper.GetFileContents("SQL/ViewContracts.sql");
                SqlDataAdapter adapter = new SqlDataAdapter(strSQL, conn);


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


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        

        protected void ddstatusfilter_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ErrorMessage.Visible = false;

            if (Request.Form[ddstatusfilter.UniqueID] == "2")
            {
                BindGridExistingContracts();
                if (dt.Rows.Count == 0)
                {
                    ErrorMessage.Visible = true;
                    FailureText.Text = "There are no existing contracts";
                }
               

            }
            else if (Request.Form[ddstatusfilter.UniqueID] == "3")
            {
                BindGridExpiredContracts();
                if (dt.Rows.Count ==0)
                {
                    ErrorMessage.Visible = true;
                    FailureText.Text = "There are no expired contracts";
                }
            }
            else
            {
                BindGrid();
            }
        }


        private void BindGridExistingContracts()
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = String.Format(FunctionsHelper.GetFileContents("SQL/ViewExistingContracts.sql"), DateTime.Today.ToShortDateString());
                SqlDataAdapter adapter = new SqlDataAdapter(strSQL, conn);


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


        private void BindGridExpiredContracts()
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = String.Format(FunctionsHelper.GetFileContents("SQL/ViewExpiredContracts.sql"), DateTime.Today.ToShortDateString());
                SqlDataAdapter adapter = new SqlDataAdapter(strSQL, conn);


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

                string enddate = DataBinder.Eval(e.Row.DataItem, "EndDate").ToString();

                if (Convert.ToDateTime(enddate) < DateTime.Today)
                {
                    e.Row.Cells[7].ForeColor = System.Drawing.Color.FromArgb(219, 83, 51); // Column color
                    e.Row.Cells[7].Text = "Expired";
                }

            }


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string complete = DataBinder.Eval(e.Row.DataItem, "IsCompleted").ToString();

                int contractid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ContractID"));//gets the contractid from the row clicked on grid
                int vendorid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "VendorID"));//gets the vendorid from the row clicked on grid
               
                HyperLink details = (HyperLink)e.Row.FindControl("ResponsesLink");
                details.NavigateUrl = String.Format("/Dashboard/ManageContract/ContractWithVendor.aspx?cid={0}&vid={1}", contractid, vendorid);//

                HyperLink edit = (HyperLink)e.Row.FindControl("EditLink");
                edit.NavigateUrl = String.Format("/Dashboard/ManageContract/EditContract.aspx?contractid={0}", contractid);//                

                HyperLink delete = (HyperLink)e.Row.FindControl("DeleteLink");
                delete.NavigateUrl = String.Format("/Dashboard/ManageContract/DeleteContract.aspx?contractid={0}", contractid);

                if (complete != "True")
                {

                    e.Row.Cells[4].Text = "Incomplete";
                    details.Visible = false;
                }
                else
                {
                    e.Row.Cells[4].Text = "Completed";
                    e.Row.Cells[4].ForeColor = System.Drawing.Color.FromArgb(2, 160, 91); // Column color
                    edit.Visible = false;
                }

            }

        }


    }
}