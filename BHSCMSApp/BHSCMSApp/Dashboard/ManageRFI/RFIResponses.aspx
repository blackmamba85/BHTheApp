<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="RFIResponses.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageRFI.RFIResponses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

    <div class="row" style="background-color:white; width:80%; margin-left:20px">
          <div class="col-md-12">
            					
    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
    <p class="text-danger">
    <asp:Literal runat="server" ID="FailureText" />
    </p>
    </asp:PlaceHolder>


    <asp:PlaceHolder runat="server" ID="pnlrfpDetails" Visible="false">
                    <h4>RFI Information</h4>
                    <hr />
							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Category</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="category" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                         
                           
                            <br />
                            <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Product Description</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="product" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                          
                           
                            <br />
                            
                            
                            
                          <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Start Date:</asp:Label>
                        <div class="col-md-8">               
                            <asp:TextBox runat="server" ID="startdate" ReadOnly="true" BorderColor="Transparent"/>                       
                        </div>
                         </div>
     

                        
                         <br />
                           
                          <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">End Date:</asp:Label>
                            <div class="col-md-8">               
                                <asp:TextBox runat="server" ID="enddate" ReadOnly="true" BorderColor="Transparent"/>                            
                            </div>
                         </div>
						<br />
                            
							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Current Price:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtcurrentPrice" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                          
                           
                            <br />
                           
                           
                            <br />
                            <hr />

 </asp:PlaceHolder>

  <asp:Panel runat="server" Visible="false" ID="pnlgrid">
      <h4>Vendor responses:</h4>
    <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound"
                        AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                        DataKeyNames="RFI_ID, UserID, VendorID" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                         <pagersettings mode="NextPreviousFirstLast" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center"/>
                        
                         <Columns>
                             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="RFI Documents">
                                <ItemTemplate>
                                        <asp:DataList ID="listFiles" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" OnItemCommand="listFiles_ItemCommand">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td><%#Eval("Document_Name") %></td>
                                    </tr>
                  
                                    <tr>
                                        <td>
                                         <span style="color:#529ABB" class="glyphicon glyphicon-download"></span> <asp:LinkButton ID="lbtnDownload" ForeColor="#529ABB" runat="server" CommandName="Download" CommandArgument=<%#Eval("DocID")%>>Download</asp:LinkButton></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>     
                                 </ItemTemplate>
                             </asp:TemplateField>
                                  
                          
                             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Vendor Profile">
                                 <ItemTemplate>
                                  <asp:HyperLink ID="vendorDetails" runat="server" Text="Vendor Details" ToolTip="Click to see vendor's details"> <span class="glyphicon glyphicon-zoom-in"></span></asp:HyperLink>
                                 </ItemTemplate>

                             </asp:TemplateField>
                                 
                                                       
                              <%--<asp:BoundField DataField="Quotes" HeaderText="Quotes"/>--%>
                            <asp:BoundField DataField="RFI_ID" HeaderText="RFI_ID" Visible="false" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false"/>
                             <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false"/>
                            <asp:BoundField DataField="CompanyName" HeaderText="Company"/> 
                           <asp:TemplateField HeaderText="Primary Email">
                            <ItemTemplate>
                          <asp:HyperLink ID="priEmail" runat="server" ToolTip="Click to send email"
                            NavigateUrl='<%# Eval("PrimaryEmail", "mailto:{0}") %>'
                            Text='<%# Eval("PrimaryEmail") %>'>
                         </asp:HyperLink>
                          </ItemTemplate>
                         </asp:TemplateField>
                             <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" />                        
                                                 
                            <asp:BoundField DataField="SubmittedDate" HeaderText="Submitted Date"  DataFormatString="{0:d}"  />

                        </Columns>
                    </asp:GridView>


</asp:Panel>











    <div class="form-group">                 
                  
  <asp:Button runat="server" Text="Back to List" ID="cancelbtn" class="btn" OnClick="cancelbtn_Click" CausesValidation="false"/>
                                        
                             
  </div>
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
     
    


</asp:Content>
