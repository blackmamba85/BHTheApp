<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ViewRFP.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageRFP.ViewRFP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
              
      <h4>RFPs waiting for decision</h4>
    <hr />        
              <div class="form-group">     
               <asp:Label runat="server" AssociatedControlID="ddstatusfilter" CssClass="col-md-2 control-label">Filter by Status:</asp:Label>
                 
                 <div class="col-md-8">
             
                  <asp:DropDownList runat="server" ID="ddstatusfilter" OnSelectedIndexChanged="ddstatusfilter_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Width="20%">
                    <asp:ListItem Value="1">Show All</asp:ListItem>
                    <asp:ListItem Value="2">Opened</asp:ListItem>
                    <asp:ListItem Value="3">Closed</asp:ListItem>
                </asp:DropDownList>

             </div>
        </div>
           <br />
              <br />
                    <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound"
                        AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                        DataKeyNames="RFP_ID, UserID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center"/>
                        
                         <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Responses">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ResponsesLink" runat="server" Text="View Responses"> <span class="glyphicon glyphicon-list-alt"></span></asp:HyperLink>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Modify">
                                <ItemTemplate>                                     
                                    <asp:HyperLink ID="EditLink" runat="server" Text="Edit"> <span class="glyphicon glyphicon-pencil"></span></asp:HyperLink>                                
                                </ItemTemplate>
                            </asp:TemplateField>     
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete">
                                <ItemTemplate>                                     
                                    <asp:HyperLink ID="DeleteLink" runat="server" Text="Delete"> <span class="glyphicon glyphicon-trash"></span></asp:HyperLink>                                
                                </ItemTemplate>
                            </asp:TemplateField>                           
                              <%--<asp:BoundField DataField="Quotes" HeaderText="Quotes"/>--%>
                            <asp:BoundField DataField="RFP_ID" HeaderText="RFP_ID" Visible="false" />
                            <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false"/>
                               <asp:BoundField DataField="Responses" HeaderText="Replies" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true"/>
                               <asp:BoundField DataField="ProductDescription" HeaderText="Product" />
                           <asp:BoundField DataField="CurrentPrice" HeaderText="Current Price" DataFormatString="{0:C}"  />
                            
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date"  DataFormatString="{0:d}"  />
                            <asp:BoundField DataField="Name" HeaderText="Created By"/>
                             <asp:BoundField DataField="CreatedDate" HeaderText="Created Date"  DataFormatString="{0:d}" Visible="false"  />

                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="addNewRFP" runat="server" Text="Add New RFP" CssClass="btn btn-info" OnClick="addNewRFP_Click" />
          
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
