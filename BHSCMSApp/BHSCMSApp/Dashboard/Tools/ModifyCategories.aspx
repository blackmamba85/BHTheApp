<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ModifyCategories.aspx.cs" Inherits="BHSCMSApp.Dashboard.Tools.ModifyCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-6">
            <asp:Label runat="server" CssClass="col-md-6 control-label" Text="Current Categories:" />
            <br />

            <asp:ListBox ID="listBoxCategory" runat="server" Height="500px" style="padding:10px;" OnSelectedIndexChanged="listBoxCategory_SelectedIndexChanged"/>    
        </div>
        <div id="editCategoryDiv" runat="server" class="col-md-10">
            <asp:Label runat="server" Text="Edit Category" /><br /><br />
            <asp:HiddenField ID="hiddenCatID" runat="server" />
            <asp:TextBox ID="editCatName" runat="server"/><br />
            <asp:TextBox ID="editCatDescription" runat="server" TextMode="MultiLine" /><br /><br />
            <asp:Button ID="btnEditSubmit" runat="server" Text="Save"  OnClick="btnEditSubmit_Click"/>
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
            <asp:Button ID="btnEditCancel" runat="server" Text="Cancel"  OnClick="btnEditCancel_Click"/>
            
        </div>
        <div id="addCategoryDiv" class="col-md-10" runat="server">

            <asp:Label runat="server" Text="Add New Category" /><br />
            <asp:TextBox runat="server" ID="addCatName" /><br />
            <asp:TextBox runat="server" ID="addCatDescription" TextMode="MultiLine"/><br />

            <asp:Button ID="btnAdd" runat="server" Text="Add New Category" OnClick="btnAdd_Click" />

        </div>
    </div>

    

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    
</asp:Content>
