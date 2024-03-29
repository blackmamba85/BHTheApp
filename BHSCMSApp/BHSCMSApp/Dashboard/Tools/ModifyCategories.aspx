﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ModifyCategories.aspx.cs" Inherits="BHSCMSApp.Dashboard.Tools.ModifyCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-xs-6">
            <asp:Label runat="server" CssClass="control-label" Text="Current Categories: Click to Modify" />
            <br />

            <br />

            <asp:ListBox ID="listBoxCategory" runat="server" Height="500px" style="padding:10px;" AutoPostBack="true" OnSelectedIndexChanged="listBoxCategory_SelectedIndexChanged"/>    
        </div>
        <div class="col-xs-6">
            <div id="editCategoryDiv" runat="server" >
            <asp:Label runat="server" Text="Edit Category" /><br /><br />
            <asp:HiddenField ID="hiddenCatID" runat="server" />
            <asp:TextBox ID="editCatName" runat="server" Width="400"/><br />
            <asp:TextBox ID="editCatDescription" runat="server" TextMode="MultiLine" /><br /><br />
            <asp:Button ID="btnEditSubmit" runat="server" CssClass="btn btn-info" Text="Save"  OnCommand="Modify_Command" CommandName="EditSubmit"/>
            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-info" Text="Delete" OnCommand="Modify_Command" CommandName="Delete"/>
            <asp:Button ID="btnEditCancel" runat="server" CssClass="btn btn-info" Text="Cancel" OnCommand="Modify_Command" CommandName="EditCancel"/>
            

        
        </div>
            <div id="addCategoryDiv" runat="server" >
                <br /><br />
            <asp:Label runat="server" Text="Add New Category" /><br />
            <asp:Label runat="server" Text="Name:" /><br />
            <asp:TextBox runat="server" ID="addCatName"  Width="400"/><br />
            <asp:Label runat="server" Text="Description:" /><br />
            <asp:TextBox runat="server" ID="addCatDescription" TextMode="MultiLine"/><br /><br />

            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-info" Text="Add New Category" OnCommand="Modify_Command" CommandName="Add" />

        </div>
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
