<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="DashboardVendor.aspx.cs" Inherits="BHSCMSApp.Dashboard.DashboardVendor1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  
    <div class="row" style="background-color:white; width:100%; height:300px">


          <div class="col-md-8">
              <h3>Welcome to Vendor Dashboard!!!</h3>
          </div>
        <div class="col-md-1">
              
          </div>

        <div class="col-md-4">
      
            <h4>Upcoming Events:</h4>
            <hr />
           <asp:Calendar runat="server" Width="100%" ID="calendar" TitleStyle-BackColor="#D06730" TitleStyle-ForeColor="White"
                 Font-Bold="true" TitleFormat="Month" SelectedDayStyle-BackColor="#539BBC" cellpadding="3" cellspacing="3"/>

                     <hr />
              <span class="glyphicon glyphicon-bullhorn">  </span> <asp:label runat="server" ID="day1" ForeColor="#5C5C5C"></asp:label>
              <br />
              
              <span class="glyphicon glyphicon-bullhorn"> </span> <asp:label runat="server" ID="day2" ForeColor="#5C5C5C"></asp:label>
              <br />
              
               <span class="glyphicon glyphicon-bullhorn"> </span> <asp:label runat="server" ID="day3" ForeColor="#5C5C5C"></asp:label>
              <br />
            
              <span class="glyphicon glyphicon-bullhorn"> </span> <asp:label runat="server" ID="day4" ForeColor="#5C5C5C"></asp:label>



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
    <br />   
    <br />
    <br /> 
     
    <br />
    <br />   
   
</asp:Content>
