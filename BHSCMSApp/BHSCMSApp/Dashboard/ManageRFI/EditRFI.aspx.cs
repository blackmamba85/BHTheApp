using BHSCMSApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.ManageRFI
{
    public partial class EditRFI : System.Web.UI.Page
    {
        private int _rfiid;
        RFI rfi = new RFI();
        Employee emp = new Employee();

        List<int> vendorlist = new List<int>();
        List<int> permissionlist = new List<int>();
        List<string> companylist = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            _rfiid = Convert.ToInt32(Request.QueryString["rfiid"]);//gets and convert to int the rfiif passed in the querystring
           
            GetRFIData();
            if(!IsPostBack)
            { InitializeParticipantsAndViewers(); }
            ControlVendorBoxVisibility();
            gridEditVendors.Visible = false;
            btnVendorCancel.Visible = false;
        }

        private void InitializeParticipantsAndViewers()
        {
            DataTable dt = new DataTable();
            string qry = "Select VT.CompanyName, VRT.PermissionID From VendorTable VT Left Join VendorRFITable VRT ON VRT.VendorID = VT.VendorID Where VRT.RFI_ID = @rfiID";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
            {
                con.Open();
                using(SqlCommand com = new SqlCommand(qry,con))
                {
                    com.Parameters.AddWithValue("@rfiID", _rfiid);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(dt);
                    }
                }

            }

            if(dt != null && dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    string companyName = dr[0].ToString();
                    int permission = int.Parse(dr[1].ToString());
                    if(permission == 1)
                    {
                        listBoxParticipants.Items.Add(new ListItem(companyName));
                    }
                    else if(permission == 0 )
                    {
                        listBoxViewers.Items.Add(new ListItem(companyName));
                    }
                }

            }

            


        }

        private void ControlVendorBoxVisibility()
        {
            if (listBoxParticipants.Items.Count == 0)
                listBoxParticipants.Visible = false;
            else
                listBoxParticipants.Visible = true;
            if (listBoxViewers.Items.Count == 0)
                listBoxViewers.Visible = false;
            else
                listBoxViewers.Visible = true;
        }

        protected void rfi_Documents_Load(object sender, EventArgs e)
        {
            InitializeDocumentsListBox();
        }
        private void InitializeDocumentsListBox()
        {
            if(!Page.IsPostBack)
            {
                DataTable dt = InitializeRFIDocuments();
                foreach (DataRow dr in dt.Rows)
                {
                    //Put the name and the id in the Listitem so that it can be referenced when clicked
                    //See: rfi_Documents_SelectedIndexChanged
                    string docName = dr[1].ToString();
                    string doc_ID = dr[3].ToString();
                    ListItem li = new ListItem(docName, doc_ID);
                    rfi_Documents.Items.Add(li);
                }
            }
            

        }

        protected void GetRFIData()
        {          

            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);

                conn.Open();

                SqlCommand command = new SqlCommand(String.Format("Select R.RFI_ID, R.StartDate, R.EndDate, C.Category, R.CurrentPrice, R.ProductDescription from BHSCMS.dbo.RFITable R join BHSCMS.dbo.CategoryTable C on R.CategoryID=C.CategoryID Where R.RFI_ID={0}", _rfiid), conn);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    this.rfiid.Text = reader["RFI_ID"].ToString();
                    this.category.Text = reader["Category"].ToString();
                    this.StartDate.Text = Convert.ToDateTime(reader["StartDate"].ToString()).ToShortDateString();                    
                    this.EndDate.Text = Convert.ToDateTime(reader["EndDate"].ToString()).ToShortDateString();
                    this.txtcurrentPrice.Text = String.Format("{0:C}", Convert.ToDecimal(reader["CurrentPrice"]));
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
            Page.Response.Redirect("ViewRFIList.aspx");
        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
            string currentPrice;
            if (Convert.ToDateTime(Request.Form[EndDate.UniqueID]) < Convert.ToDateTime(Request.Form[StartDate.UniqueID]))
            {
                ErrorMessage.Visible = true;
                FailureText.Text = "Invalid date range";
            }
            else
            {

                currentPrice = Request.Form[txtcurrentPrice.UniqueID];
                currentPrice = currentPrice.Replace("$", string.Empty);
                    
                    
                rfi.UpdateRFI(UserInfoBoxControl.UserID, Request.Form[StartDate.UniqueID], Request.Form[EndDate.UniqueID], Convert.ToDecimal(currentPrice), Request.Form[productDescription.UniqueID].ToString(), _rfiid);
                UpdateVendorParticipation();

                Page.Response.Redirect("ViewRFIList.aspx");
            }

            
        }


        private void UpdateVendorParticipation()
        {
            string insertQry = "Insert into [BHSCMS].[dbo].[VendorRFITable] (RFI_ID, VendorID, PermissionID) Values (@rfiId, @vendorid, @permissionId)";
            

            foreach(GridViewRow gvr in gridEditVendors.Rows)
            {
                CheckBoxList chkBox = (CheckBoxList)gvr.FindControl("chkBoxList");
                if(chkBox.SelectedItem != null)
                {
                    if(chkBox.SelectedItem.Value == "1" || chkBox.SelectedItem.Value =="2" )
                    {
                        int vendorid = Convert.ToInt32(gridEditVendors.DataKeys[gvr.RowIndex].Values[1]);
                        int permissionid = Convert.ToInt32(chkBox.SelectedItem.Value);
                        string company = (gridEditVendors.DataKeys[gvr.RowIndex].Values[0]).ToString();

                        vendorlist.Add(vendorid);
                        permissionlist.Add(permissionid);
                    }
                }
            }

            int index = 0;
            foreach(var vendor in vendorlist)
            {
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;

                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand(insertQry, conn);
                conn.Open();

                cmd.Parameters.AddWithValue("@rfiId", _rfiid);
                cmd.Parameters.AddWithValue("@vendorid", vendor);
                cmd.Parameters.AddWithValue("@permissionId", permissionlist[index]);
                cmd.ExecuteNonQuery();


                conn.Close();

                index++;
            }

        }

        private DataTable InitializeRFIDocuments()
        {
            DataTable dt = new DataTable();
            string qry = "Select Document_Data, Document_Name, Content_Type, DocID From DocumentTable DT Where DT.TypeID = 2 AND DT.ReferenceID = @RFIID";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(qry, con))
                {
                    com.Parameters.AddWithValue("@RFIID", rfiid.Text);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(dt);
                    }
                }
            }
            return dt;
        }

        protected void rfi_Documents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string name = rfi_Documents.SelectedItem.Text;
            int id = int.Parse(rfi_Documents.SelectedValue);
            DataTable dt = InitializeRFIDocuments();
            foreach(DataRow dr in dt.Rows)
            {
                if (int.Parse(dr[3].ToString()).Equals(id))//Check to make sure the item is the same one
                {
                    byte[] data = dr[0] as byte[];
                    Response.ClearContent();
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + dr[1].ToString());
                    Response.ContentType = dr[2].ToString();
                    Response.AddHeader("Content-Length", data.Length.ToString());
                    Response.BinaryWrite(data);
                    Response.Flush();
                    Response.End();
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string qry = "Select VT.VendorID, VT.CompanyName From VendorTable VT Left Join SellTable ST on ST.VendorID = VT.VendorID Left Join CategoryTable CT on CT.CategoryID = ST.ID Where CT.Category = @Category";
            DataTable dt = new DataTable();
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
            {
                con.Open();
                using(SqlCommand com = new SqlCommand(qry,con))
                {
                    com.Parameters.AddWithValue("@Category", category.Text);
                    using(SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(dt);
                    }
                }
            }
            gridEditVendors.Visible = true;
            listBoxParticipants.Visible = false;
            listBoxParticipants.Visible = false;
            particpantsHeader.Visible = false;
            viewersHeader.Visible = false;
            Button1.Visible = false;
            btnVendorCancel.Visible = true;

            if(dt != null && dt.Rows.Count > 0)
            {
                gridEditVendors.DataSource = dt;
                gridEditVendors.DataBind();
            }

        }

        protected void btnVendorCancel_Click(object sender, EventArgs e)
        {
            listBoxParticipants.Visible = true;
            listBoxViewers.Visible = true;
            gridEditVendors.Visible = false;
            Button1.Visible = true;
            particpantsHeader.Visible = true;
            viewersHeader.Visible = true;

        }

        
    }
}