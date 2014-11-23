<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BHSCMSApp._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  


    <div class="content">
    <div class="jumbotron">

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
 
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="/img/baptisthealthrichmond.jpg" alt="..." class="peopleCarouselImg" style="width: 100%;  height: 350px;  max-height: 350px;">
      <div class="carousel-caption">
          <h3></h3>
      </div>
    </div>
    <div class="item">
      <img src="/img/business.jpg" alt="..." class="peopleCarouselImg" style="width: 100%;  height: 350px;  max-height: 350px;">
      <div class="carousel-caption">
          <h3></h3>
      </div>
    </div>
    <div class="item">
        <img src="/img/contract.jpg" alt="..." class="peopleCarouselImg" style="width: 100%;  height: 350px;  max-height: 350px;">     
      <div class="carousel-caption">          
      </div>
    </div>
      
  </div>
 
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div> <!-- Carousel -->













    </div>

       

        

    <div class="row row-centered">
        <div class="col-md-10 col-centered">
            <br />
            <h4>Welcome to Baptist Health’s supply acquisition system</h4>
            <br />
            <p>
              This system allows Baptists Health to connect with its vendors in a streamlined way. This system allows for exchanges to be centralized to save time for the vendors and Baptist Health. This system is used for the process of analyzing vendors’ proposals and negotiating with them to determine the best option that provides Baptist Health the greatest cost savings and also satisfy the necessary attributes.
               
            </p>
             
            <p>Should you have any questions, please do not hesitate to contact us through our contact page. We appreciate your business and hope you enjoy the site. </p>
            
        </div>
       
        <%--<div class="col-md-3 col-centered" style="background-color:white; border-radius:2px; border:solid 2px; border-color:#A8CB17" >
        <section id="loginForm" >
                <div class="form-horizontal" >
                    <h4 style="text-align:left; width:250px; background-color:#A8CB17; padding:8px; color:white; margin-left:-30px">Access Portal</h4>
                   
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-4 control-label">Username:</asp:Label>
                        <br />
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" 
                                CssClass="text-danger" ErrorMessage="The user name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password:</asp:Label>
                        <br />
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" Text="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-8">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-8">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-info" />
                        </div>
                    </div>
                </div>
                <p  style="font-size:small">
                    
                    Click <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">here</asp:HyperLink>
                    if you are a new Vendor.
                </p>
            </section>

             </div>--%>
         
            <br />
             <br />
             <br />
            
           <%-- <div class="row">
             <div class="col-md-8"></div>
              <div class="col-md-1"></div>
             <div class="col-md-3" style="background-color:#F7DED3; border-radius:4px; border-bottom:solid 2px; border-right:solid 2px; border-color:#7E7E74" >
            <h5>Notification Area:</h5>
            <p>The system will be down doing updates every Friday from 1:00 A.M to 3:00 A.M</p>
            <p>Read the last version of our Terms and conditions <a runat="server" href="~/Account/Login">here</a></p>
        </div>
            </div>--%>

       
    </div>
    </div>
       
    <br />
     <br />
     <br />
    <br />
     <br />
     <br />
    
</asp:Content>
