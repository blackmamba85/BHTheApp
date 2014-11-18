<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="VendorProfile.aspx.cs" Inherits="BHSCMSApp.Dashboard.Account.VendorProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

    <asp:Panel runat="server" ID="profile" Visible="true">
	<div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
               
						<fieldset>
                            <br />
							<legend><span class="glyphicon glyphicon-user"></span> My Profile</legend>
                            
                            <asp:Label runat="server" AssociatedControlID="lblcompany" Text="Company Name:  "/>
                            <asp:Label runat="server" ID="lblcompany"/>                            
                            <br />
                            <asp:Label runat="server" AssociatedControlID="lblphone" Text="Phone Number:  "/>
                            <asp:Label runat="server" ID="lblphone"/>
                            <br />
                            <asp:Label runat="server" AssociatedControlID="lblfax" Text="Fax Number:   "/>
                            <asp:Label runat="server" ID="lblfax"/>
							<br />                           
                            <asp:Label runat="server" AssociatedControlID="lbladdress" Text="Address:   "/>
                            <asp:Label runat="server" ID="lbladdress"/>
                          
                           <%--<asp:Label runat="server" AssociatedControlID="lbladdress2" Text="PO Box/Suite/Apt:   "/>
                            <asp:Label runat="server" ID="lbladdress2"/>
                            <br />
                            <hr />
							<asp:Label runat="server" AssociatedControlID="lblcity" Text="City:   "/>
                            <asp:Label runat="server" ID="lblcity"/>

                            <br />
                            <asp:Label runat="server" AssociatedControlID="lblstate" Text="State:   "/>
                            <asp:Label runat="server" ID="lblstate"/>								
                            <br />	

                            <asp:Label runat="server" AssociatedControlID="lblZipcode" Text="ZipCode:   "/>
                            <asp:Label runat="server" ID="lblzipcode"/>--%>

								
                           <br />	

                              <asp:Label runat="server" AssociatedControlID="lbltaxid" Text="TaxID:   "/>
                            <asp:Label runat="server" ID="lbltaxid"/>
                               <br />
                               <br />
                            <h4>Account Information:</h4>
                          
                              <asp:Label runat="server" AssociatedControlID="lblusername" Text="Username:   "/>
                            <asp:Label runat="server" ID="lblusername"/>
                               <br />
                              <asp:Label runat="server" AssociatedControlID="lblpassword" Text="Password:   "/>
                            <asp:Label runat="server" ID="lblpassword"/>
                               <br />
                             <asp:Label runat="server" AssociatedControlID="lblpriemail" Text="Primary Email:   "/>
                            <asp:Label runat="server" ID="lblpriemail"/>
                               <br />
                             <asp:Label runat="server" AssociatedControlID="lblsecemail" Text="Secondary Email:   "/>
                            <asp:Label runat="server" ID="lblsecemail"/>

                            <hr />
							
											
							<div class="form-actions">
								<asp:button runat="server" type="submit" ID="editprofile" OnClick="editprofile_Click" Text="Edit Profile"  class="btn btn-info"/>
							</div>



                            </fieldset>



   
                        <br />
                   </div>
     
         </div>
          </asp:Panel>

    <asp:Panel runat="server" ID="edit" Visible="false">

	<div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
            					
					
							
                            <br />
                           <fieldset>
							<h4>Edit Profile</h4>
                            


                            <div class="control-group">
                            <asp:Label runat="server" class="control-label" AssociatedControlID="txtcompany" Text="Company Name: "/>
                             <div class="controls">
                            <asp:TextBox runat="server" ID="txtcompany"/>
                            </div>
							</div>
                            <br />

                           <div class="control-group">
                           <asp:Label runat="server" class="control-label" AssociatedControlID="txtphone" Text="Phone Number: "/>
                           <div class="controls">
                           <asp:TextBox runat="server" ID="txtphone"/>
                           </div>
						   </div>
                            <br />

                            <div class="control-group">
                            <asp:Label runat="server" class="control-label" AssociatedControlID="txtfax" Text="Fax Number:   "/>
                            <div class="controls">
                            <asp:TextBox runat="server" ID="txtfax"/>
                            </div>
						   </div>
							<br />
                            

                            <div class="control-group">
                            <asp:Label runat="server" class="control-label" AssociatedControlID="txtaddress1" Text="Address:   "/>
                            <div class="controls">
                            <asp:TextBox runat="server" ID="txtaddress1"/>
                            </div>
						   </div>
                           <br />

                            <div class="control-group">
                           <asp:Label runat="server" class="control-label" AssociatedControlID="txtaddress2" Text="PO Box/Suite/Apt:   "/>
                           <div class="controls">
                            <asp:TextBox runat="server" ID="txtaddress2"/>
                            </div>
						   </div>
                            <br />
                            
                            <div class="control-group">
							<asp:Label runat="server" class="control-label" AssociatedControlID="txtcity" Text="City:   "/>
                            <div class="controls">
                            <asp:TextBox runat="server" ID="txtcity"/>
                           </div>
						   </div>

                            <br />
                            <div class="control-group">
                            <asp:Label runat="server" class="control-label" AssociatedControlID="txtstate" Text="State:   "/>
                            <div class="controls">
                            <asp:TextBox runat="server" ID="txtstate"/>		
                            </div>
						   </div>						
                            <br />	

                            <div class="control-group">
                            <asp:Label runat="server" class="control-label" AssociatedControlID="txtZipcode" Text="ZipCode:   "/>
                            <div class="controls">
                            <asp:TextBox runat="server" ID="txtZipcode"/>
                            </div>
						   </div>								
                           <br />	

                           <div class="control-group">
                           <asp:Label runat="server" class="control-label" AssociatedControlID="txttaxid" Text="TaxID:   "/>
                            <div class="controls">
                            <asp:TextBox runat="server" ID="txttaxid"/>
                            </div>
						   </div>	
                              <br />	
                            <div class="control-group">
                            <asp:Label runat="server" class="control-label" AssociatedControlID="txtusername" Text="Username:   "/>
                            <div class="controls">
                            <asp:TextBox runat="server" ID="txtusername"/>
                             </div>
						   </div>
                              <br />	
                            <div class="control-group">
                              <asp:Label runat="server" class="control-label" AssociatedControlID="txtpassword" Text="Password:   "/>
                                <div class="controls">
                            <asp:TextBox runat="server" ID="txtpassword"/>
                            </div>
						   </div>
                                 <br />	
                            <div class="control-group">
                             <asp:Label runat="server" class="control-label" AssociatedControlID="txtpriemail" Text="Primary Email:   "/>
                                <div class="controls">
                            <asp:TextBox runat="server" ID="txtpriemail"/>
                            </div>
						   </div>
                                 <br />	
                            <div class="control-group">
                             <asp:Label runat="server" AssociatedControlID="txtsecemail" Text="Secondary Email:   "/>
                             <div class="controls">
                            <asp:TextBox runat="server" ID="txtsecemail"/>
                             </div>
						   </div>
                            <hr />

							</fieldset>		
							<div class="form-actions">
								<asp:Button runat="server" Text="Save changes" ID="savebtn" OnClick="savebtn_Click" class="btn btn-info"/>
                                <asp:Button runat="server" Text="Cancel" ID="cancelbtn" OnClick="cancelbtn_Click" class="btn"/>
							</div>



                         



   
                        <br />
                   </div>
     
         </div>
        
          </asp:Panel>
     <br />
    <br />   
    <br />
    <br /> 



</asp:Content>
