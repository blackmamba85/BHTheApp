using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.ManageCode
{
    public partial class RegCode : System.Web.UI.Page
    {

        string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            string qry = "Select RegistrationCode from [BHSCMS].[dbo].[RegistrationTable]";

            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(qry, conn);
            conn.Open();


            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                currentCode.Text = dr.GetValue(0).ToString();

            }

            conn.Close();

        }

        protected void submitCode_Click(object sender, EventArgs e)
        {

            string qry = "Update [BHSCMS].[dbo].[RegistrationTable]" + " Set RegistrationCode = @RegistrationCode" + " Where RegID=1";


            SqlConnection conn = new SqlConnection(connString);
            SqlCommand noncmd = conn.CreateCommand();

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(qry, conn);

                cmd.Parameters.Add("@RegistrationCode", SqlDbType.VarChar, 10, "RegistrationCode");

                cmd.Parameters["@RegistrationCode"].Value = regCode.Text;
                cmd.ExecuteNonQuery();
            }

            catch (SqlException ex)
            {

            }

            finally
            {
                conn.Close();
            }

        }


    }
}