<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="DeleteVendor.aspx.cs" Inherits="BHSCMSApp.Dashboard.Account.DeleteVendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function ClientDeleteMessage() {
            var response = confirm("Are you sure?");
            document.getElementById("ClientMediator").value = response;
        }

    </script>

    <asp:HiddenField ID="ClientMediator" runat="server" />
     <div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
              <br />


    <h5>Vendor Information:</h5>

       <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered table-hover" Width="70%" BackColor="White" ForeColor="Black" FieldHeaderStyle-Wrap="true" FieldHeaderStyle-Font-Bold="true" FieldHeaderStyle-BackColor="#EEEEEE" FieldHeaderStyle-ForeColor="Black" BorderStyle="Groove" AutoGenerateRows="False">
                                <Fields>                                    
                                    
                                    <asp:BoundField DataField="VendorID" HeaderText="VendorID"/>
                                    <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                                    <asp:BoundField DataField="FaxNumber" HeaderText="Fax Number" />
                                    <asp:BoundField DataField="AddressLine1" HeaderText="AddressLine1" />
                                    <asp:BoundField DataField="AddressLine2" HeaderText="AddressLine2" />
                                    <asp:BoundField DataField="City" HeaderText="City" />
                                    <asp:BoundField DataField="State" HeaderText="State" />
                                    <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                    <asp:BoundField DataField="TaxID" HeaderText="TaxID" />
                                    <asp:BoundField DataField="RegistrationDate" HeaderText="RegistrationDate" />

                                    
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" />
                                    <asp:BoundField DataField="UserName" HeaderText="Username" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" />
                                    <asp:BoundField DataField="PrimaryEmail" HeaderText="Primary Email" />
                                    <asp:BoundField DataField="SecondaryEmail" HeaderText="Secondary Email" />
                                    
                                </Fields>
                            </asp:DetailsView>
                  <asp:Button runat="server" Text="Delete" CssClass="btn btn" ID="btnDeleteVendor" OnClientClick="ClientDeleteMessage();"  OnClick="btnDeleteVendor_Click"  />
                  <asp:Button runat="server" Text="Go Back" CssClass="btn btn" ID="btnGoBack" OnClick="btnGoBack_Click" />
              <br />
                        <br />
                   </div>
       
         </div>
     <br />
    <br />   
    <br />
    <br /> 

</asp:Content>
