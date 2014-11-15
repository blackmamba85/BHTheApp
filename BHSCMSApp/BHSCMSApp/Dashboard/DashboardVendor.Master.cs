using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard
{
    public partial class DashboardVendor : System.Web.UI.MasterPage
    {
        static SysUser u = new SysUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(Session["username"] as string))
            {
                UserInfoBoxControl.UserName = Session["username"].ToString();//sets the username label in the user control

                UserInfoBoxControl.UserID = u.GetUserIDbyUserName(UserInfoBoxControl.UserName); //sets the userid property in the user control

                UserInfoBoxControl.LastLogin = u.LoginDate(UserInfoBoxControl.UserID);//sets the last login label in the user control and updates the activitylogTable

                UserInfoBoxControl.RoleID = Convert.ToInt32(Session["roleid"].ToString());//sets the roleid in the usercontrol RoleID property

                switch (UserInfoBoxControl.RoleID)
                {
                    case 1:
                        UserInfoBoxControl.UserRole = "Administrator";
                        break;
                    case 2:
                        UserInfoBoxControl.UserRole = "Employee";
                        break;
                    case 3:
                        UserInfoBoxControl.UserRole = "Vendor";
                        break;
                    default:
                        UserInfoBoxControl.UserRole = "Unknown";
                        break;
                }

            }



        }
    }
}