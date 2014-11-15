<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="BHSCMSApp.Dashboard.Register.NewEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="table">
        <%--<tr>
            <td>EmpID: 
                <asp:TextBox ID="txtEmpID" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validEmpID" ControlToValidate="txtEmpID" runat="server" CssClass="text-danger" 
                    ErrorMessage="A Employee ID is required."/>
            </td>
        </tr>--%>
        <tr>
            <td>Role : 
                <asp:DropDownList ID="ddrole" runat="server" CssClass="form-control" Width="15%">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>
                </asp:DropDownList>                                
                <asp:RequiredFieldValidator ID="validRole" ControlToValidate="ddrole" runat="server" CssClass="text-danger"
                    ErrorMessage="A role must be selected." />
            </td>
        </tr>
            <tr>
                <td>Last Name : 
                    <asp:TextBox ID="txtLast" runat="server" CssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="validLastName" ControlToValidate="txtLast" runat="server" CssClass="text-danger" 
                         ErrorMessage="A last name is required."/>
                </td>
            </tr>
            <tr>
                <td>First Name : 
                    <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="validFirstName" ControlToValidate="txtFirst" runat="server" CssClass="text-danger"
                        ErrorMessage="A first name is required." />
                </td>
            </tr>                               
            <tr>
               <td>Username : 
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="validUserName" runat="server" CssClass="text-danger" ControlToValidate="txtUsername"
                         ErrorMessage="A username is required." />
                </td>
            </tr>
            <tr>
                <td>Password : 
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="validPassword" runat="server" CssClass="text-danger" ControlToValidate="txtPassword"
                        ErrorMessage="A password is required." />
                </td>
            </tr>
            <tr>        
                <td>Primary Email:
                    <asp:TextBox ID="txtPriEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validPriEmail" runat="server" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                        CssClass="text-danger" ControlToValidate="txtPriEmail" ErrorMessage="A valid email address is required." />
                </td>
            </tr>
            <tr>
                <td>Secondary Email:
                    <asp:TextBox ID="txtSecEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="Submit" CssClass="btn btn-info" OnClick="btnAdd_Click" />
                </td>
            </tr>                               
        </table>
    <br />
    <br />
</asp:Content>
