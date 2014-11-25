<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="EditContract.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageContract.EditContract" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />
    
    <div class="row" style="background-color:white; width:100%">
       
          <div class="col-md-12">
            					
						<fieldset>
							
                            <br />
                             
                            <hr />
                           <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Contract ID</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="contractid" ReadOnly="true" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />                            
                            <br />
							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Category</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="category" ReadOnly="true" Width="80%" BorderColor="Transparent"/>
								</div>
							</div>
                            <br />
                           
                            <br />
                             
                         


                           <div class="form-group">
                          <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Product Description:</asp:Label>
                       <div class="col-md-8">        
                     <asp:TextBox runat="server" ID="productDescription" ReadOnly="true" BorderColor="Transparent"></asp:TextBox>   
                                                  
                   </div>
                         </div>
         <br />
         <br />
          
                            
                          
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Current Price:</asp:Label>
            <div class="col-md-8">        
                <asp:TextBox runat="server" ID="currentPrice" ReadOnly="true"  BorderColor="Transparent"></asp:TextBox>   
                 <%--<asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="currentPrice" CssClass="text-danger"
          ErrorMessage="Enter valid number" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"></asp:RegularExpressionValidator>--%>

                                      
            </div>
         </div>
         <hr />
        
         <br />
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Gateway Price:</asp:Label>
            <div class="col-md-8">        
                <asp:TextBox runat="server" ID="txtgatewayprice"></asp:TextBox>   
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtgatewayprice" CssClass="text-danger"
          ErrorMessage="Enter valid number" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"></asp:RegularExpressionValidator>

                                      
            </div>
         </div>
         <br />
         <br />
            <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Offered Price:</asp:Label>
            <div class="col-md-8">        
                <asp:TextBox runat="server" ID="txtofferedprice"></asp:TextBox>   
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtofferedprice" CssClass="text-danger"
          ErrorMessage="Enter valid number" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"></asp:RegularExpressionValidator>

                                      
            </div>
         </div>
         <br />
         <br />

                          <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Start Date:</asp:Label>
                        <div class="col-md-8">               
                              <asp:TextBox ID="StartDate" runat="server" ReadOnly="true" />                           
                        </div>
                         </div>
     

                         <br />
                         <br />
                         
                          <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">End Date:</asp:Label>
                            <div class="col-md-8">               
                                 <asp:TextBox ID="EndDate" runat="server" ReadOnly="true"/>                           
                            </div>
                         </div>

						<br />
                            <br />
                            <br />
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Contract Documents:</asp:Label>
                            <div class="col-md-8"> 
                           
                             <asp:LinkButton runat="server"  ID="contractDoc" ForeColor="#529ABB" ><span class="glyphicon glyphicon-download"></span>Contract</asp:LinkButton>	 
                             <br />                                                              

                            </div>
                         </div> 



                             
                           <br />		
							
						<hr />					
							



                            </fieldset>



   
                        <br />
                   </div>
     
          
        </div>
     <br />
    <br />  
    <div class="row" style="background-color:white; width:100%">
                <div class="col-md-12">
        <div class="form-actions">
								<asp:Button runat="server" Text="Save changes" ID="savebtn" class="btn btn-info" OnClick="savebtn_Click"/>
                                <asp:Button runat="server" Text="Cancel" ID="cancelbtn" class="btn" OnClick="cancelbtn_Click" CausesValidation="false"/>
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

   <script>
       $(function () {
           $("#<%= StartDate.ClientID %>").datepicker({
               defaultDate: "+1w",
               changeMonth: true,
               numberOfMonths: 3,
               onClose: function (selectedDate) {
                   $("#to").datepicker("option", "minDate", selectedDate);
               }
           });
           $("#<%= EndDate.ClientID %>").datepicker({
               defaultDate: "+1w",
               changeMonth: true,
               numberOfMonths: 3,
               onClose: function (selectedDate) {
                   $("#from").datepicker("option", "maxDate", selectedDate);
               }
           });
       });


    </script>
    


</asp:Content>
