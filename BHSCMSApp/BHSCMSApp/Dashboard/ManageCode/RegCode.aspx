<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="RegCode.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageCode.RegCode" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-md-8">
         <h3 class="headers">Manage Code</h3> 
          <hr />


        <div class="align-center">
            <asp:Label runat="server" AssociatedControlID="currentCode" CssClass="col-md-4">Current Registration Code</asp:Label>
            <div class="align-center">
                <asp:TextBox runat="server" ID="currentCode" CssClass="form-control" ReadOnly="true" BackColor="Gray" style="color:black; font:bold;" />
            </div>
        </div>



        <div class="align-center">
            <asp:Label runat="server" AssociatedControlID="regCode" CssClass="col-md-4">Enter New Registration Code</asp:Label>
            <div class="align-center">
                <asp:TextBox runat="server" ID="regCode" MaxLength="10" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="regCode" ValidationGroup="modify"
                    CssClass="text-danger" ErrorMessage="The Registration Code is required." />
            </div>
        </div>


        <div class="align-center">
            <div class="align-center">
            <asp:Button runat="server" OnClick="submitCode_Click" Text="Submit" Width="40%" CssClass="btn btn-info" CausesValidation="true" ValidationGroup="modify" />
            </div>
        </div>




    </div>





</asp:Content>
