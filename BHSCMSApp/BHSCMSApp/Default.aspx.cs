using BHSCMSApp.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BHSCMSApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //RegisterHyperLink.NavigateUrl = "Account/Register";
            ////OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }


        //protected void LogIn(object sender, EventArgs e)
        //{
        //    int result = 0;
        //    int roleid = 0;
                      
            
        //    if (IsValid)//Validation succeeded
        //    {               

        //        SysUser u = new SysUser(UserName.Text);
        //        result = u.FindUser(UserName.Text, Password.Text);
                

        //        if (result>0)
        //        {
        //            //gets the user role id
        //            roleid = u.GetUserRole(UserName.Text, Password.Text);

        //            //Store login variables in session
        //            Session["username"] = u.UserName;
        //            Session["roleid"] = roleid.ToString();               

                    
                    

        //            //based on the roleid redirects the user to the corresponding dashboard
        //            switch (roleid)
        //            {
        //                case 1:                        
        //                    Page.Response.Redirect("/Dashboard/DashboardAdmin.aspx");
        //                    break;
        //                case 2:
        //                    Page.Response.Redirect("/Dashboard/DashboardAdmin.aspx");
        //                    break;
        //                case 3:
        //                    Page.Response.Redirect("/Dashboard/DashboardVendor.aspx");
        //                    break;
        //                default:                            
        //                        FailureText.Text = "No credentials found.";
        //                        ErrorMessage.Visible = true;
        //                        break;                            
        //            }
                    
        //        }
        //        else
        //        {
        //            FailureText.Text = "Invalid username or password.";
        //            ErrorMessage.Visible = true;
        //        }

        //    }
        //}
    }
}