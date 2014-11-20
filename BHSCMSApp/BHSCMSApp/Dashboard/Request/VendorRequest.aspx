<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardVendor.Master" AutoEventWireup="true" CodeBehind="VendorRequest.aspx.cs" Inherits="BHSCMSApp.Dashboard.Request.VendorRequest" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
         <h3 class="headers" style="margin-left:20px">Category Addition Petition Request</h3> 
          <hr />
         <p style="margin-left:20px">*Please complete the form below to request a change in your product categories.</p>
         <br />   

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CompanyName" CssClass="col-md-6 control-label">Company Name*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="CompanyName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CompanyName" ValidationGroup="request" 
                    CssClass="text-danger"  ErrorMessage="The company name field is required." />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-6 control-label">Contact Number*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber" ValidationGroup="request" 
                    CssClass="text-danger" ErrorMessage="The contact number field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-6 control-label">Email*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ValidationGroup="request" 
                    CssClass="text-danger" ErrorMessage="The email address field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Email" Display="Dynamic" ErrorMessage="Incorrect E-mail Address!" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Reason" CssClass="col-md-6 control-label">Please give a reason for the addition:*</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Reason" CssClass="form-control" MaxRow="5" Columns="5" TextMode="MultiLine" style="resize:none" Width="60%"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Reason" ValidationGroup="request"
                    CssClass="text-danger" ErrorMessage="A reason for a Category Addition is required." />
            </div>
        </div>

        <%-- This needs to be implemented. Where is the file upload codebehind? --%>
        <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="FileUpload" CssClass="col-md-8 control-label">Please Select Files:</asp:Label>

            <div class="col-md-8">
            <asp:FileUpload runat="server" ID="FileUpload" />
            </div>
            
        </div>
         <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="chkCommodities" CssClass="col-md-8 control-label">Categories</asp:Label>
            <div class="col-md-8">
                <asp:DropDownCheckBoxes ID="chkCommodities" runat="server" AddJQueryReference="True" UseSelectAllNode="True" CssClass="col-md-6 control-label">
                <Style SelectBoxWidth="300" DropDownBoxBoxWidth="300" DropDownBoxBoxHeight="130" />
                <Texts SelectBoxCaption="Select from list" />
                </asp:DropDownCheckBoxes>
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="chkCommodities" ValidationGroup="request"
                    CssClass="text-danger" ErrorMessage="Please Select at least one Category." />--%>
                <br />
        <br />
        <br />
        <br />
            </div>
        </div>
          <br />
        <br />
        <br />
        <br />
   

        <div class="form-group">
            <div class="col-md-8">
                <asp:Button runat="server" OnClick="CreateAddition_Click" Text="Submit" CssClass="btn btn-info" CausesValidation="true" ValidationGroup="request" />
            </div>
        </div>

        </div>


    <script type="text/javascript">
        $(document).ready(function () {
            $('#PhoneNumber').mask('(000) 000-000');
        });

</script>


    <br />
        <br />
        <br />
    <br />
        <br />
        <br />
<br />
        

</asp:Content>