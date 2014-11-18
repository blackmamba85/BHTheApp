using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Drawing;
using System.Data;
using System.Text;

namespace BHSCMSApp.Dashboard
{
    public partial class WebForm1 : System.Web.UI.Page
    {        
        DataTable rfidt;//DataTable use to store retrieved data
        DataTable rfpdt;
        DataTable contractdt;
             

        public static List<DateTime> rfidates = new List<DateTime>();
        public static List<string> rfiproducts = new List<string>();

        public static List<DateTime> rfpdates = new List<DateTime>();
        public static List<string> rfpproducts = new List<string>();

        public static List<DateTime> contractdates = new List<DateTime>();
        public static List<string> contractproducts = new List<string>();
        
        Vendor v = new Vendor();
        RFI i = new RFI();
        RFP p = new RFP();
        Contract ct = new Contract();
        int pendingvendors;
        int closedRfi;
        int closedRfp;
        int expiringContracts;

        protected void Page_Load(object sender, EventArgs e)
        {
            SetLabels();

            SetCalendar();                     
                            

            if(!Page.IsPostBack)
            {
              
            }
           
        }

   
        protected void SetLabels()
        {
            pendingvendors = v.CountPendingVendors();
            closedRfi = i.CountClosedRFI();
            closedRfp = p.CountClosedRFP();
            expiringContracts = ct.CountExpiredContracts();
            
            if (pendingvendors>0)
            {
                vendorlink.Text = string.Format("You have {0} new vendors waiting for approval", pendingvendors);
                vendorlink.NavigateUrl = string.Format("/Dashboard/Account/ManageVendors.aspx?status={0}", 3);
            }

            if (closedRfi>0)
            {
                rfilink.Text = string.Format("You have {0} closed RFI waiting for decision", closedRfi);
            }
            
            if (closedRfp>0)
            {
                rfplink.Text = string.Format("You have {0} closed RFP waiting for decision", closedRfp);
            }

            if (expiringContracts>0)
            {
                contractlink.Text = string.Format("You have {0} expired contracts", expiringContracts);
            }
            
           

        }

        protected void SetCalendar()
        {
            StringBuilder builderRFIclosing = new StringBuilder();
            StringBuilder builderRFPclosing = new StringBuilder();
            StringBuilder builderexpiringContracts = new StringBuilder();

            rfidt = FunctionsHelper.GetRFIClosingDates();
            rfpdt = FunctionsHelper.GetRFPClosingDates();
            contractdt = FunctionsHelper.GetContractExpiring();

            rfidates = (from dr in rfidt.AsEnumerable()
                        select dr.Field<DateTime>("EndDate")).ToList<DateTime>();

            rfiproducts = (from dr in rfidt.AsEnumerable()
                           select dr.Field<string>("ProductDescription")).ToList<string>();


            rfpdates = (from dr in rfpdt.AsEnumerable()
                        select dr.Field<DateTime>("EndDate")).ToList<DateTime>();

            rfpproducts = (from dr in rfpdt.AsEnumerable()
                           select dr.Field<string>("ProductDescription")).ToList<string>();

            contractdates = (from dr in contractdt.AsEnumerable()
                        select dr.Field<DateTime>("EndDate")).ToList<DateTime>();

            contractproducts = (from dr in contractdt.AsEnumerable()
                           select dr.Field<string>("ProductDescription")).ToList<string>();




            foreach (DateTime dt in rfidates)
            {
                calendar.SelectedDates.Add(dt);               

            }


            foreach (DateTime dt in rfpdates)
            {
                calendar.SelectedDates.Add(dt);

            }


            foreach (DateTime dt in contractdates)
            {
                calendar.SelectedDates.Add(dt);

            }

           

            foreach(string rfi in rfiproducts)
            {
                int index = 0;
                string date = rfidates[index].ToShortDateString();
                
                builderRFIclosing.Append(rfi).Append(" is closing on: ").AppendFormat(date).Append("<br />"); // Append string to StringBuilder
                index++;
            }


            foreach (string rfp in rfpproducts)
            {
                int index = 0;
                string date = rfpdates[index].ToShortDateString();

                builderRFPclosing.Append(rfp).Append(" is closing on: ").AppendFormat(date).Append("<br />"); // Append string to StringBuilder
                index++;
            }


            foreach (string crt in contractproducts)
            {
                int index = 0;
                string date = contractdates[index].ToShortDateString();

                builderexpiringContracts.Append(crt).Append(" is closing on: ").AppendFormat(date).Append("<br />"); // Append string to StringBuilder
                index++;
            }

            lblRficlosing.Text = builderRFIclosing.ToString();
            lblRfpclosing.Text = builderRFPclosing.ToString();
            lblContracts.Text = builderexpiringContracts.ToString();


             
        }
    }
}