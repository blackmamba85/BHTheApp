using BHSCMSApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.VendorRFI
{
    public partial class VendorRFIList : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data
        private int _userid;
        int filter = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            _userid = UserInfoBoxControl.UserID;

            if (!Page.IsPostBack)
            {
                BindGrid(filter);//calls this method to get data for grid
            }
        }       


        private void BindGrid(int filter)
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();
                switch (filter)
                {
                    case 1:
                    strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorRFIList.sql"), _userid);  
                    break;
                    case 2:
                    strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorRFIListParticipate.sql"), _userid);   
                    break;
                    case 3:
                    strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorRFIListView.sql"), _userid); 
                    break;
                }


                //strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/VendorRFIList.sql"), _userid);
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
                string complete = DataBinder.Eval(e.Row.DataItem, "IsCompleted").ToString();
                //gets all the necessary data to pass in a query string    
                int rfiId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "RFI_ID"));
                int permissionID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "PermissionID"));
                string status = DataBinder.Eval(e.Row.DataItem, "EndDate").ToString();
                int vendorId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "VendorID"));

                HyperLink reply = (HyperLink)e.Row.FindControl("ReplyLink");
                HyperLink submittedLink = (HyperLink)e.Row.FindControl("SubmittedLink");

                if (complete != "True")
                {                            
                   
                    reply.NavigateUrl = String.Format("/Dashboard/VendorRFI/ReplyRFI.aspx?rfiid={0}&pID={1}&status={2}&vId={3}", rfiId, permissionID, Convert.ToDateTime(status).ToShortDateString(), vendorId);//                     
                    e.Row.Cells[2].Text = "Open";
                    submittedLink.Visible = false;
                }
                else
                {                 
                   
                    submittedLink.NavigateUrl = String.Format("/Dashboard/VendorRFI/ViewSubmittedRFI.aspx?rfiid={0}&vId={1}", rfiId, vendorId);//     
                    
                    e.Row.Cells[2].ForeColor = System.Drawing.Color.FromArgb(2, 160, 91); // Column color
                    e.Row.Cells[2].Text = "Completed";
                    reply.Visible = false;
                }
            }


            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    //gets all the necessary data to pass in a query string
            //    int rfiId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "RFI_ID"));
            //    int permissionID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "PermissionID"));
            //    string status = DataBinder.Eval(e.Row.DataItem, "EndDate").ToString();
            //    int vendorId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "VendorID"));

            //    HyperLink reply = (HyperLink)e.Row.FindControl("ReplyLink");
            //    reply.NavigateUrl = String.Format("/Dashboard/VendorRFI/ReplyRFI.aspx?rfiid={0}&pID={1}&status={2}&vId={3}", rfiId, permissionID, Convert.ToDateTime(status).ToShortDateString(), vendorId);//                           
            //}


           


        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid(filter);
        }

        protected void ddpermissionFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            filter = Convert.ToInt32(Request.Form[ddpermissionFilter.UniqueID]);

            BindGrid(filter);
        }

    }
}