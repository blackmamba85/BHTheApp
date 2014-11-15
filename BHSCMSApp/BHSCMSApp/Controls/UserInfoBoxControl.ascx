<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfoBoxControl.ascx.cs" Inherits="BHSCMSApp.Controls.UserInfoBoxControl" %>

<div style="float:right; text-align:right;" class="userControl" >

    <div class="dropdown dropdown-menu-right">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" style="color:#428bca; font-weight:bold; font-size:medium; font-family:Calibri">Welcome back <%= this.UserName %>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1" >
    <li role="presentation"><a><asp:Button runat="server" BorderStyle="None" Text="User Profile" BackColor="Transparent" ID="btnProfile" OnClick="btnProfile_Click" /><span class="glyphicon glyphicon-cog"></span></a>
        
        
        <%--<a role="menuitem" tabindex="1" href="/Dashboard/Account/Profile.aspx">User Profile <span class="glyphicon glyphicon-cog"></span></a></li>--%>
    <li><a><asp:Button runat="server" BorderStyle="None" Text="Log Out" BackColor="Transparent" ID="btnlogout" OnClick="btnlogout_Click"/><span class="glyphicon glyphicon-off"></span></a></li>
      <%--<li role="presentation"><a role="menuitem" tabindex="1" id="logout" href="/Default.aspx">Log Out <span class="glyphicon glyphicon-off"></span></a></li>--%>    
  </ul>
</div>


    
   


   <%-- <asp:label runat="server" style="color:#17649A; font-weight:bold; background-color:white; border-radius:4px; padding:4px">Welcome back <%= this.UserName %>!!!</asp:label>
    <br />
    <asp:HyperLink runat="server" ID="settings"><b style="background-color:white; border-radius:4px; padding:4px">Settings <span class="glyphicon glyphicon-cog"></span></b></asp:HyperLink>
    <asp:HyperLink runat="server" ID="LogOut"><b style="background-color:white; border-radius:4px; padding:4px">Log Out</b></asp:HyperLink>--%>



<b style="font-size:small">You are logged in as <%=this.UserRole %></b>
<br />
<b style="font-size:smaller">Last login on <%=this.LastLogin %></b>
 
<%--<asp:HyperLink runat="server" ID="LogOut"><b style="color:#17649A; background-color:white; border-radius:4px; padding:4px">Log Out</b></asp:HyperLink>--%>
    <br />
    <script>
     
    </script>
</div>

