using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace BHSCMSApp
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string email = txtEmail.Text;
            string name = txtName.Text;
            string message = txtMessage.Text;
           

            try
            {
                

                //Create the msg object to be sent
                MailMessage msg = new MailMessage();
                //Add your email address to the recipients
                 msg.To.Add("miniwheatsnb@gmail.com");
                //Configure the address we are sending the mail from
                MailAddress address = new MailAddress(email);
                msg.From = address;
                //Append their name in the beginning of the subject
                msg.Subject = name + " :  " + ddlSubject.Text;
                msg.Body = message;

                //Configure an SmtpClient to send the mail.
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true; //only enable this if your provider requires it
                ////Setup credentials to login to our sender email address ("UserName", "Password")
                client.Credentials = new System.Net.NetworkCredential("miniwheatsnb@gmail.com", "34kannon34");
                //NetworkCredential credentials = new NetworkCredential("miniwheatsnb@gmail.com", "34kannon34");
                //client.Credentials = credentials;


                //Send the msg
                client.Send(msg);

                //Display some feedback to the user to let them know it was sent
                lblResult.Text = "Your message was sent!";

                //Clear the form
                //txtName.Text = "";
                //txtMessage.Text = "";
            }
            catch
            {
                //If the message failed at some point, let the user know
                lblResult.Text = "Your message failed to send, please try again.";
            }

        }
    }
}