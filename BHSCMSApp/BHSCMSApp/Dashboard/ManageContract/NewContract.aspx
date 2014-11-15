<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="NewContract.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageContract.NewContract" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />


<div class="row" style="background-color:white; width:80%; margin-left:20px">
<div class="col-md-12">

     <asp:Panel runat="server" Visible="false" ID="Contractsubmit">
        
    <asp:Label runat="server" ID="lblsuccess"></asp:Label> <span class="glyphicon glyphicon-ok"></span>
     <br />
        <br />
    <asp:HyperLink runat="server" ID="viewContract" NavigateUrl="/Dashboard/ManageContract/ViewContracts.aspx" Text="Go to Contract's list" ForeColor="#6BBAEC"></asp:HyperLink>
       
     </asp:Panel>

     <div class="form-group">
       
        <br />
            <asp:Label runat="server" AssociatedControlID="ddRFP" CssClass="col-md-4 control-label" Visible="true" ID="ddlRFIlabel">Select RFP:</asp:Label>
            <div class="col-md-8">               
                <asp:DropDownList runat="server" ID="ddRFP" Width="50%" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddRFP_SelectedIndexChanged" AppendDataBoundItems="true" Visible="true" placeholder="Select RFP...">
               
                </asp:DropDownList>                    
            </div>
     </div>
    <div class="form-group">
        
        <br />
            <asp:Label runat="server" AssociatedControlID="txtRFIProduct" CssClass="col-md-4 control-label" Visible="false" ID="txtRFIProductlabel">Product Description:</asp:Label>
           <asp:TextBox runat="server" CssClass="form-control" Visible="false" ReadOnly="true" ID="txtRFIProduct"></asp:TextBox>

     </div>
    <br />
    <div class="form-group">        
        <br />
            <asp:Label runat="server" AssociatedControlID="txtvendor" CssClass="col-md-4 control-label" Visible="false" ID="lblselectedvendor">Vendor:</asp:Label>
           <asp:TextBox runat="server" CssClass="form-control" Visible="false" ReadOnly="true" ID="txtvendor"></asp:TextBox>

     </div>
    <br />
    <hr />

    <div class="form-group">
       
        <br />
            <asp:Label runat="server" AssociatedControlID="ddvendor" CssClass="col-md-4 control-label" Visible="true" ID="lblvendor">Select Vendor:</asp:Label>
            <div class="col-md-8">               
                <asp:DropDownList runat="server" ID="ddvendor" Width="50%" Enabled="false" CssClass="form-control" AutoPostBack="true" Visible="true">
               
                </asp:DropDownList>                    
            </div>
     </div>
    <br />
   
 <asp:Button ID="btnCont" runat="server" Text="Next" CssClass="btn btn" OnClick="btnCont_Click"/>

    
    
     <asp:Panel runat="server" Visible="false" ID="setupPanel">
        
          


         <h4>Select start and end date:</h4>
         <br />
        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
         </asp:PlaceHolder>
          

            <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Start Date:</asp:Label>
            <div class="col-md-8">               
                <input type="text" id="startdate" readonly="true" name="startdate" />                          
            </div>
     </div>
     

         <br />
         <br />
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">End Date:</asp:Label>
            <div class="col-md-8">               
                <input type="text" id="enddate" readonly="true" name="enddate"/>                        
            </div>
         </div>
      

         <br />
         <br />
         <hr />
           <h4>Contract Details:</h4>
         <br />
           <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Title:</asp:Label>
            <div class="col-md-8">               
                <asp:TextBox runat="server" ID="txtTitle"></asp:TextBox>                      
            </div>
     </div>
          <br />
         <br />
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Description:</asp:Label>
            <div class="col-md-8">               
                <asp:TextBox runat="server" ID="txtDescription"></asp:TextBox>                      
            </div>
     </div>
          <br />
         <br />
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Contract Price:</asp:Label>
            <div class="col-md-8">        
                <asp:TextBox runat="server" ID="contractPrice"></asp:TextBox>   
                 <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="contractPrice" CssClass="text-danger"
          ErrorMessage="Enter valid number" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"></asp:RegularExpressionValidator>

                                      
            </div>
         </div>
         <br />
         <br />
         <hr />
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Upload Contract <span class="glyphicon glyphicon-paperclip"></span></asp:Label>
            <div class="col-md-8">               

                <asp:FileUpload runat="server" AllowMultiple="true" ID="docUpload" />      

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please upload Contract document" 
                 ControlToValidate="docUpload" class="text-danger"></asp:RequiredFieldValidator>
                                            
            </div>
         </div>
           
         <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
           <br />
         <br />
         <hr />
     
           
   
         <asp:button runat="server" type="button" class="btn btn-default" ID="goback" Text="Go Back" OnClick="goback_Click" CausesValidation="false" ></asp:button>
          <asp:button runat="server" type="button" class="btn btn-default" ID="review" Text="Review Contract" OnClick="review_Click"></asp:button>

       
         </asp:Panel><%--ends setup panel--%>


      <asp:Panel runat="server" Visible="false" ID="reviewPanel">      
                        
        <div class="form-group">
        
       <h5>Start Date:</h5>

        <asp:label runat="server" ID="lblstartdate"></asp:label>
        <br />
       </div>

         <div class="form-group">
        
         <h5>End Date:</h5>
        <asp:label runat="server" ID="lblenddate"></asp:label>
        <br />
       </div>
            <br />

            <hr />

         <asp:button runat="server" type="button" class="btn btn-default" ID="back" Text="Go Back" OnClick="back_Click"></asp:button>
         <asp:button runat="server" type="button" class="btn btn-info" ID="Submit" Text="Submit RFP" OnClick="Submit_Click"></asp:button>

       
         </asp:Panel><%--ends review panel--%>




</div><%--end div col--%>
              
</div><%--end div row--%>
       
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
    <br /> 

</asp:Content>
