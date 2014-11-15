using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.Account
{
    public partial class VendorProfile : System.Web.UI.Page
    {
        private int userid;
        private string address1;
        private string address2;
        private string city;
        private string state;
        private string zipcode;

        protected void Page_Load(object sender, EventArgs e)
        {
            userid = UserInfoBoxControl.UserID;//gets user id from userinfoboxcontrol

            GetProfile();

            this.lbladdress.Text = String.Format("{0}, {1}, {2} {3}, {4}", address1, address2, city, state, zipcode);

        }

        public void GetProfile()
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/UserVendorDetails.sql"), userid);


                SqlCommand command = new SqlCommand(strSQL, conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    //this.lblVendorID.Text = reader["VendorID"].ToString();
                    //this.lblUserID.Text = reader["UserID"].ToString();
                    this.lblcompany.Text = reader["CompanyName"].ToString();
                    this.lblphone.Text = reader["PhoneNumber"].ToString();
                    this.lblfax.Text = reader["FaxNumber"].ToString();
                    address1 = reader["AddressLine1"].ToString();
                    address2 = reader["AddressLine2"].ToString();
                    city = reader["City"].ToString();
                    state = reader["State"].ToString();
                    zipcode = reader["ZipCode"].ToString();                   
                    this.lbltaxid.Text = reader["TaxID"].ToString();
                    this.lblusername.Text = reader["UserName"].ToString();
                    this.lblpassword.Text = reader["Password"].ToString();
                    this.lblpriemail.Text = reader["PrimaryEmail"].ToString();
                    this.lblsecemail.Text = reader["SecondaryEmail"].ToString();
                }


              


            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }
        }

        protected void editprofile_Click(object sender, EventArgs e)
        {
            string strSQL = "";

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                strSQL = string.Format(FunctionsHelper.GetFileContents("SQL/UserVendorDetails.sql"), userid);


                SqlCommand command = new SqlCommand(strSQL, conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    //this.lblVendorID.Text = reader["VendorID"].ToString();
                    //this.lblUserID.Text = reader["UserID"].ToString();
                    this.txtcompany.Text = reader["CompanyName"].ToString();
                    this.txtphone.Text = reader["PhoneNumber"].ToString();
                    this.txtfax.Text = reader["FaxNumber"].ToString();
                    this.txtaddress1.Text = reader["AddressLine1"].ToString();
                    this.txtaddress2.Text = reader["AddressLine2"].ToString();
                    this.txtcity.Text = reader["City"].ToString();
                    this.txtstate.Text = reader["State"].ToString();
                    this.txtZipcode.Text = reader["ZipCode"].ToString();
                    this.txttaxid.Text = reader["TaxID"].ToString();
                    this.txtusername.Text = reader["UserName"].ToString();
                    this.txtpassword.Text = reader["Password"].ToString();
                    this.txtpriemail.Text = reader["PrimaryEmail"].ToString();
                    this.txtsecemail.Text = reader["SecondaryEmail"].ToString();
                }




            }
            catch (Exception ex)
            {
                //System.Console.Error.Write(e.Message);

            }

            edit.Visible = true;
            profile.Visible = false;
        }

        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            edit.Visible = false;
            profile.Visible = true;
        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
            Vendor v = new Vendor();

            v.UpdateUser(this.txtusername.Text, this.txtpassword.Text, this.txtpriemail.Text, this.txtsecemail.Text, 3, userid);
            v.UpdateVendor(userid, this.txtcompany.Text, this.txtphone.Text, this.txtfax.Text, this.txtaddress1.Text, this.txtaddress2.Text, this.txtcity.Text, this.txtstate.Text, this.txtZipcode.Text, 2, Convert.ToInt32(this.txttaxid.Text));
            
            GetProfile();

            this.lbladdress.Text = String.Format("{0}, {1}, {2} {3}, {4}", address1, address2, city, state, zipcode);

            profile.Visible = true;
            edit.Visible = false;
        }

    }
}