using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BHSCMSApp.Dashboard
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        DataTable dt;//DataTable use to store retrieved data

        private SysUser u = new SysUser();//instantiate a new user from User Class
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
            
        }

        private void BindGrid()
        {
            try
            {
                //Fetch data from BHSCMS database
                string connString = ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);
                
                conn.Open();

                string cmd = "select * from SysUserTable";
                SqlDataAdapter adapter = new SqlDataAdapter(cmd, conn);

                
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception e)
            {
                //System.Console.Error.Write(e.Message);

            }  
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("detail"))
            {
                string code = GridView1.DataKeys[index].Value.ToString();
                IEnumerable<DataRow> query = from i in dt.AsEnumerable()
                                             where i.Field<String>("UserID").Equals(code)
                                             select i;
                DataTable detailTable = query.CopyToDataTable<DataRow>();
                DetailsView1.DataSource = detailTable;
                DetailsView1.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#detailModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);
            }
            else if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = GridView1.Rows[index];
                lbluserID.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                txtNewUsername.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
                txtNewPassword.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text);
                txtNewPriEmail.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text);
                txtNewSecEmail.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text);
                txtNewRole.Text = HttpUtility.HtmlDecode(gvrow.Cells[8].Text);
                lblResult.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                string userid = GridView1.DataKeys[index].Value.ToString();
                hfCode.Value = userid;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddShowModalScript", sb.ToString(), false);

        }


        protected void btnAddRecord_Click(object sender, EventArgs e)
        {

            string userName = txtUserName.Text;
            string password = txtPassword.Text;
            string primaryEmail = txtPrimaryEmail.Text;
            string secondaryEmail = txtSecondaryEmail.Text;
            int roleID = Convert.ToInt32(txtRole.Text);
            
            
            u.RegisterUser(userName, password, primaryEmail, secondaryEmail, roleID);
            
            
            BindGrid();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Record Added Successfully');");
            sb.Append("$('#addModal').modal('hide');");
            sb.Append(@"</script>");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
            
            
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(lbluserID.Text);           
            string username = txtNewUsername.Text;
            string password = txtNewPassword.Text;
            string priEmail = txtNewPriEmail.Text;
            string secEmail = txtNewSecEmail.Text;
            int roleid = Convert.ToInt32(txtNewRole.Text);

            u.UpdateUser(username, password, priEmail, secEmail, roleid, userID);
           
            BindGrid();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Records Updated Successfully');");
            sb.Append("$('#editModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);

        }

        
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string userid = hfCode.Value;            
            
            u.DeleteUser(Convert.ToInt32(userid));         


            BindGrid();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Record deleted Successfully');");
            sb.Append("$('#deleteModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "delHideModalScript", sb.ToString(), false);           


        }   
       



    }
}