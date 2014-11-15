using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using BHSCMSApp;

namespace BHSCMSApp
{
    public class RFP 
    {

        public RFP()//Empty RFI constructor
        {

        }

        //creates new RFP
        public void CreateNewRFP(int rfiID, int userid, decimal gatewayPrice, string startdate, string enddate)
        {
            string connectionString = GetConnectionString();

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    string insertQry = "Insert into [BHSCMS].[dbo].[RFPTable] (RFI_ID, UserID, GatewayPrice, StartDate, EndDate, CreatedDate) values (@rfiID, @userID, @gatewayPrice, @startdate, @enddate, @createddate)";
                    SqlCommand command = new SqlCommand(insertQry, connection);
                    command.Parameters.AddWithValue("@rfiID", rfiID);
                    command.Parameters.AddWithValue("@userID", userid);
                    command.Parameters.AddWithValue("@gatewayPrice", gatewayPrice);                    
                    command.Parameters.AddWithValue("@startdate", startdate);
                    command.Parameters.AddWithValue("@enddate", enddate);                   
                    command.Parameters.AddWithValue("@createddate", DateTime.Today.ToShortDateString());
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        //Updates existing RFP
        public void UpdateRFP(decimal gatewayPrice, string startdate, string enddate, int id)
        {
            string connectionString = GetConnectionString();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateQry = "update BHSCMS.dbo.RFPTable set GatewayPrice=@gatewayPrice, StartDate=@startdate, EndDate=@enddate, ModifiedDate=@modifieddate where RFP_ID=@id";

                    SqlCommand updateCmd = new SqlCommand(updateQry, connection);

                    updateCmd.Parameters.AddWithValue("@gatewayPrice", gatewayPrice);
                    updateCmd.Parameters.AddWithValue("@startdate", startdate);
                    updateCmd.Parameters.AddWithValue("@enddate", enddate);                    
                    updateCmd.Parameters.AddWithValue("@modifieddate", DateTime.Today.ToShortDateString());
                    updateCmd.Parameters.AddWithValue("@id", id);
                    updateCmd.ExecuteNonQuery();
                }

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }


        public void AddVendorstoRFP(int rfpID, List<int> vendorid, List<int> permissionID)
        {
            string connectionString = GetConnectionString();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string insertQry = "Insert into [BHSCMS].[dbo].[VendorRFPTable] (RFP_ID, VendorID, PermissionID) values (@rfpID, @vendorid, @permissionid)";
                    SqlCommand command = new SqlCommand(insertQry, connection);


                    command.Parameters.AddWithValue("@rfpID", rfpID);

                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }


            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }




        //this method will return the last RFP_ID registered in the RFITable
        public int GetLastRFP_IDinserted()
        {
            int id;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = "select MAX(RFP_ID) as Max from BHSCMS.dbo.RFPTable";
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                id = Convert.ToInt32(command.ExecuteScalar());
            }

            return id;
        }



        //this method will return the number of closed RFP
        public int CountClosedRFP()
        {
            int count;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = string.Format("select Count(RFP_ID) as Count from BHSCMS.dbo.RFPTable where EndDate< '{0}'", DateTime.Today.ToShortDateString());
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                count = Convert.ToInt32(command.ExecuteScalar());
            }

            return count;
        }


        //this method returns BHSCMS connection string
        protected string GetConnectionString()
        {
            string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
            return connString;
        }

    }
}