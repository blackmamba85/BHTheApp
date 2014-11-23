<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ViewContracts.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageContract.ViewContracts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
              
      <h4>Contracts</h4>
    <hr />        
              <div class="form-group">     
               <asp:Label runat="server" AssociatedControlID="ddstatusfilter" CssClass="col-md-2 control-label">Filter by Status:</asp:Label>
                 
                 <div class="col-md-8">
             
                  <asp:DropDownList runat="server" ID="ddstatusfilter" OnSelectedIndexChanged="ddstatusfilter_SelectedIndexChanged1" AutoPostBack="true" CssClass="form-control" Width="20%">
                    <asp:ListItem Value="1">Show All</asp:ListItem>                    
                    <asp:ListItem Value="2">Existing</asp:ListItem>
                      <asp:ListItem Value="3">Expired</asp:ListItem>
                </asp:DropDownList>

             </div>
        </div>
           <br />
              <br />
                    <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound"
                        AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                        DataKeyNames="ContractID, VendorID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center"/>
                        
                         <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="View Contract">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ResponsesLink" runat="server" Text="View Contract"> <span class="glyphicon glyphicon-file"></span></asp:HyperLink>
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
                            <asp:BoundField DataField="ContractID" HeaderText="ContractID" Visible="false" />
                             <asp:BoundField DataField="IsCompleted" HeaderText="Status" />
                            <asp:BoundField DataField="Title" HeaderText="Title"/>
                              <asp:BoundField DataField="Name" HeaderText="Created By"/>
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date"  DataFormatString="{0:d}"  />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false" />
                            <asp:BoundField DataField="CompanyName" HeaderText="Vendor" />
                             <asp:BoundField DataField="ContractPrice" HeaderText="Contract Price" DataFormatString="{0:C}"  />
                         
                             

                        </Columns>
                    </asp:GridView>


              <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
              </asp:PlaceHolder>
                    <asp:Button  ID="addnewContract" runat="server" Text="Create New Contract" CssClass="btn btn-info" OnClick="addnewContract_Click" />
          
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
