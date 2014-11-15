<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="NewVendor.aspx.cs" Inherits="BHSCMSApp.Dashboard.Register.NewVendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-4">
    <table class="table">
        <tr>
            <td>Company Name:
            <asp:TextBox ID="CompanyName" runat="server" MaxLength="100" CssClass="form-control">
            </asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CompanyName"
                 CssClass="text-danger" ErrorMessage="The company name field is required." />
            </td>
        </tr>
        
         <tr>
            <td>Phone Number:
            <asp:TextBox ID="PhoneNumber" runat="server" MaxLength="18" CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
            CssClass="text-danger" ErrorMessage="The phone number field is required." />
            <%--<asp:RegularExpressionValidator ID="phonevalid" runat="server" ErrorMessage="Phone Number is not valid" ControlToValidate="PhoneNumber" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />--%>
            </td>
        </tr>

         <tr>
            <td>Fax Number:
            <asp:TextBox ID="Fax" runat="server" MaxLength="10" CssClass="form-control">
            </asp:TextBox>
            </td>
        </tr>

         <tr>
            <td>Physical Address
            <asp:TextBox ID="PAddress" runat="server" MaxLength="75" CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="PAddress"
            CssClass="text-danger" ErrorMessage="The address field is required." />
            </td>
        </tr>

         <tr>
            <td>Billing Address:
            <asp:TextBox ID="BAddress" runat="server" MaxLength="75" CssClass="form-control">
            </asp:TextBox>
            </td>
        </tr>

         <tr>
            <td>City:
            <asp:TextBox ID="City" runat="server" MaxLength="30" CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="City"
            CssClass="text-danger" ErrorMessage="The City field is required." />
            </td>
        </tr>

         <tr>
            <td>State:
            <asp:TextBox ID="State" runat="server" MaxLength="2" CssClass="form-control">
            </asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="State"
                CssClass="text-danger" ErrorMessage="The state field is required." />
            </td>
        </tr>

        
         <tr>
            <td>Zip Code
            <asp:TextBox ID="ZipCode" runat="server" MaxLength="5" CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ZipCode"
            CssClass="text-danger" ErrorMessage="The Zip Code field is required." />
            </td>
        </tr>

        </table>
        <br />
        <br />
        </div>

        <div class="col-md-4">
       <table class="table">
         <tr>
            <td>TaxID:
            <asp:TextBox ID="TaxID" runat="server" MaxLength="15" CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="ValidTaxID" runat="server" ControlToValidate="TaxID"
            CssClass="text-danger" ErrorMessage="The TaxId field is required." />
            </td>
        </tr>


           <tr>
            <td>Email:
            <asp:TextBox ID="Email" runat="server" MaxLength="75" CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
            CssClass="text-danger" ErrorMessage="The email field is required." />
            <asp:RegularExpressionValidator ID="email1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="Email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td>Secondary Email:
            <asp:TextBox ID="EmailSec" runat="server" MaxLength="75" CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailSec"
            CssClass="text-danger" ErrorMessage="The Secondary Email field is required." />
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="EmailSec" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
            <asp:CompareValidator runat="server" ControlToValidate="EmailSec" ControltoCompare="Email" Type="String" Operator="NotEqual" ErrorMessage="Emails cannot be the same" />
            </td>
        </tr>


        <tr>
            <td>Product Categories:
                <asp:DropDownCheckBoxes ID="chkCommodities" runat="server" AddJQueryReference="True" UseSelectAllNode="True">
                <Style SelectBoxWidth="300" DropDownBoxBoxWidth="300" DropDownBoxBoxHeight="130" />
                <Texts SelectBoxCaption="Select from list" />
            </asp:DropDownCheckBoxes>
            </td>
        </tr>
        </table>
        <br />
        <br />
        </div>

   <div class="col-md-4">
       <table class="table">
           <tr>
               <td>Username:
                   <asp:TextBox ID="UserId" runat="server" CssClass="form-control">
                   </asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="UserId"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
                </td>
           </tr>

           <tr>
               <td>Password:
               <asp:TextBox ID="Password" TextMode="Password" MaxLength="20" runat="server" CssClass="form-control">
               </asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
                </td>
           </tr>

           <tr>
               <td>Confirm Password:
                   <asp:TextBox TextMode="Password" MaxLength="20" ID="ConPassword" runat="server" CssClass="form-control">
                   </asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="ConPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />

                    
               </td>
           </tr>

           <tr>
                <td>
                <asp:Button ID="addbutton" runat="server" Text="Submit" CssClass="btn btn-info" OnClick="addButton_Click" />
                </td>
           </tr>
       </table>
    

      <br />

    <br />


   </div>




</asp:Content>