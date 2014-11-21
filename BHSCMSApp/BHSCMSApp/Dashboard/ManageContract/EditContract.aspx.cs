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
    public partial class EditContract : System.Web.UI.Page
    {

        private int _contractid;
        Contract cont = new Contract();

        string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            _contractid = Convert.ToInt32(Request.QueryString["contractid"]);

            GetContractData();
           
        }

        protected void GetContractData()
        {

            try{
                    //string qry = "Select C.ContractPrice,  from [BHSCMS].[dbo].RFPTable R JOIN [BHSCMS].[dbo].ContractTable C ON C.RFPID=R.RFPID";
            
                    //SqlConnection conn = new SqlConnection(connString);
                    //SqlCommand cmd = new SqlCommand(qry, conn);
                    //conn.Open();

                    //SqlDataReader dr = cmd.ExecuteReader();

                    //if(dr.Read())
                    //{
                    //    cont
                    //}

                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                SqlCommand command = new SqlCommand(String.Format("Select C.ContractID, Cat.Category, C.Description, C.ContractPrice, RFP.GatewayPrice, C.StartDate, C.EndDate from BHSCMS.dbo.ContractTable C JOIN BHSCMS.dbo.RFPTable RFP ON C.UserID=RFP.UserID JOIN BHSCMS.dbo.RFITable R ON RFP.UserID=r.UserID JOIN BHSCMS.dbo.CategoryTable Cat ON R.CategoryID=Cat.CategoryID Where C.ContractID={0}", _contractid), conn);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.contractid.Text = reader["ContractID"].ToString();
                    this.category.Text = reader["Category"].ToString();
                    this.currentPrice.Text = reader["ContractPrice"].ToString();
                    this.txtgatewayprice.Text = reader["GatewayPrice"].ToString();
                    this.productDescription.Text = reader["Description"].ToString();
                    this.txtofferedprice.Text = reader["ContractPrice"].ToString();
                    this.StartDate.Text = reader["StartDate"].ToString();
                    this.EndDate.Text = reader["EndDate"].ToString();
                }

                }
                catch (Exception ex)
                {
                
                
                }

        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
            try
            {

                string qry = "Select C.ContractPrice, R.GatewayPrice, C.StartDate, C.EndDate from BHSCMS.dbo.ContractTable C JOIN RFPTable R ON C.RFPID=R.RFPID Where C.ContractPrice=@ContractPrice && R.GatePrice=@GatewayPrice && C.StartDate=@StartDate && C.EndDate=@EndDate", conn;
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
                {
                    con.Open();
                    using (SqlCommand com = new SqlCommand(qry))
                    {
                        com.Parameters.AddWithValue("@ContractPrice", txtofferedprice.Text);
                        com.Parameters.AddWithValue("@GatewayPrice", txtgatewayprice.Text);
                        com.Parameters.AddWithValue("@StartDate", StartDate.Text);
                        com.Parameters.AddWithValue("@EndDate", EndDate.Text);
                        using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
            }

            catch(Exception ex)
            {

            }
            
           

        }


        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("ViewContract.aspx");
        }
    }
}