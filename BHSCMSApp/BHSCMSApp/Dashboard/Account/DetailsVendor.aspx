<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="DetailsVendor.aspx.cs" Inherits="BHSCMSApp.Dashboard.Register.DetailsVendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


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
                                      
                                     <asp:TemplateField HeaderText="Primary Email">
                                        <ItemTemplate>
                                      <asp:HyperLink ID="priEmail" runat="server" ToolTip="Click send email"
                                        NavigateUrl='<%# Eval("PrimaryEmail", "mailto:{0}") %>'
                                        Text='<%# Eval("PrimaryEmail") %>'>
                                     </asp:HyperLink>
                                      </ItemTemplate>
                                     </asp:TemplateField>

                                      <asp:TemplateField HeaderText="Secondary Email">
                                        <ItemTemplate>
                                      <asp:HyperLink ID="secEmail" runat="server" ToolTip="Click send email"
                                        NavigateUrl='<%# Eval("SecondaryEmail", "mailto:{0}") %>'
                                        Text='<%# Eval("SecondaryEmail") %>'>
                                     </asp:HyperLink>
                                      </ItemTemplate>
                                     </asp:TemplateField>
                                    
                                </Fields>
                            </asp:DetailsView>
                  <asp:Button runat="server" Text="Go Back" CssClass="btn btn" ID="back" OnClick="back_Click"/>
              <br />
                        <br />
                   </div>
       
         </div>
     <br />
    <br />   
    <br />
    <br /> 

  
</asp:Content>
