using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard
{
    public partial class DashboardVendor1 : System.Web.UI.Page
    {
        
        RFI i = new RFI();
        RFP p = new RFP();
        Contract ct = new Contract();
      
        int incompleteRfi;
        int incompleteRfp;
        int incompleteContracts;

        protected void Page_Load(object sender, EventArgs e)
        {
            SetLabels();

            if (!Page.IsPostBack)
            {
                SetLabels();
            }

        }


        protected void SetLabels()
        {
            int userid = UserInfoBoxControl.UserID;

            incompleteRfi = i.CountIncompleteRFI(userid);
            incompleteRfp = p.CountIncompleteRFP(userid);
           
            if (incompleteRfi > 0)
            {
                rfilink.Text = string.Format("You have {0} incompleted RFI", incompleteRfi);
            }

            if (incompleteRfp > 0)
            {
                rfplink.Text = string.Format("You have {0} incompleted RFP", incompleteRfp);
            }

            if (incompleteContracts > 0)
            {
                contractlink.Text = string.Format("You have {0} expired contracts", incompleteContracts);
            }



        }
    }
}