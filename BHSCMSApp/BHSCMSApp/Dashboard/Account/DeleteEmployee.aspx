<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="DeleteEmployee.aspx.cs" Inherits="BHSCMSApp.Dashboard.Account.DeleteEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function ClientDeleteMessage() {
            var response = confirm("Are you sure?");
            document.getElementById("ClientMediator").value = response;
        }

    </script>

    <asp:HiddenField ID="ClientMediator" ClientIDMode="Static" runat="server" />
    <div class="row" style="background-color:white; width:100%; height:450px">
          <div class="col-md-12">
      <h4>Employee Information:</h4>
     
                            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black" Width='70%' FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true"  FieldHeaderStyle-BackColor="#EEEEEE" FieldHeaderStyle-ForeColor="Black" BorderStyle="Groove" AutoGenerateRows="False">
                                <Fields>                                    
                                    
                                    <asp:BoundField DataField="EmpID" HeaderText="EmployeeID" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                    <asp:BoundField DataField="Name" HeaderText="Role" />
                                    
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" />
                                    <asp:BoundField DataField="UserName" HeaderText="Username" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" />
                                    <asp:BoundField DataField="PrimaryEmail" HeaderText="Primary Email" />
                                    <asp:BoundField DataField="SecondaryEmail" HeaderText="Secondary Email" />
                                    
                                </Fields>
                            </asp:DetailsView>
                  <asp:Button runat="server" Text="Delete" CssClass="btn btn" ID="btnDelete" OnClientClick="ClientDeleteMessage();"  OnClick="btnDelete_Click"/>
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
