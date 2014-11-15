<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="DetailsEmployee.aspx.cs" Inherits="BHSCMSApp.Dashboard.Register.DetailsEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="row" style="background-color:white; width:100%; height:450px">
          <div class="col-md-12">
      <h4>Employee Information:</h4>
     
                            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black" Width='70%' FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true"  FieldHeaderStyle-BackColor="#EEEEEE" FieldHeaderStyle-ForeColor="Black" BorderStyle="Groove" AutoGenerateRows="False">
                                <Fields>                                    
                                    
                                    <asp:BoundField DataField="EmpID" HeaderText="EmployeeID" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                    <asp:BoundField DataField="Role" HeaderText="Role" />
                                    
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" />
                                    <asp:BoundField DataField="UserName" HeaderText="Username" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" />
                                    
                                    <asp:TemplateField HeaderText="Primary Email">
                                        <ItemTemplate>
                                      <asp:HyperLink ID="priEmail" runat="server" ToolTip="Click to send email"
                                        NavigateUrl='<%# Eval("PrimaryEmail", "mailto:{0}") %>'
                                        Text='<%# Eval("PrimaryEmail") %>'>
                                     </asp:HyperLink>
                                      </ItemTemplate>
                                     </asp:TemplateField>

                                      <asp:TemplateField HeaderText="Secondary Email">
                                        <ItemTemplate>
                                      <asp:HyperLink ID="secEmail" runat="server" ToolTip="Click to send email"
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
