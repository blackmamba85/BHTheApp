<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="ReplyRFI.aspx.cs" Inherits="BHSCMSApp.Dashboard.VendorRFI.ReplyRFI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

    <div class="row" style="background-color:white; width:80%; margin-left:20px">
          <div class="col-md-12">
            					
						<fieldset>
							<h4>RFI Details</h4>
                            <br />
                             
                            <hr />
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
									<asp:TextBox runat="server" id="category" ReadOnly="true" Width="60%"/>
								</div>
							</div>
                            <br />
                           
                            <br />
                             
                            <hr />
                            
                          <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Start Date:</asp:Label>
                        <div class="col-md-8">               
                            <asp:TextBox runat="server" ID="startdate" ReadOnly="true"></asp:TextBox>                         
                        </div>
                         </div>
     

                         <br />
                         <br />
                           
                          <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">End Date:</asp:Label>
                            <div class="col-md-8">               
                                <asp:TextBox runat="server" ID="enddate" ReadOnly="true"></asp:TextBox>                              
                            </div>
                         </div>
						<br />
                             <br />
                            <hr />
                          <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Download RFI documents</asp:Label>
                            <div class="col-md-8">   
                             <asp:HyperLink runat="server" ID="rfiDoc" ForeColor="#6BBAEC">Price notification letter  <span class="glyphicon glyphicon-download"></span></asp:HyperLink>	 
                             <br />           
                            <asp:HyperLink runat="server" ID="exihbitB" NavigateUrl="~/Documents/docs/Exhibit B Product Cross Reference Template.xlsx" Visible="true" ForeColor="#6BBAEC">Exhibit B Product Cross Reference Template  <span class="glyphicon glyphicon-download"></span></asp:HyperLink>
                                                    

                            </div>
                         </div> 

                           <br />		
                              <br />		
							<hr />
                            <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Upload requested documents</asp:Label>
                       <div class="col-md-8">               
                      <asp:FileUpload runat="server" AllowMultiple="false" ID="docUpload" />  
                     <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please upload RFI document" 
                       ControlToValidate="docUpload"></asp:RequiredFieldValidator>--%>
                                            
            </div>
         </div>
								  <br />	
                            <hr />			
							<div class="form-actions">
								<asp:Button runat="server" Text="Submit" ID="savebtn" class="btn btn-info" OnClick="savebtn_Click" Visible="true"/>
                                <asp:Button runat="server" Text="Back to List" ID="cancelbtn" class="btn" OnClick="cancelbtn_Click"/>
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
