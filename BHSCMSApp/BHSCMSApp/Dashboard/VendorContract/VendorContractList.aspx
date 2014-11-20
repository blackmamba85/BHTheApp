<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="VendorContractList.aspx.cs" Inherits="BHSCMSApp.Dashboard.VendorContract.VendorContractList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />
    
     <div class="row" style="background-color:white; width:90%;  margin-left:10px">
          <div class="col-md-12">
              
   <h4>My Contracts List</h4>
    <hr />        
              <div class="form-group">     
               <asp:Label runat="server" AssociatedControlID="ddcontractsstatus" CssClass="col-md-2 control-label" Width="20%">Filter by status:</asp:Label>
                 
                 <div class="col-md-8">
             
                <asp:DropDownList runat="server" ID="ddcontractsstatus" AutoPostBack="true" CssClass="form-control" Width="20%" OnSelectedIndexChanged="ddcontractsstatus_SelectedIndexChanged" >
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
                        DataKeyNames="ContractID, VendorID, EndDate" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center" />
                        
                         <Columns>
                           <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Submit Contract" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="SubmitContract" runat="server" Text="View Responses"> <span class="glyphicon glyphicon-share-alt"></span></asp:HyperLink>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="View Contract" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ViewContract" runat="server"> <span class="glyphicon glyphicon-file"></span></asp:HyperLink>
                                </ItemTemplate>                               
                            </asp:TemplateField>   
                                                     
                            <asp:BoundField DataField="IsCompleted" HeaderText="Status" />    
                            <asp:BoundField DataField="ContractID" HeaderText="ContractID" Visible="false" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false"/> 
                              <asp:BoundField DataField="CompanyName" HeaderText="Vendor Company" Visible="false"/> 
                             <asp:BoundField DataField="Title" HeaderText="Title" />                          
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date"  DataFormatString="{0:d}"  />
                             <asp:BoundField DataField="CreatedDate" HeaderText="Created Date"  DataFormatString="{0:d}"  />
                                                  

                        </Columns>
                    </asp:GridView>
                  
            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
              </asp:PlaceHolder>


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