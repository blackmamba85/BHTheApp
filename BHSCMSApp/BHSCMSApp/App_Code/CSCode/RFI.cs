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
    public class RFI
    {       

        public RFI()//Empty RFI constructor
        {

        }


        //creates new RFI
        public void CreateNewRFI(int userid, string startdate, string enddate, int categoryid, decimal currentPrice, string productDescr)
        {
            string connectionString = GetConnectionString();
            
            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    string insertQry = "Insert into [BHSCMS].[dbo].[RFITable] (UserID, StartDate, EndDate, CategoryID, CreatedDate, CurrentPrice, ProductDescription) values (@userid, @startdate, @enddate, @categoryid, @createddate, @currentprice, @productdescription)";
                    SqlCommand command = new SqlCommand(insertQry, connection);
                    command.Parameters.AddWithValue("@userid", userid);
                    command.Parameters.AddWithValue("@startdate", startdate);
                    command.Parameters.AddWithValue("@enddate", enddate);
                    command.Parameters.AddWithValue("@categoryid", categoryid);
                    command.Parameters.AddWithValue("@createddate", DateTime.Today.ToShortDateString());
                    command.Parameters.AddWithValue("@currentprice", currentPrice);
                    command.Parameters.AddWithValue("@productdescription", productDescr);
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        public void AddVendorstoRFI(int rfiID, List<int> vendorid, List<int> permissionID)
        {
            string connectionString = GetConnectionString();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string insertQry = "Insert into [BHSCMS].[dbo].[VendorRFITable] (RFI_ID, VendorID, PermissionID) values (@rfiID, @vendorid, @permissionid)";
                    SqlCommand command = new SqlCommand(insertQry, connection);


                    command.Parameters.AddWithValue("@rfiID", rfiID);
                 
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }

            
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }


        //this method will return the last RFI_ID registered in the RFITable
        public int GetLastRFI_IDinserted()
        {
            int id;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = "select MAX(RFI_ID) as Max from BHSCMS.dbo.RFITable";
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                id = Convert.ToInt32(command.ExecuteScalar());
            }

            return id;
        }





        //Updates existing RFI
        public void UpdateRFI(int userid, string startdate, string enddate, decimal currentPrice, string productdescription, int id)
        {

            string connectionString = GetConnectionString();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateQry = "update BHSCMS.dbo.RFITable set UserID=@userid, StartDate=@startdate, EndDate=@enddate, ModifiedDate=@modifieddate, CurrentPrice=@currentprice, ProductDescription=@productdescription where RFI_ID=@id";

                    SqlCommand updateCmd = new SqlCommand(updateQry, connection);

                    updateCmd.Parameters.AddWithValue("@userid", userid);
                    updateCmd.Parameters.AddWithValue("@startdate", startdate);
                    updateCmd.Parameters.AddWithValue("@enddate", enddate);
                    //updateCmd.Parameters.AddWithValue("@categoryid", categoryid);
                    updateCmd.Parameters.AddWithValue("@modifieddate", DateTime.Today.ToShortDateString());
                    updateCmd.Parameters.AddWithValue("@currentprice", currentPrice);
                    updateCmd.Parameters.AddWithValue("@productdescription", productdescription);
                    updateCmd.Parameters.AddWithValue("@id", id);
                    updateCmd.ExecuteNonQuery();
                }

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }

        //Updates existing RFI status
        public void UpdateRFIStatus(int rfiId, int vendorId)
        {

            string connectionString = GetConnectionString();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateQry = "update BHSCMS.dbo.VendorRFITable set IsCompleted=1 where RFI_ID=@id and VendorID=@vendorid";

                    SqlCommand updateCmd = new SqlCommand(updateQry, connection);                    
                    updateCmd.Parameters.AddWithValue("@id", rfiId);
                    updateCmd.Parameters.AddWithValue("@vendorid", vendorId);
                    updateCmd.ExecuteNonQuery();
                }

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }


        //this method will return the number of closed RFI
        public int CountClosedRFI()
        {
            int count;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = string.Format("select Count(RFI_ID) as Count from BHSCMS.dbo.RFITable where EndDate< '{0}'", DateTime.Today.ToShortDateString());
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                count = Convert.ToInt32(command.ExecuteScalar());
            }

            return count;
        }


        //this method will return the number incomplete RFI for the vendor using userID
        public int CountIncompleteRFI(int userid)
        {
            int count;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = string.Format("select Count(RFI_ID) as Count from BHSCMS.dbo.VendorRFITable VR inner join BHSCMS.dbo.VendorTable V on VR.VendorID=V.VendorID  where IsCompleted=0 and V.UserID={0}", userid);
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