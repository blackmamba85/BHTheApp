<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ContractWithVendor.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageContract.ContractWithVendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

    <div class="row" style="background-color:white; width:80%; margin-left:20px">
          <div class="col-md-12">
            					
						<fieldset>
						  <div style="width:25%; margin: 0 auto"><img  src="../../img/submittedcontract.png" class="img-responsive" alt="Responsive image"/></div>

                            <br />
                             
                            <hr />
                             <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                             <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                                  </p>
                            </asp:PlaceHolder>	 
                             <br />                            
                            <br />
							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Title:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtTitle" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                            
                            <br />
                            <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Description:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtDescription" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                            
                            <br />

							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Category:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="category" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                           
                            <br />
                            <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Product:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtProduct" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                            
                            <br />
                            	<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Contract Price:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtContractPrice" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                           
                            <br /> 
                             	<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Savings:</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="txtSavings" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>                        
                            <hr />
                            <h4 style="text-align:center">Duration</h4>
                            <br />
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
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Contract documents:</asp:Label>
                        
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
                              <br />		
							<hr />
                          
                             
                            <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
        
                            		
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
