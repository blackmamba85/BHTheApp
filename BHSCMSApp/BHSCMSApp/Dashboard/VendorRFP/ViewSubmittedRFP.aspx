<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="ViewSubmittedRFP.aspx.cs" Inherits="BHSCMSApp.Dashboard.VendorRFP.ViewSubmittedRFP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

    <div class="row" style="background-color:white; width:80%; margin-left:20px">
          <div class="col-md-12">
            					
						<fieldset>
						  <div style="width:20%; margin: 0 auto"><img  src="../../img/submittedrfp.png" class="img-responsive" alt="Responsive image"/></div>
                            <br />                             
                            <hr />                          
                            <br />                            
                            <br />
							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Category:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtcategory" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                           
                            <br />
                            <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Product Description:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtproduct" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                           
                            <br />
                             <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Proposed Price:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtProposedPrice" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                           
                            <br />                             
                            <hr />                            
                          <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Start Date:</asp:Label>
                        <div class="col-md-8">               
                            <asp:TextBox runat="server" ID="startdate" ReadOnly="true" BorderColor="Transparent"/>                       
                        </div>
                         </div> 

                         <br />
                         <br />
                           
                          <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">End Date:</asp:Label>
                            <div class="col-md-8">               
                                <asp:TextBox runat="server" ID="enddate" ReadOnly="true" BorderColor="Transparent"/>                            
                            </div>
                         </div>
						<br />
                             <br />
                            <hr />
                          <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Submitted Documents:</asp:Label>
                        
                   <%-- Add a Datalist for show uploaded files --%>
        <asp:DataList ID="listFiles" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="listFiles_ItemCommand">
            <ItemTemplate>
                <table class="table" border="1" style="border-color:lightgray" >
                    <tr>
                        <td><%#Eval("Document_Name") %></td>
                    </tr>
                  
                    <tr>
                        <td>
                         <span style="color:#529ABB" class="glyphicon glyphicon-download"></span>   <asp:LinkButton ID="lbtnDownload" runat="server" ForeColor="#529ABB" CommandName="Download" CommandArgument=<%#Eval("DocID")%>>Download</asp:LinkButton></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
                              
                              
                                           
                             
                         </div> 

                           <br />		
                          
                            
									
                            <hr />			
							<div class="form-actions">
                                <asp:Button runat="server" Text="Back to List" ID="cancelbtn" class="btn" OnClick="cancelbtn_Click" CausesValidation="false"/>
							</div>



                            </fieldset>



   
                        <br />
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
