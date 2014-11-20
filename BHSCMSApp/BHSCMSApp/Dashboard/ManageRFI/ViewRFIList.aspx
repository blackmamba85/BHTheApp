<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ViewRFIList.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageRFI.ViewRFIList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function deletePrompt()
        {
            if(confirm("Are you sure?")) //If user selects yes
            {
                document.getElementById("ClientMediate").value = true;
            }
            else//If user selects no
            {
                document.getElementById("ClientMediate").value = false;
            }
        }
    </script>
    <asp:HiddenField ID="ClientMediate" runat="server" ClientIDMode="Static" />
     <div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
              
                   <div style="width:50%; margin-left:10px"><img  src="/img/rfis.png" class="img-responsive" alt="Responsive image" width="60%"/></div>

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
                        DataKeyNames="RFI_ID, UserID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
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
                                    <%--<asp:HyperLink ID="DeleteLink" runat="server" Text="Delete"> <span class="glyphicon glyphicon-trash"></span></asp:HyperLink>                                --%>
                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="glyphicon glyphicon-trash" OnClick="btnDelete_Click" OnClientClick="deletePrompt();"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>                           
                              <%--<asp:BoundField DataField="Quotes" HeaderText="Quotes"/>--%>
                            <asp:BoundField DataField="RFI_ID" HeaderText="RFI_ID" Visible="false" />
                            <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false"/>
                              <asp:BoundField DataField="Name" HeaderText="Created By"/>
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date"  DataFormatString="{0:d}"  />
                            <asp:BoundField DataField="Category" HeaderText="Category" />
                              <asp:BoundField DataField="ProductDescription" HeaderText="Description" />
                             <asp:BoundField DataField="CreatedDate" HeaderText="Created Date"  DataFormatString="{0:d}"  />
                             <asp:BoundField DataField="ModifiedDate" HeaderText="Modified Date" DataFormatString="{0:d}"  />

                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="addNewRFI" runat="server" Text="Add New RFI" CssClass="btn btn-info" OnClick="addNewRFI_Click" />
          
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
