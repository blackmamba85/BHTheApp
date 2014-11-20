using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.VendorContract
{
    public partial class VendorContractList : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data
        private int _userid;
        int filter = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            _userid = UserInfoBoxControl.UserID;

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
                        strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/ViewVendorContracts.sql"), _userid);
                        break;
                    case 2:
                        strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/ViewVendorContractsExisting.sql"), _userid, DateTime.Today);
                        break;
                    case 3:
                        strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/ViewVendorContractsExpired.sql"), _userid, DateTime.Today);
                        break;
                }
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
                    e.Row.Cells[8].ForeColor = System.Drawing.Color.FromArgb(219, 83, 51); // Column color
                    e.Row.Cells[8].Text = "Expired";
                }
            }


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string complete = DataBinder.Eval(e.Row.DataItem, "IsCompleted").ToString();
                //gets all the necessary data to pass in a query string    
                int contractid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ContractID"));
                
                int vendorId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "VendorID"));

                HyperLink submit = (HyperLink)e.Row.FindControl("SubmitContract");
                HyperLink view = (HyperLink)e.Row.FindControl("ViewContract");

                if (complete != "True")
                {

                    submit.NavigateUrl = String.Format("/Dashboard/VendorContract/SubmitContract.aspx?contractid={0}&vId={1}", contractid, vendorId);//                     
                    e.Row.Cells[2].Text = "Incomplete";
                    view.Visible = false;
                }
                else
                {

                    view.NavigateUrl = String.Format("/Dashboard/VendorContract/ViewContract.aspx?contractid={0}&vId={1}", contractid, vendorId);//          

                    e.Row.Cells[2].ForeColor = System.Drawing.Color.FromArgb(2, 160, 91); // Column color
                    e.Row.Cells[2].Text = "Completed";
                    submit.Visible = false;
                }
            }

        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid(filter);
        }

        protected void ddcontractsstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            filter = Convert.ToInt32(Request.Form[ddcontractsstatus.UniqueID]);

            BindGrid(filter);

            ErrorMessage.Visible = false;
          
            if (dt.Rows.Count == 0)
            {
                ErrorMessage.Visible = true;
                FailureText.Text = "***No matches for this criteria";
            }
        }

    }
}