using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BHSCMSApp;
using System.Data.SqlClient;
using System.Configuration;
using BHSCMSApp.Models;
using System.Data;

namespace BHSCMSApp
{
    public class Functions
    {
    }

    public sealed class FunctionsHelper
    {
        private FunctionsHelper()
        {
        }

        //Reads the contents of a file and returns it as string
        public static string GetFileContents(string FileName)
        {
            string functionReturnValue = null;
            System.IO.StreamReader objStreamReader = default(System.IO.StreamReader);
            objStreamReader = System.IO.File.OpenText(System.Web.HttpContext.Current.Server.MapPath(FileName));
            functionReturnValue = objStreamReader.ReadToEnd();
            objStreamReader.Close();
            return functionReturnValue;
        }



        //This funtion is used to store documents path in the DocumentTable

        public static void UploadDocument(DocumentFile file)

        {
            string connectionString = GetConnectionString();

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    string insertQry = "Insert into [BHSCMS].[dbo].[DocumentTable] ([TypeID], [ReferenceID], [DateStamp], Document_Data, Document_Name, Content_Type) values (@typeID, @referenceID, @datestamp, @data, @doc_Name, @contentType)";
                    SqlCommand command = new SqlCommand(insertQry, connection);
                    command.Parameters.AddWithValue("@typeID", file.TypeID);
                    command.Parameters.AddWithValue("@referenceID", file.ReferenceID);
                    command.Parameters.AddWithValue("@datestamp", DateTime.Today.ToShortDateString());
                    command.Parameters.AddWithValue("@data", file.FileData);
                    command.Parameters.AddWithValue("@doc_Name", file.FileName);
                    command.Parameters.AddWithValue("@contentType", file.ContentType);

                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

        }



        //This funtion is used to retrieve RFI closing dates for the following two months
        public static DataTable GetRFIClosingDates()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();//DataTable use to store retrieved data


            string connectionString = GetConnectionString();
            string strSQL = "";
            int thismonth = Convert.ToInt32(DateTime.Today.Month);
            int nextmonth = Convert.ToInt32(DateTime.Today.AddMonths(1).Month);
            int year = Convert.ToInt32(DateTime.Today.Year);

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    strSQL = string.Format(FunctionsHelper.GetFileContents("/Dashboard/SQL/RFIclosingdate.sql"), thismonth, nextmonth, year);
                    SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

                    adapter.Fill(ds);
                    dt = ds.Tables[0];
                    

                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

            return dt;

        }

        //This funtion is used to retrieve RFP closing dates for the following two months
        public static DataTable GetRFPClosingDates()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();//DataTable use to store retrieved data


            string connectionString = GetConnectionString();
            string strSQL = "";
            int thismonth = Convert.ToInt32(DateTime.Today.Month);
            int nextmonth = Convert.ToInt32(DateTime.Today.AddMonths(1).Month);
            int year = Convert.ToInt32(DateTime.Today.Year);

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    strSQL = string.Format(FunctionsHelper.GetFileContents("/Dashboard/SQL/RFPclosingdate.sql"), thismonth, nextmonth, year);
                    SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

                    adapter.Fill(ds);
                    dt = ds.Tables[0];


                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

            return dt;

        }


        //This funtion is used to retrieve COntracts expiring dates for the following two months
        public static DataTable GetContractExpiring()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();//DataTable use to store retrieved data


            string connectionString = GetConnectionString();
            string strSQL = "";
            int thismonth = Convert.ToInt32(DateTime.Today.Month);
            int nextmonth = Convert.ToInt32(DateTime.Today.AddMonths(1).Month);
            int year = Convert.ToInt32(DateTime.Today.Year);

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    strSQL = string.Format(FunctionsHelper.GetFileContents("/Dashboard/SQL/ContractExpiringdate.sql"), thismonth, nextmonth, year);
                    SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

                    adapter.Fill(ds);
                    dt = ds.Tables[0];


                }
            }

            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }

            return dt;

        }




        //this method returns BHSCMS connection string
        protected static string GetConnectionString()
        {
            string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
            return connString;
        }



    }
}