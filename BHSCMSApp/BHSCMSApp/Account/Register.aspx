<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BHSCMSApp.Account.Register" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%--<h2><%: Title %>.</h2>--%>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
       
    <div class="form-horizontal">
        
         <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
       
        <div class="row" style="margin: 0 auto">

        <div class="col-md-6" ><%--ends first column--%> 
            <br />
        <h4>Enter Company Information</h4>        
            
    
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CompanyName" CssClass="col-md-4 control-label">Company Name*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="CompanyName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CompanyName" ValidationGroup="register" 
                    CssClass="text-danger"  ErrorMessage="The company name field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-4 control-label">Phone Number*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The phone number field is required." />
                
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FaxNumber" CssClass="col-md-4 control-label">Fax Number</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="FaxNumber" CssClass="form-control" ValidationGroup="register" />                
            </div>
        </div>
        <br />
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-4 control-label">Address*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Address" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The address field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address2" CssClass="col-md-4 control-label">PO Box/Suite/Apt</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Address2" CssClass="form-control" />                
            </div>
        </div>
         <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="City" CssClass="col-md-4 control-label">City*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="City" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="City" ValidationGroup="register" Display="Dynamic" 
                    CssClass="text-danger" ErrorMessage="The city field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="City" runat="server" CssClass="text-danger" ErrorMessage="Please use letters only!" Display="Dynamic" ValidationExpression="^[a-zA-Z]+"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddState" CssClass="col-md-4 control-label">State*</asp:Label>
            <div class="col-md-8">
                
                <asp:DropDownList runat="server" ID="ddState" Width="50%"  CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
	                <asp:ListItem Value="AK">Alaska</asp:ListItem>
	                <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	                <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	                <asp:ListItem Value="CA">California</asp:ListItem>
	                <asp:ListItem Value="CO">Colorado</asp:ListItem>
	                <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	                <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	                <asp:ListItem Value="DE">Delaware</asp:ListItem>
	                <asp:ListItem Value="FL">Florida</asp:ListItem>
	                <asp:ListItem Value="GA">Georgia</asp:ListItem>
	                <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	                <asp:ListItem Value="ID">Idaho</asp:ListItem>
	                <asp:ListItem Value="IL">Illinois</asp:ListItem>
	                <asp:ListItem Value="IN">Indiana</asp:ListItem>
	                <asp:ListItem Value="IA">Iowa</asp:ListItem>
	                <asp:ListItem Value="KS">Kansas</asp:ListItem>
	                <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	                <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	                <asp:ListItem Value="ME">Maine</asp:ListItem>
	                <asp:ListItem Value="MD">Maryland</asp:ListItem>
	                <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	                <asp:ListItem Value="MI">Michigan</asp:ListItem>
	                <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	                <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	                <asp:ListItem Value="MO">Missouri</asp:ListItem>
	                <asp:ListItem Value="MT">Montana</asp:ListItem>
	                <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	                <asp:ListItem Value="NV">Nevada</asp:ListItem>
	                <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	                <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	                <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	                <asp:ListItem Value="NY">New York</asp:ListItem>
	                <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	                <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	                <asp:ListItem Value="OH">Ohio</asp:ListItem>
	                <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	                <asp:ListItem Value="OR">Oregon</asp:ListItem>
	                <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	                <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	                <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	                <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	                <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	                <asp:ListItem Value="TX">Texas</asp:ListItem>
	                <asp:ListItem Value="UT">Utah</asp:ListItem>
	                <asp:ListItem Value="VT">Vermont</asp:ListItem>
	                <asp:ListItem Value="VA">Virginia</asp:ListItem>
	                <asp:ListItem Value="WA">Washington</asp:ListItem>
	                <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	                <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	                <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                </asp:DropDownList>                
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddState" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The state field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Zipcode" CssClass="col-md-4 control-label">Zip/Postal Code*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Zipcode" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Zipcode" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The zipcode field is required." />                
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TaxID" CssClass="col-md-4 control-label">TaxID*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="TaxID" CssClass="form-control" />   
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControltoValidate="TaxID" ErrorMessage="TaxID field is required."></asp:RequiredFieldValidator>                          
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="chkCommodities" CssClass="col-md-4 control-label">Categories</asp:Label>
            <div class="col-md-8" style="text-align:left">               
               <%-- <asp:DropDownCheckBoxes runat="server" ID="chkCommodities" CssClass="form-control" TextAlign="Left">
               <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="300" DropDownBoxBoxHeight="160"/>
                <Texts SelectBoxCaption="Select Categories" />
                </asp:DropDownCheckBoxes>    --%>
                       
                <asp:DropDownCheckBoxes ID="chkCommodities" runat="server" 
                AddJQueryReference="True" UseSelectAllNode="True">
                <Style SelectBoxWidth="300" DropDownBoxBoxWidth="300" DropDownBoxBoxHeight="130" />
                <Texts SelectBoxCaption="Select from list" />
            </asp:DropDownCheckBoxes>

                    
            </div>
        </div>                   

        
       </div><%--ends first column--%>

        <div class="col-md-6" ><%--starts second column--%>   
            <br />      
        <h4>Enter Account Login Information</h4>
         <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-4 control-label">User name*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="UserName" Display="Dynamic" ErrorMessage="Only leters and numbers are allows!" ValidationExpression="^[a-zA-Z0-9]+"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The password field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Password" Display="Dynamic" ErrorMessage="Your password must be 6-20 characters long!" ValidationExpression="^\w{6,20}"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-4 control-label">Confirm password*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" ValidationGroup="register" 
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
         <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-4 control-label">Email*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The email address field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Email" Display="Dynamic" ErrorMessage="Incorrect E-mail Address!" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AltEmail" CssClass="col-md-4 control-label">Alternative Email*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="AltEmail" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AltEmail" ValidationGroup="register" 
                    CssClass="text-danger" ErrorMessage="The alternate email address field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="AltEmail" ErrorMessage="Incorrect E-mail Addess!" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="docUpload" CssClass="col-md-4 control-label">W9 Form*</asp:Label>
            <div class="col-md-8">
                <asp:FileUpload runat="server" ID="docUpload" CssClass="form-control" Width="75%" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="docUpload" ID="reqdocupload"
                    CssClass="text-danger" ErrorMessage="The tax form is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="RegCode" CssClass="col-md-4 control-label">Registration Code</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="RegCode" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="RegCode"
                    CssClass="text-danger" ValidationGroup="register" ErrorMessage="Registration Code is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" Width="40%" CssClass="btn btn-info" CausesValidation="true" ValidationGroup="register" />
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
             <br />
             <br />
    </div><%--ends second column--%>
    </div><%--ends row column--%>
    </div><%--ends form column--%>
    
    <br />
             <br />
             <br />
     <br />
             <br />

    <script src="~/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="~/jquery.maskedinput-1.2.2.js" type="text/javascript"></script>
    
     <script type="text/javascript">
    $(document).ready(function () {
        $("#<%=FaxNumber.ClientID%>").mask("(000) 000-000");
        $('#Zipcode').mask('00000-000');
        $('#TaxID').mask('00-0000000');
    });
         </script>


</asp:Content>

