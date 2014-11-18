<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="BHSCMSApp.Dashboard.Tools.Reports" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
    <link href="../../Content/report.css" rel="stylesheet" />

     <div class="row" style="background-color:white; width:100%">
      <div class="col-md-12">
              



<div id="accordian">
  <ul>
      <li>
      <h3><span class="glyphicon glyphicon-calendar"></span>Select date range:</h3>
                           
      <ul style="height:60px">          
                   
          <asp:Label runat="server" AssociatedControlID="StartDate" ForeColor="#5C5F60">Start Date</asp:Label>
          <asp:TextBox ID="StartDate" runat="server" ReadOnly="true" /> 
       
          <asp:Label runat="server" AssociatedControlID="EndDate" ForeColor="#5C5F60">End Date</asp:Label>
          <asp:TextBox ID="EndDate" runat="server" ReadOnly="true"/>      
           
                           
           <asp:Button  runat="server" CssClass="btn btn" Text="Apply" ID="btnDateApply" OnClick="btnDateApply_Click" ToolTip="Populate RFP dropdown in the date range"/>
            
         
         
      </ul>
      
         
    </li>
      <li>
      <h3><span class="glyphicon glyphicon-file"></span>Select RFP</h3>
      <ul style="height:60px">
        <asp:DropDownList runat="server" AutoPostBack="true" ForeColor="#5C5F60" ID="ddlrfp" placeholder="Select RFP...">
           
        </asp:DropDownList>
         
      </ul>  
    </li>
   

    <%--<li>
      <h3><span class="glyphicon glyphicon-stats"></span>Charts</h3>
      <ul style="height:60px">
          <asp:RadioButtonList runat="server" ID="RadioButtonList1" ForeColor="#5C5F60">
              <asp:ListItem Value="1">Bar chart</asp:ListItem>
              <asp:ListItem Value="2">None</asp:ListItem>
          </asp:RadioButtonList>               
      </ul>  
    </li>    --%>
      
    <!-- will add more later -->
  </ul>
</div>

              <div style="float:right; margin-right:160px">
                  <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
              </asp:PlaceHolder>
              </div>
              

              <%--<asp:Label runat="server" ForeColor="Red" ID="lbldateerror"></asp:Label> --%>
              <br />
              <hr />
              <div style="float:right; margin-right:160px">
                  <asp:Button ID="genReport" runat="server" Text="Generate Report" CssClass="btn btn" OnClick="genReport_Click"/>
              </div>
 

    
                </div>
           </div>
           
    <br />
    <br />
   <asp:Panel runat="server" ID="pnlReport" Visible="false">

    <div class="row">
         <div class="col-md-12" style="margin-left:40px">
             
             <asp:Label runat="server" ID="lblProduct" Font-Bold="true" ForeColor="#5C5F60" Font-Size="Large"></asp:Label>

           

             </div>

    </div>
     <br />
    <br />
    <div class="row">
                
         
          

                 <div class="col-md-6">

                <h4 style="text-align:center">Prices Comparison</h4>
                     <br />     
               <asp:GridView ID="GridView1" runat="server" Width="80%" HorizontalAlign="Center" 
                        AutoGenerateColumns="false" AllowPaging="true" OnRowDataBound="GridView1_RowDataBound"
                        DataKeyNames="RFP_ID, VendorID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center"/>
                        
                         <Columns>                                            
                            
                            <asp:BoundField DataField="RFP_ID" HeaderText="RFP_ID" Visible="false" />
                             <asp:BoundField DataField="ProductDescription" HeaderText="ProductDescription" Visible="false" />
                            <asp:BoundField DataField="GatewayPrice" HeaderText="GatewayPrice" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="ProposedPrice" HeaderText="ProposedPrice" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false" />
                        </Columns>
                    </asp:GridView>
                     <asp:Button  runat="server" CssClass="btn btn" Text="Export to Excel" ID="btnexportexcelcomparison" OnClick="btnexportexcelcomparison_Click" ToolTip="Click to Export"/>


                     </div>


                  <div class="col-md-6">
                    <h4 style="text-align:center">Vendors' Savings</h4>  
                      <br />   
                 <asp:GridView ID="GridView2" runat="server" Width="80%" HorizontalAlign="Center" 
                        AutoGenerateColumns="false" AllowPaging="true"  OnRowDataBound="GridView2_RowDataBound"
                        DataKeyNames="RFP_ID, VendorID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center"/>
                        
                         <Columns>                                            
                            
                            <asp:BoundField DataField="RFP_ID" HeaderText="RFP_ID" Visible="false" />
                             <asp:BoundField DataField="ProductDescription" HeaderText="ProductDescription" Visible="false" />
                            <asp:BoundField DataField="Savings" HeaderText="Savings" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false" />
                             <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="RFP" runat="server" Text="Details" ToolTip="Click to see RFP"><span class="glyphicon glyphicon-folder-open"></span></asp:HyperLink>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                  <asp:Button  runat="server" CssClass="btn btn" Text="Export to Excel" ID="btnexportexcelsavings"  OnClick="btnexportexcelsavings_Click" ToolTip="Click to Export"/>

               </div>

            



    </div>
          
    </asp:Panel>


       
        
    <br />
    <br />   
    <br />
    <br />  
    <br />   
    <br />
    <br /> 
    <br /> 







    <script>
        $(function () {

            $("#accordian h3").click(function () {
                //$("#accordian ul ul").slideUp();
                //if ($(this).next().is(":hidden")) {
                    $(this).next().slideDown();
            });


            //});


        });

       

        $(function () {
            $("#<%= StartDate.ClientID %>").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 3,
                onClose: function (selectedDate) {
                    $("#to").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#<%= EndDate.ClientID %>").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 3,
                onClose: function (selectedDate) {
                    $("#from").datepicker("option", "maxDate", selectedDate);
                }
            });
        });



    </script>




</asp:Content>
