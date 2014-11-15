<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="EditRFP.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageRFP.EditRFP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />
    
    <div class="row" style="background-color:white; width:100%">
       
          <div class="col-md-6">
            					
						<fieldset>
							
                            <br />
                             
                            <hr />
                           <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">RFP ID</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="rfpid" ReadOnly="true" BorderColor="Transparent"/>
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
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="productDescription" 
                    CssClass="text-danger" ErrorMessage="The product description field is required." />                                 
            </div>
         </div>
         <br />
         <br />
          
                            
                          <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                        </asp:PlaceHolder>
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Current Price:</asp:Label>
            <div class="col-md-8">        
                <asp:TextBox runat="server" ID="currentPrice" ReadOnly="true"  BorderColor="Transparent"></asp:TextBox>   
                 <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="currentPrice" CssClass="text-danger"
          ErrorMessage="Enter valid number" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"></asp:RegularExpressionValidator>

                                      
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
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">RFP Documents:</asp:Label>
                            <div class="col-md-8"> 
                           
                             <asp:LinkButton runat="server"  OnClick="rfiDoc_Click" ID="rfiDoc" ForeColor="#529ABB" ><span class="glyphicon glyphicon-download"></span>Price notification letter</asp:LinkButton>	 
                             <br />                                                              

                            </div>
                         </div> 



                             
                           <br />		
							
						<hr />					
							



                            </fieldset>



   
                        <br />
                   </div>
     <div class="col-md-6">
          <h4>Selected Vendors</h4>
        <br />
        <div class="form-group">
        
       <h5 style="background-color:lightgray; width:90px; padding:4px; border-radius:4px">Participants:</h5>

        <asp:label runat="server" ID="participatelist"></asp:label>
            <asp:Label runat="server" ID="p1" Text="G&G Co"></asp:Label>
            <br />
            <asp:Label runat="server" ID="Label1" Text="Health Supplies"></asp:Label>
        <br />
       </div>

         <div class="form-group">
        
          <h5 style="background-color:lightgray; width:90px; padding:4px; border-radius:4px">View Only:</h5>
        <asp:label runat="server" ID="viewlist"></asp:label>
              <asp:Label runat="server" ID="Label2" Text="AMC Co"></asp:Label>
            <br />
            <asp:Label runat="server" ID="Label3" Text="Cardinal Supplies"></asp:Label>
        <br />
       </div>
         <br />
         <br />
         <div class="form-actions">
	<asp:Button runat="server" Text="Edit selection"  ID="Button1" class="btn btn-info" ToolTip="Click to modify participants list"/>
                                
		</div>
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
