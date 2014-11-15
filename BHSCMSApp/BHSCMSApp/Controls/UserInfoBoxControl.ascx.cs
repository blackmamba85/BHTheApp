using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BHSCMSApp;

namespace BHSCMSApp.Controls
{
    public partial class UserInfoBoxControl : System.Web.UI.UserControl
    {
        private static string userName;        
        private static string userRole;
        private static int roleid;
        private static int userID;
        private static string lastLogin;
        //static SysUser u = new SysUser();

        

        protected void Page_Load(object sender, EventArgs e)
        {
            //HyperLink logout = (HyperLink)FindControl("logout");
            //logout.NavigateUrl = "~/Default.aspx";

            //HyperLink settings = (HyperLink)FindControl("settings");
            //settings.NavigateUrl = "/Dashboard/Account/Profile.aspx";


            //Session["username"] = Request.QueryString["u"];

            //UserName =(string)Session["username"];
           
            
            
            //string firstName = (string)(Session["First"]);
            //RoleID = Convert.ToInt32(Request.QueryString["r"]);



            //UserName =(string)Session["username"];
            //RoleID = Convert.ToInt32(Session["roleid"].ToString());
            //Session.Clear();

                //Page.Session["username"] = Server.HtmlEncode(userName);
                //Page.Session["roleid"] = Server.HtmlEncode(roleid.ToString());

                //UserID = u.GetUserIDbyUserName(UserName);
                //GetUserInfo();

                //if(Page.IsPostBack)
                //{

                //}

        }
        //Sets the role name property 
        //public void GetUserInfo()
        //{
        //    //UserName = HttpContext.Current.Session["username"].ToString();
        //    //RoleID = Convert.ToInt32(HttpContext.Current.Session["roleid"].ToString());
        //    //UserID = u.GetUserIDbyUserName(UserName);

        //    //LastLogin = u.LoginDate(UserID);

        //    switch (RoleID)
        //    {
        //        case 1:
        //            UserRole = "Administrator";
        //            break;
        //        case 2:
        //            UserRole = "Employee";
        //            break;
        //        case 3:
        //            UserRole = "Vendor";
        //            break;
        //        default:
        //            UserRole = "Unknown";                    
        //            break;
        //    }

        //}

        public string UserName
        {                    
            get { return userName; }
            set { userName = value; }
        }
            

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }


        public int RoleID
        {
            get { return roleid; }
            set { roleid = value; }
        }

        public string UserRole
        {
            get { return userRole; }
            set { userRole = value; }
        }

        public string LastLogin
        {
            get { return lastLogin; }
            set { lastLogin = value; }
        }

      
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Page.Response.Redirect("/Default.aspx");

        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            if(UserInfoBoxControl.roleid==3)
            {
                Page.Response.Redirect("/Dashboard/Account/VendorProfile.aspx");
            }
            else
            {
                Page.Response.Redirect("/Dashboard/Account/Profile.aspx");
            }
        }
    }
}