<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="NewRFI.aspx.cs" Inherits="BHSCMSApp.Dashboard.ManageRFI.NewRFI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <My:UserInfoBoxControl runat="server" ID="UserInfoBoxControl" Visible="false" />

<div class="row" style="background-color:white; width:80%; margin-left:20px">
<div class="col-md-12">
   
    <asp:Panel runat="server" Visible="false" ID="RFIsubmit">
        
    <asp:Label runat="server" ID="lblsuccess" CssClass="text-success"></asp:Label> <span class="glyphicon glyphicon-ok"></span>
     <br />
        <br />
    <asp:HyperLink runat="server" ID="viewRFI" NavigateUrl="/Dashboard/ManageRFI/ViewRFIList.aspx" Text="Go to RFI's list" ForeColor="#6BBAEC"></asp:HyperLink>
       
     </asp:Panel>


    <div class="form-group">
       
        <br />
            <asp:Label runat="server" AssociatedControlID="ddCategories" CssClass="col-md-4 control-label" Visible="true" ID="ddlCategorylabel">Select RFI Category:</asp:Label>
            <div class="col-md-8">               
                <asp:DropDownList runat="server"  ID="ddCategories" Width="50%" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddCategories_SelectedIndexChanged" Visible="true">
               <asp:ListItem></asp:ListItem>
                </asp:DropDownList>                    
            </div>
     </div>
    <div class="form-group">
        
        <br />
            <asp:Label runat="server" AssociatedControlID="txtCategory" CssClass="col-md-4 control-label" Visible="false" ID="txtCategorylabel">RFI Category:</asp:Label>
           <asp:TextBox runat="server" CssClass="form-control" Visible="false" ReadOnly="true" ID="txtCategory"></asp:TextBox>

     </div>
    <br />
    <hr />

    <asp:Panel runat="server" Visible="false" ID="panelVendors">
        
      <h4>Select vendor participants:</h4>
    <hr />
       
           
            <%--<p style="text-align: center;">Demo by Priya Darshini - Tutorial @ <a href="http://www.programming-free.com/2013/09/gridview-crud-bootstrap-modal-popup.html">Programmingfree</a></p>--%>
            
                
           
                    <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center"
                        AutoGenerateColumns="false" AllowPaging="true" OnRowDataBound="GridView1_RowDataBound"
                        DataKeyNames="VendorID, CompanyName" CssClass="table" HeaderStyle-BackColor="#40B3DF" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">

                         <pagersettings mode="Numeric" position="Bottom" pagebuttoncount="10"/>

                        <pagerstyle backcolor="#C6E8F5" height="20px" verticalalign="Bottom" horizontalalign="Center"/>


                        <Columns>
                               
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Permissions">
                                <ItemTemplate>
                                    <asp:CheckBoxList runat="server" ID="chkBoxParticipate">
                                        <asp:ListItem Value="1" Text="Participate" />
                                        <asp:ListItem Value="2" Text="View" />
                                    </asp:CheckBoxList>
                                </ItemTemplate> 
                                                                                     
                            </asp:TemplateField>                              
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" Visible="false"/>                                              
                            <asp:BoundField DataField="CompanyName" HeaderText="Company"/>
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number"/>
                             <asp:BoundField DataField="State" HeaderText="State"/>       
                                                

                            <asp:TemplateField HeaderText="Primary Email">
                            <ItemTemplate>
                          <asp:HyperLink ID="priEmail" runat="server" 
                            NavigateUrl='<%# Eval("PrimaryEmail", "mailto:{0}") %>'
                            Text='<%# Eval("PrimaryEmail") %>'>
                         </asp:HyperLink>
                          </ItemTemplate>
                         </asp:TemplateField>

                          <asp:TemplateField HeaderText="Secondary Email">
                            <ItemTemplate>
                          <asp:HyperLink ID="secEmail" runat="server" 
                            NavigateUrl='<%# Eval("SecondaryEmail", "mailto:{0}") %>'
                            Text='<%# Eval("SecondaryEmail") %>'>
                         </asp:HyperLink>
                          </ItemTemplate>
                         </asp:TemplateField>
                         
                                              
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnCont" runat="server" Text="Next" CssClass="btn btn" OnClick="btnCont_Click"/>

    </asp:Panel><%--ends vendor list panel--%>

    <asp:Panel runat="server" Visible="false" ID="panelvendorlist">
        <br />

        <h4>Selected Vendors</h4>
        <br />
        <div class="form-group">
        
       <h5 style="background-color:lightgray; width:90px; padding:4px; border-radius:4px">Participants:</h5>

        <asp:label runat="server" ID="participatelist"></asp:label>
        <br />
       </div>

         <div class="form-group">
        
          <h5 style="background-color:lightgray; width:90px; padding:4px; border-radius:4px">View Only:</h5>
        <asp:label runat="server" ID="viewlist"></asp:label>
        <br />
       </div>

       
    </asp:Panel>
       

    <br />
    <hr />



     <asp:Panel runat="server" Visible="false" ID="setupPanel">
        
          


         <h4>Select start and end date:</h4>
         <br />
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
                <asp:TextBox runat="server" ID="currentPrice"></asp:TextBox>   
                 <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="currentPrice" CssClass="text-danger"
          ErrorMessage="Enter valid number" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"></asp:RegularExpressionValidator>

                                      
            </div>
         </div>
         <br />
         <br />



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
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="true">Upload RFI document <span class="glyphicon glyphicon-paperclip"></span></asp:Label>
            <div class="col-md-8">               

                <asp:FileUpload runat="server" AllowMultiple="true" ID="docUpload" />      

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please upload RFI document" 
                 ControlToValidate="docUpload" class="text-danger"></asp:RequiredFieldValidator>
                                            
            </div>
         </div>
           
         <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
          <br />
         <br />
           
     
           
   
         <asp:button runat="server" type="button" class="btn btn-default" ID="goback" Text="Go Back" OnClick="goback_Click" CausesValidation="false"></asp:button>
          <asp:button runat="server" type="button" class="btn btn-default" ID="review" Text="Review RFI" OnClick="review_Click"></asp:button>

       
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

         <asp:button runat="server" type="button" class="btn btn-default" ID="back" Text="Go Back" OnClick="back_Click" CausesValidation="false"></asp:button>
         <asp:button runat="server" type="button" class="btn btn-info" ID="Submit" Text="Submit RFI" OnClick="Submit_Click1" CausesValidation="true"></asp:button>

       
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
