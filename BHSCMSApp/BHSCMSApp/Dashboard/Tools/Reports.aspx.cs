using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BHSCMSApp.Dashboard.Tools
{
    public partial class Reports : System.Web.UI.Page
    {
        string _startDate;
        string _endDate;
        DataTable dt;//DataTable use to store retrieved data

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDateApply_Click(object sender, EventArgs e)
        {
            _startDate = Request.Form[StartDate.UniqueID];
            _endDate = Request.Form[EndDate.UniqueID];

            if (!string.IsNullOrWhiteSpace(_startDate) && !string.IsNullOrWhiteSpace(_endDate))
            {
                

                if (Convert.ToDateTime(_startDate) > Convert.ToDateTime(_endDate))
                {
                    ErrorMessage.Visible = true;
                    FailureText.Text = "Please select a valid date range";
                }
                else
                {
                    FillInRFPDropDownList(_startDate, _endDate);
                    StartDate.Text = _startDate;
                    EndDate.Text = _endDate;

                    if (ddlrfp.Items.Count == 0)
                    {
                        ErrorMessage.Visible = true;
                        FailureText.Text = "There are no RFPs for the date range provided";

                    }
                }

            }
            else
            {
                ErrorMessage.Visible = true;
                FailureText.Text = "Please select start and end date";
            }    

        }



        /// <summary>
        /// Fills the in RFP dropdown list.
        /// </summary>
        protected void FillInRFPDropDownList(string startdate, string enddate)
        {
            string strSQL = "";

            string connectionString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/ReportDateRange.sql"), Convert.ToDateTime(_startDate), Convert.ToDateTime(_endDate));

                    SqlCommand cmd = new SqlCommand(strSQL, connection);
                    cmd.Connection.Open();

                    SqlDataReader rfplist;
                    rfplist = cmd.ExecuteReader();

                    ddlrfp.DataSource = rfplist;
                    ddlrfp.DataValueField = "RFP_ID";
                    ddlrfp.DataTextField = "ProductDescription";
                    ddlrfp.DataBind();

                    
                }
            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

          /// <summary>
        /// Bind compare prices grid 
        /// </summary>
        protected void BindComparePrices()
        {
            int rfpID = Convert.ToInt32(ddlrfp.SelectedValue);

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                string cmd = string.Format(FunctionsHelper.GetFileContents("SQL/ComparePrices.sql"), rfpID);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd, conn);


                DataSet ds = new DataSet();
                adapter.Fill(ds);
                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                GridView1.DataSource = dt;
                GridView1.DataBind();

                //lblProduct.Text = ds.Tables[0].Columns[0].;

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }


        /// <summary>
        /// Bind savings grid
        /// </summary>
        protected void BindCalculateSavings()
        {
            int rfpID = Convert.ToInt32(ddlrfp.SelectedValue);

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                string cmd = string.Format(FunctionsHelper.GetFileContents("SQL/CalculateSavings.sql"), rfpID);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd, conn);


                DataSet ds = new DataSet();
                adapter.Fill(ds);
                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                GridView2.DataSource = dt;
                GridView2.DataBind();

                //lblProduct.Text = ds.Tables[0].Columns[0].;

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }

        protected void genReport_Click(object sender, EventArgs e)
        {
            if(ddlrfp.SelectedIndex <0)
            {
                ErrorMessage.Visible = true;
                FailureText.Text = "Please select RFP from list to generate report";   

            }
            else
            {
                ErrorMessage.Visible = false;
                
                lblProduct.Text = "RFP Product: " + ddlrfp.SelectedItem.Text;
                BindComparePrices();
                BindCalculateSavings();
                pnlReport.Visible = true;
            }
           

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                decimal proposedprice = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ProposedPrice").ToString());
                decimal gatewayprice = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "GatewayPrice").ToString());  

                if (proposedprice>gatewayprice)
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.FromArgb(219, 83, 51); // Column color
                   
                }

            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                decimal savings = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Savings").ToString());

                if (savings <0 )
                {
                    e.Row.Cells[2].ForeColor = System.Drawing.Color.FromArgb(219, 83, 51); // Column color

                }

            }

        }

        protected void btnexportexcelcomparison_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=PricesComparison.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                this.BindComparePrices();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }

                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnexportexcelsavings_Click(object sender, EventArgs e)
        {

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Savings.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView2.AllowPaging = false;
                this.BindComparePrices();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView2.HeaderRow.Cells)
                {
                    cell.BackColor = GridView2.HeaderStyle.BackColor;
                }

                foreach (GridViewRow row in GridView2.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView2.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView2.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView2.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
       
    }
}