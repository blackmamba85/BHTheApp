<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="ReplyRFI.aspx.cs" Inherits="BHSCMSApp.Dashboard.VendorRFI.ReplyRFI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

    <div class="row" style="background-color:white; width:80%; margin-left:20px">
          <div class="col-md-12">
            					
						<fieldset>
							<h4 style="text-align:center">RFI Details</h4>
                            <br />
                             
                            <hr />
                             <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                             <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                                  </p>
                            </asp:PlaceHolder>	
                           <%--<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">RFI ID</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="rfiid" ReadOnly="true"/>
								</div>
							</div>--%>
                            <br />                            
                            <br />
							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Category</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="category" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />
                           
                            <br />
                            <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Product Description</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="product" ReadOnly="true" Width="60%" BorderColor="Transparent"/>
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
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Download RFI documents</asp:Label>
                        
                   <%-- Add a Datalist for show uploaded files --%>
        <asp:DataList ID="listFiles" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="listFiles_ItemCommand">
            <ItemTemplate>
                <table class="table" border="1" style="border-color:lightgray" >
                    <tr>
                        <td><%#Eval("Document_Name") %></td>
                    </tr>
                  
                    <tr>
                        <td>
                         <span class="glyphicon glyphicon-download"></span>   <asp:LinkButton ID="lbtnDownload" runat="server" CommandName="Download" CommandArgument=<%#Eval("DocID")%>>Download</asp:LinkButton></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
                              
                              
                                           
                             
                         </div> 

                           <br />		
                              <br />		
							<hr />
                            <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true" ID="lbluploadeddoc">Upload requested documents</asp:Label>
                       <div class="col-md-8">               
                      <asp:FileUpload runat="server" AllowMultiple="true" ID="docUpload" />  
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please upload RFI document" 
                       ControlToValidate="docUpload"></asp:RequiredFieldValidator>
                                            
            </div>
         </div>
								  <br />	
                              <br />	
                              <br />	
                            <hr />
                             
                            
                            		
							<div class="form-actions">
								<asp:Button runat="server" Text="Submit" ID="savebtn" class="btn btn-info" OnClick="savebtn_Click" Visible="true"/>
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
