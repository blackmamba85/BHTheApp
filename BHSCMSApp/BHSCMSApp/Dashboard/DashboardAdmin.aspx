<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="DashboardAdmin.aspx.cs" Inherits="BHSCMSApp.Dashboard.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="background-color:white; width:100%">


          <div class="col-md-6">
              
              
              <div style="width:70%; margin-left:10px"><img  src="../img/notifications.png" class="img-responsive" alt="Responsive image" width="90%"/></div>
              <hr />
              <asp:HyperLink runat="server" ID="vendorlink" ForeColor="#5C5F60"></asp:HyperLink>
              <asp:label runat="server" ID="vendor"></asp:label>
              <br />
              <br />
              <asp:HyperLink runat="server" ID="rfilink" NavigateUrl="~/Dashboard/ManageRFI/ViewRFIList.aspx" ForeColor="#5C5F60"></asp:HyperLink>
              <asp:label runat="server" ID="rfi" ForeColor="#5C5F60"></asp:label>
              <br />
              <br />
               <asp:HyperLink runat="server" ID="rfplink" NavigateUrl="~/Dashboard/ManageRFP/ViewRFP.aspx" ForeColor="#5C5F60"></asp:HyperLink>
              <asp:label runat="server" ID="rfp" ForeColor="#5C5F60"></asp:label>
              <br />
              <br />
              <asp:HyperLink runat="server" ID="contractlink" NavigateUrl="~/Dashboard/ManageContract/ViewContracts.aspx" ForeColor="#5C5F60"></asp:HyperLink>
              <asp:label runat="server" ID="contract" ForeColor="#5C5F60"></asp:label>

             
          </div>
       <%-- <div class="col-md-1">
              
          </div>--%>

        <div class="col-md-6">
            <div style="width:70%; margin-left:10px"><img  src="../img/upcoming.png" class="img-responsive" alt="Responsive image" width="50%"/></div>

            <%--<h4> Upcoming Events:</h4>--%>
            <hr />
            <asp:Calendar runat="server" Width="60%" ID="calendar" TitleStyle-BackColor="#D06730" TitleStyle-ForeColor="White"
                 Font-Bold="true" TitleFormat="Month" SelectedDayStyle-BackColor="#539BBC" cellpadding="3" cellspacing="3"/>
              
              <hr />
               <asp:label runat="server" ID="lblRficlosing" ForeColor="#5C5F60"></asp:label>
              <br />
              
              <asp:label runat="server" ID="lblRfpclosing" ForeColor="#5C5F60"></asp:label>
              <br />
              
              <asp:label runat="server" ID="lblContracts" ForeColor="#5C5F60"></asp:label>
              <br />
            
              


            </div>


    </div>
  
          

          




         

    
     <br />
    <br />   
    <br />
    <br />  
    <br />   
 
 
</asp:Content>
