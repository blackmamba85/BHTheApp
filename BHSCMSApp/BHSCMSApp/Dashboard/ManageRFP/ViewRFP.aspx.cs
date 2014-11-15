using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.ManageRFP
{
    public partial class ViewRFP : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();//calls this method to get data for grid
        }

        protected void addNewRFP_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("NewRFP.aspx");
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

                strSQL = FunctionsHelper.GetFileContents("SQL/ViewRFP.sql");
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

        protected void ddstatusfilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Request.Form[ddstatusfilter.SelectedItem.Text] == "Opened")
            {
                BindGridOpenedRFI();

            }
            else if (Request.Form[ddstatusfilter.SelectedItem.Text] == "Closed")
            {
                BindGridClosedRFI();
            }
            else
            {
                BindGrid();
            }
        }



        private void BindGridOpenedRFI()
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = String.Format(FunctionsHelper.GetFileContents("SQL/ViewRFPOpened.sql"), DateTime.Today.ToShortDateString());
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


        private void BindGridClosedRFI()
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = String.Format(FunctionsHelper.GetFileContents("SQL/ViewRFPClosed.sql"), DateTime.Today.ToShortDateString());
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
                    e.Row.Cells[7].Text = "Closed";
                }

            }


            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int rfpid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "RFP_ID"));//gets the RFI_ID from the row clicked on grid

                HyperLink details = (HyperLink)e.Row.FindControl("ResponsesLink");
                details.NavigateUrl = String.Format("/Dashboard/ManageRFP/RFPResponses.aspx?rfiid={0}", rfpid);//

                HyperLink edit = (HyperLink)e.Row.FindControl("EditLink");
                edit.NavigateUrl = String.Format("/Dashboard/ManageRFP/EditRFP.aspx?rfiid={0}", rfpid);//                

                HyperLink delete = (HyperLink)e.Row.FindControl("DeleteLink");
                delete.NavigateUrl = String.Format("/Dashboard/ManageRFP/DeleteRFP.aspx?rfiid={0}", rfpid);

            }

        }





       
    }
}