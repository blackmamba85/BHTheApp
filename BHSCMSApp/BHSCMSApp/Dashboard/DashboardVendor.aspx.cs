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
        public static List<DateTime> list = new List<DateTime>();

        protected void Page_Load(object sender, EventArgs e)
        {
            list.Add(DateTime.Today);
            list.Add(DateTime.Today.AddDays(2));
            list.Add(DateTime.Today.AddDays(4));
            list.Add(DateTime.Today.AddDays(6));


            foreach (DateTime dt in list)
            {
                calendar.SelectedDates.Add(dt);
            }

            day1.Text = string.Format("Neuro Sponges RFI closes on {0}", DateTime.Today.ToShortDateString());
            day2.Text = string.Format("Ace Bandages contract expires on {0}", DateTime.Today.AddDays(2).ToShortDateString());
            day3.Text = string.Format("Anesthesia Supplies RFP closes on {0}", DateTime.Today.AddDays(4).ToShortDateString());
            day4.Text = string.Format("Disposable sharps RFP closes on {0}", DateTime.Today.AddDays(6).ToShortDateString());
           

        }
    }
}