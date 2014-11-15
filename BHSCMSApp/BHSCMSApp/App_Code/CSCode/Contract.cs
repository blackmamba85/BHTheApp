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
    public class Contract
    {
        public Contract()
        {

        }

        //creates new Contract
        public void CreateNewContract(string title, string description, string startdate, string enddate, int vendorid, int userid, int rfpid, decimal contractprice)
        {
            string connectionString = GetConnectionString();

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    string insertQry = "Insert into [BHSCMS].[dbo].[ContractTable] (Title, Description, StartDate, EndDate, VendorID, UserID, RFP_ID, CreatedDate) values (@title, @description, @startdate, @enddate, @vendorid, @userid, @rfpid, @createddate)";
                    SqlCommand command = new SqlCommand(insertQry, connection);
                    command.Parameters.AddWithValue("@title", title);
                    command.Parameters.AddWithValue("@description", description);                   
                    command.Parameters.AddWithValue("@startdate", startdate);
                    command.Parameters.AddWithValue("@enddate", enddate);
                    command.Parameters.AddWithValue("@vendorid", vendorid);
                    command.Parameters.AddWithValue("@userid", userid);
                    command.Parameters.AddWithValue("@rfpid", rfpid);
                    command.Parameters.AddWithValue("@createddate", DateTime.Today.ToShortDateString());
                    command.Parameters.AddWithValue("@contractprice", contractprice);
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }


        //creates new Contract
        public void UpdateContract(string title, string description, string startdate, string enddate, int vendorid, int userid, int rfpid, decimal contractprice)
        {
            string connectionString = GetConnectionString();

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateQry = "update BHSCMS.dbo.ContractTable set Title=@title, Description=@description, StartDate=@startdate, EndDate=@enddate, VendorID=@vendorid, UserID=@userid, ContractPrice=@contractprice where ContractID=@id";

                    SqlCommand command = new SqlCommand(updateQry, connection);
                    command.Parameters.AddWithValue("@title", title);
                    command.Parameters.AddWithValue("@description", description);
                    command.Parameters.AddWithValue("@startdate", startdate);
                    command.Parameters.AddWithValue("@enddate", enddate);
                    command.Parameters.AddWithValue("@vendorid", vendorid);
                    command.Parameters.AddWithValue("@userid", userid);
                    command.Parameters.AddWithValue("@rfpid", rfpid);
                    command.Parameters.AddWithValue("@createddate", DateTime.Today.ToShortDateString());
                    command.Parameters.AddWithValue("@contractprice", contractprice);
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }


        //this method will return the last contractid registered in the ContractTAble
        public int GetLastContract_IDinserted()
        {
            int id;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = "select MAX(ContractID) as Max from BHSCMS.dbo.ContractTable";
                SqlCommand command = new SqlCommand(qry, connection);
                connection.Open();
                id = Convert.ToInt32(command.ExecuteScalar());
            }

            return id;
        }


        //this method will return the number of expired contracts
        public int CountExpiredContracts()
        {
            int count;
            string connectionString = GetConnectionString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string qry = string.Format("select Count(ContractID) as Count from BHSCMS.dbo.ContractTable where EndDate< '{0}'", DateTime.Today.ToShortDateString());
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