<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="EditVendor.aspx.cs" Inherits="BHSCMSApp.Dashboard.Register.EditVendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="row" style="background-color:white; width:100%">
        <div class="col-md-6">
            <h5>Vendor Information</h5>
             		
                            <br />
                           <fieldset>
							<h4>Edit Information</h4>
                             <br />
                                <br />
                            <div class="control-group">
                            <asp:Label runat="server" class="control-label" AssociatedControlID="ddstatus" Text="Status:   "/>
                            <div class="controls">
                            <asp:DropDownList ID="ddstatus" runat="server" CssClass="form-control" AutoPostBack="true" Width="25%">
                                            <asp:ListItem Value="1">Approved</asp:ListItem>
                                            <asp:ListItem Value="2">Pending</asp:ListItem>
                                             <asp:ListItem Value="3">Disapproved</asp:ListItem>
                                             <asp:ListItem Value="4">Sanctioned</asp:ListItem>
                            </asp:DropDownList>
                           </div>
						   </div>	
                            <br /> 
                               <br />

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
     <br />
    <br />   
    <br />
    <br /> 
    
         


</asp:Content>
