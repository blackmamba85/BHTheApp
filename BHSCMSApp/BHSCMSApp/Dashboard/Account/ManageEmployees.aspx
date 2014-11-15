<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ManageEmployees.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
              
                   <div style="width:60%; margin-left:10px"><img  src="/img/employees.png" class="img-responsive" alt="Responsive image" width="70%"/></div>

    <hr />         
              <div class="form-group">     
               <asp:Label runat="server" AssociatedControlID="ddrolefilter" CssClass="col-md-2 control-label">Filter by Role:</asp:Label>
                 
                 <div class="col-md-8">
             
                  <asp:DropDownList runat="server" ID="ddrolefilter" AutoPostBack="true" CssClass="form-control" Width="20%">
                    <asp:ListItem Value="1">Show All</asp:ListItem>
                    <asp:ListItem Value="2">Admin</asp:ListItem>
                    <asp:ListItem Value="3">Employee</asp:ListItem>                      
                </asp:DropDownList>

             </div>
        </div>
              <br />
                
           <br />    
                     
                
           
                    <asp:GridView ID="GridView1" 
                        runat="server" Width="100%" 
                        HorizontalAlign="Center" 
                        AutoGenerateColumns="false" 
                        AllowPaging="true" 
                        OnRowDataBound="GridView1_RowDataBound" 
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        DataKeyNames="UserID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center"/>
                        
                         <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>

                                    <asp:HyperLink ID="DetailsLink" runat="server" Text="Details" > <span class="glyphicon glyphicon-zoom-in" ></span> </asp:HyperLink>

                                </ItemTemplate>                               
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>                                     

                                    <asp:HyperLink ID="EditLink" runat="server" Text="Edit" > <span class="glyphicon glyphicon-pencil"></span></asp:HyperLink>

                                </ItemTemplate>
                            </asp:TemplateField>     
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>                                     

                                    <asp:HyperLink ID="DeleteLink" runat="server" Text="Delete" > <span class="glyphicon glyphicon-trash" style="cursor:pointer;"></span></asp:HyperLink>                                

                                </ItemTemplate>
                            </asp:TemplateField>                           
                            
                            <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="Role" HeaderText="Role" />
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnAdd" runat="server" Text="Add New Employee" CssClass="btn btn-info" OnClick="btnAdd_Click" />
             
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
