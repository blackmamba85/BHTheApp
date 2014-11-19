<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="EditRFI.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageRFI.EditRFI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false"/>

    <div class="row" style="background-color:white; width:100%">
       
          <div class="col-md-6">
            					
						<fieldset>
							
                            <br />
                             
                            <hr />
                           <div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">RFI ID</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="rfiid" ReadOnly="true"/>
								</div>
							</div>
                            <br />                            
                            <br />
							<div class="form-group">
							 <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Category</asp:Label>
								 <div class="col-md-8">   
									<asp:TextBox runat="server" id="category" ReadOnly="true" Width="80%"/>
								</div>
							</div>
                            <br />
                           
                            <br />
                             
                            <hr />

                          <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                        </asp:PlaceHolder>

                           <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Product Description:</asp:Label>
            <div class="col-md-8">        
                <asp:TextBox runat="server" ID="productDescription"></asp:TextBox>   
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="productDescription" 
                    CssClass="text-danger" ErrorMessage="The product description field is required." />                                 
            </div>
         </div>
         <br />
         <br />
         
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Current Price:</asp:Label>
            <div class="col-md-8">        
                <asp:TextBox runat="server" ID="txtcurrentPrice"></asp:TextBox>   
                 <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="txtcurrentPrice" CssClass="text-danger"
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
                            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">RFI Documents:</asp:Label>
                            <div class="col-md-8"> 
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
                             <%--<asp:ListBox ID="rfi_Documents" runat="server"  OnSelectedIndexChanged="rfi_Documents_SelectedIndexChanged" OnLoad="rfi_Documents_Load" SelectionMode="Single" />--%>
                             <%--<asp:LinkButton runat="server"  OnClick="rfiDoc_Click" ID="rfiDoc" ForeColor="#529ABB"  ><span class="glyphicon glyphicon-download"></span>Price notification letter</asp:LinkButton>	 --%>
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

            <asp:GridView ID="gridEditVendors" runat="server" AutoGenerateColumns="false" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBoxList ID="chkBoxList" runat="server" ItemStyle-HorizontalAlign="Center" HeaderText="Permissions" >
                                <asp:ListItem Text="Participate" Value="1" />
                                <asp:ListItem Text="View" Value="2" />
                            </asp:CheckBoxList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CompanyName" HeaderText="Company"/>
                    <asp:BoundField DataField="VendorID" Visible="false" />
                </Columns>
            </asp:GridView>




       <h5 id="particpantsHeader" runat="server" style="background-color:lightgray; width:90px; padding:4px; border-radius:4px">Participants:</h5>
       <asp:ListBox ID="listBoxParticipants" runat="server">
           
       </asp:ListBox>
        
        <br />
       </div>

         <div class="form-group">
        
          <h5 id="viewersHeader" runat="server" style="background-color:lightgray; width:90px; padding:4px; border-radius:4px">View Only:</h5>
           <asp:ListBox ID="listBoxViewers" runat="server">

           </asp:ListBox>
              
            <br />
            
        <br />
       </div>
         <br />
         <br />
         <div class="form-actions">
		<asp:Button runat="server" Text="Edit selection"  ID="Button1" class="btn btn-info" OnClick="Button1_Click" ToolTip="Click to modify participants list"/>
        <asp:Button runat="server" Text="Cancel" ID="btnVendorCancel" class="btn btn-info" OnClick="btnVendorCancel_Click" ToolTip="Click to cancel vendor changes" />
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
