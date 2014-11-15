<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="VendorRFPList.aspx.cs" Inherits="BHSCMSApp.Dashboard.VendorRFP.VendorRFPList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />
    
     <div class="row" style="background-color:white; width:90%;  margin-left:10px">
          <div class="col-md-12">
              
      <h4>My RFPs</h4>
    <hr />        
              <div class="form-group">     
               <asp:Label runat="server" AssociatedControlID="ddpermissionFilter" CssClass="col-md-2 control-label" Width="20%">Filter by Permission:</asp:Label>
                 
                 <div class="col-md-8">
             
                <asp:DropDownList runat="server" ID="ddpermissionFilter" AutoPostBack="true" CssClass="form-control" Width="20%">
                    <asp:ListItem Value="1">Show All</asp:ListItem>
                    <asp:ListItem Value="2">Participate</asp:ListItem>
                    <asp:ListItem Value="3">View</asp:ListItem>
                </asp:DropDownList>

             </div>
        </div>
           <br />
              <br />
                    <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound"
                        AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                        DataKeyNames="RFP_ID, PermissionID, EndDate, VendorID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center" />
                        
                         <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Open RFI" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ReplyLink" runat="server" Text="View Responses"> <span class="glyphicon glyphicon-folder-open"></span></asp:HyperLink>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                                                     
                              <%--<asp:BoundField DataField="Quotes" HeaderText="Quotes"/>--%>
                            <asp:BoundField DataField="RFP_ID" HeaderText="RFI_ID" Visible="false" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false"/> 
                             <asp:BoundField DataField="PermissionID" HeaderText="Permission" Visible="false" />                          
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date"  DataFormatString="{0:d}"  />
                            <asp:BoundField DataField="Category" HeaderText="Category" />
                            <asp:BoundField DataField="ProductDescription" HeaderText="Product" />
                            <asp:BoundField DataField="GatewayPrice" HeaderText="Gateway Price" DataFormatString="{0:C}"  />
                        

                        </Columns>
                    </asp:GridView>
                  
          
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






</asp:Content>
