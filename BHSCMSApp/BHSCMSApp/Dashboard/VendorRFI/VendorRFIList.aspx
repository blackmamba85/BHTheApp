<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="VendorRFIList.aspx.cs" Inherits="BHSCMSApp.Dashboard.VendorRFI.VendorRFIList" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />
    
     <div class="row" style="background-color:white; width:90%;  margin-left:10px">
          <div class="col-md-12">
              
  <div style="width:15%; margin-left:10px"><img  src="../../img/MyRfi.png" class="img-responsive" alt="Responsive image"/></div>

    <hr />        
              <div class="form-group">     
               <asp:Label runat="server" AssociatedControlID="ddpermissionFilter" CssClass="col-md-2 control-label" Width="20%">Filter by Permission:</asp:Label>
                 
                 <div class="col-md-8">
             
                <asp:DropDownList runat="server" ID="ddpermissionFilter" AutoPostBack="true" CssClass="form-control" Width="20%" OnSelectedIndexChanged="ddpermissionFilter_SelectedIndexChanged">
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
                        DataKeyNames="RFI_ID, PermissionID, EndDate, VendorID, IsCompleted" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center" />
                        
                         <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Reply RFI" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ReplyLink" runat="server" Text="View Responses"> <span class="glyphicon glyphicon-folder-open"></span></asp:HyperLink>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="View Submitted" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="SubmittedLink" runat="server"> <span class="glyphicon glyphicon-folder-close"></span></asp:HyperLink>
                                </ItemTemplate>                               
                            </asp:TemplateField>                      
                              <asp:BoundField DataField="IsCompleted" HeaderText="Status" />       
                            <asp:BoundField DataField="RFI_ID" HeaderText="RFI_ID" Visible="false" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false"/> 
                             <asp:BoundField DataField="PermissionID" HeaderText="Permission" Visible="false" />                          
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date"  DataFormatString="{0:d}"  />
                            <asp:BoundField DataField="Category" HeaderText="Category" />
                             <asp:BoundField DataField="ProductDescription" HeaderText="Product" />                             
                             
                                                  
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
      <br />
    <br />   
    <br />
    <br />  
    <br />   
    






</asp:Content>
