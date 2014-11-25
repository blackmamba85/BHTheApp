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

namespace BHSCMSApp.Dashboard.ManageRFP
{
    public partial class EditRFP : System.Web.UI.Page
    {
        private int _rfpid;
        RFP rfp = new RFP();
        Employee emp = new Employee();


        protected void Page_Load(object sender, EventArgs e)
        {
            _rfpid = Convert.ToInt32(Request.QueryString["rfpid"]);//gets and convert to int the rfiif passed in the querystring

            GetRFPData();
        }


        protected void GetRFPData()
        {

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                SqlCommand command = new SqlCommand(String.Format("Select R.RFP_ID, R.StartDate, R.EndDate, C.Category, I.CurrentPrice, R.GatewayPrice, I.ProductDescription from BHSCMS.dbo.RFPTable R join BHSCMS.dbo.RFITable I on R.RFI_ID=I.RFI_ID inner join BHSCMS.dbo.CategoryTable C on I.CategoryID=C.CategoryID Where R.RFP_ID={0}", _rfpid), conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.rfpid.Text = reader["RFP_ID"].ToString();
                    this.category.Text = reader["Category"].ToString();
                    this.StartDate.Text = Convert.ToDateTime(reader["StartDate"].ToString()).ToShortDateString();
                    this.EndDate.Text = Convert.ToDateTime(reader["EndDate"].ToString()).ToShortDateString();
                    this.currentPrice.Text = String.Format("{0:C}", Convert.ToDecimal(reader["CurrentPrice"]));
                    this.txtgatewayprice.Text = String.Format("{0:C}", Convert.ToDecimal(reader["GatewayPrice"]));
                    this.productDescription.Text = reader["ProductDescription"].ToString();
                }

            }
            catch (Exception ex)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("ViewRFP.aspx");
        }


        protected void savebtn_Click(object sender, EventArgs e)
        {
            string gatewayprice;

            if (Convert.ToDateTime(Request.Form[EndDate.UniqueID]) < Convert.ToDateTime(Request.Form[StartDate.UniqueID]))
            {
                ErrorMessage.Visible = true;
                FailureText.Text = "Invalid date range";
            }
            else
            {
                gatewayprice = Request.Form[txtgatewayprice.UniqueID];
                gatewayprice = gatewayprice.Replace("$", string.Empty);

                rfp.UpdateRFP(Convert.ToDecimal(gatewayprice), Request.Form[StartDate.UniqueID], Request.Form[EndDate.UniqueID], _rfpid);
                Page.Response.Redirect("ViewRFP.aspx");
            }


        }


        protected void rfiDoc_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string qry = "Select Document_Data, Document_Name, Content_Type From DocumentTable DT Where DT.TypeID = 3 AND DT.ReferenceID = @Referenceid";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(qry, con))
                {
                    com.Parameters.AddWithValue("@Referenceid", rfpid.Text);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            foreach (DataRow dr in dt.Rows)
            {
                DocumentFile dFile = new DocumentFile()
                {
                    FileData = dr[0] as byte[],
                    FileName = dr[1].ToString(),
                    ContentType = dr[2].ToString(),

                };
                Response.ClearContent();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + dFile.FileName);
                Response.ContentType = dFile.ContentType;
                Response.AddHeader("Content-Length", dFile.FileData.Length.ToString());
                Response.BinaryWrite(dFile.FileData);
                Response.Flush();
                Response.End();

            }


        }
    }
}