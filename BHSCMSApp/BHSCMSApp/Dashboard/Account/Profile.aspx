<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BHSCMSApp.Dashboard.Account.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

    <asp:Panel runat="server" ID="profile" Visible="true">
	<div class="row" style="background-color:white; width:100%">
          <div class="col-md-12">
             
					
						<fieldset>
							<legend><span class="glyphicon glyphicon-user"></span> My Profile</legend>

                            <asp:Label runat="server" AssociatedControlID="lblempid" Text="Employee ID: "/>
                            <asp:Label runat="server" ID="lblempid"/>
                            <hr />
                            <br />
                           <asp:Label runat="server" AssociatedControlID="lblfname" Text="First Name: "/>
                            <asp:Label runat="server" ID="lblfname"/>
                            <br />
                            <asp:Label runat="server" AssociatedControlID="lbllname" Text="Last Name:   "/>
                            <asp:Label runat="server" ID="lbllname"/>
							<br />
                            <hr />
                            <asp:Label runat="server" AssociatedControlID="lblusername" Text="Username:   "/>
                            <asp:Label runat="server" ID="lblusername"/>
                           <br />
                           <asp:Label runat="server" AssociatedControlID="lblpassword" Text="Password:   "/>
                            <asp:Label runat="server" ID="lblpassword"/>
                            <br />
                            <hr />
							<asp:Label runat="server" AssociatedControlID="lblpriemail" Text="Primary Email:   "/>
                            <asp:Label runat="server" ID="lblPriEmail"/>

                            <br />
                            <asp:Label runat="server" AssociatedControlID="lblsecemail" Text="Secondary Email:   "/>
                            <asp:Label runat="server" ID="lblsecemail"/>

								
                           <br />	
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
            					
						<fieldset>
							<h4>Edit Profile</h4>
                            <br />
                             <h5>Personal Information:</h5>
                            <hr />
                            <div class="control-group">
								<label class="control-label" for="input01">Employee ID</label>
								<div class="controls">
									<asp:TextBox runat="server" ReadOnly="true" BorderColor="Transparent" id="empID"/>
								</div>
							</div>
                            <br />                            

							<div class="control-group">
								<label class="control-label" for="input01">First Name</label>
								<div class="controls">
									<asp:TextBox runat="server" id="fname"/>
								</div>
							</div>
                            <br />
                            <div class="control-group">
								<label class="control-label" for="input01">Last Name</label>
								<div class="controls">
									<asp:TextBox runat="server" id="lname"/>
								</div>
							</div>
                            <br />
                             <h5>Account Information:</h5>
                            <hr />
                            <div class="control-group">
								<label class="control-label" for="input01">UserName</label>
								<div class="controls">
									<asp:TextBox runat="server" id="username"/>
								</div>
							</div>
                            <br />
                            <div class="control-group">
								<label class="control-label" for="input01">Password</label>
								<div class="controls">
									<asp:TextBox runat="server" id="password"/>
								</div>
							</div>
							<br />
                             <h5><span class="glyphicon glyphicon-envelope"></span> Email Address:</h5>
                            <hr />                           
							<div class="control-group">
								<label class="control-label" for="input01">Primary:</label>
								<div class="controls">
									<asp:TextBox runat="server" id="priEmail" Width="40%"/>
								</div>
							</div>
                            <br />
                            <div class="control-group">
								<label class="control-label" for="input01">Secondary:</label>
								<div class="controls">
									<asp:TextBox runat="server" id="secEmail" Width="40%"/>
								</div>
							</div>
								
                           <br />		
							
											
							<div class="form-actions">
								<asp:Button runat="server" Text="Save changes" ID="savebtn" OnClick="savebtn_Click" class="btn btn-info"/>
                                <asp:Button runat="server" Text="Cancel" ID="cancelbtn" OnClick="cancelbtn_Click" class="btn"/>
							</div>



                            </fieldset>



   
                        <br />
                   </div>
     
         </div>
          </asp:Panel>
     <br />
    <br />   
    <br />
    <br /> 
</asp:Content>
