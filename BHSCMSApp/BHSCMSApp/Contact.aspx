<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BHSCMSApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     

    <div class="row">

     <div class="col-md-4"  style="height:600px; background-color:#E4DAD8;">
         <h3 class="headers">Contact Us</h3> 
          <hr />
         <p>Please complete the form below.</p>
         
         <br />
        <table style="margin-left:20px;">
            <!-- Name -->
            <tr>
                <td >
                    Name:</td>
                <td >
                    <asp:TextBox ID="txtName" runat="server" Columns="40" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ValidationGroup="contact"
                                CssClass="text-danger" ErrorMessage="Please enter your name." />
                </td>
            </tr>


            <tr>
                <td >
                    Email:</td>
                <td >
                    <asp:TextBox ID="txtEmail" runat="server" Columns="40" CssClass="form-control"></asp:TextBox>
                     <asp:RegularExpressionValidator runat="server" CssClass="text-danger" ValidationGroup="contact"
                     ErrorMessage="Invalid Email" ControlToValidate="txtEmail" SetFocusOnError="True" 
                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>

            
            <!-- Subject -->
            <tr>
                <td >
                    Subject:
                </td>
                <td>
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                        <asp:ListItem>Ask a question</asp:ListItem>
                        <asp:ListItem>Report a bug</asp:ListItem>
                        <asp:ListItem>Customer support ticket</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
 
            <!-- Message -->
            <tr>
                <td >
                    Message:
                </td>
                <td>
                    <asp:TextBox ID="txtMessage" runat="server" Columns="40" Rows="5" TextMode="MultiLine" CssClass="form-control" style="resize:none"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage" ValidationGroup="contact" CssClass="text-danger" ErrorMessage="Please enter your message." />
                </td>
            </tr>
 
            <!-- Submit -->
            <tr >
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" ValidationGroup="contact" CssClass="btn btn-info" OnClick="btnSubmit_Click"/>
                </td>
            </tr>
         
            <!-- Results -->
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblResult" runat="server" CssClass="text-danger"></asp:Label>
                </td>
            </tr>
        </table>
         <br />
         <br />
         </div>


        <div class="col-md-4"  style="height:600px">
                  <br />
    <h4>Where are we?</h4>
                 <br />
                 <p>We are located in:</p>
                 <address>
        
        2701 Eastpoint Pkwy <br />
        Louisville, KY 40223<br />
        
    </address>
            <div class="embed-responsive embed-responsive-16by9">
<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=2701+Eastpoint+Pkwy,+Louisville,+KY+40223&amp;aq=&amp;sll=38.216885,-85.764317&amp;sspn=0.055297,0.056562&amp;ie=UTF8&amp;hq=&amp;hnear=2701+Eastpoint+Pkwy,+Louisville,+Kentucky+40223&amp;t=m&amp;z=14&amp;iwloc=A&amp;ll=38.282686,-85.509237&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=2701+Eastpoint+Pkwy,+Louisville,+KY+40223&amp;aq=&amp;sll=38.216885,-85.764317&amp;sspn=0.055297,0.056562&amp;ie=UTF8&amp;hq=&amp;hnear=2701+Eastpoint+Pkwy,+Louisville,+Kentucky+40223&amp;t=m&amp;z=14&amp;iwloc=A&amp;ll=38.282686,-85.509237" style="color:#0000FF;text-align:left">View Larger Map</a></small>    </div>
            </div>
             







         <div class="col-md-4"  style="height:600px">
   
    <br />
    
     <h5>Email Address:</h5>
    <address>
        <strong>Web Master:</strong>   <a href="mailto:annia.martinez@louisville.edu">annia.martinez@louisville.edu</a><br />
        <strong>Support:</strong> <a href="mailto:Marketing@example.com">support@baptisthealth.com</a><br />
        Our main phone number: (502) 896-5000
    </address>
             </div>


             
             

    </div>
</asp:Content>
