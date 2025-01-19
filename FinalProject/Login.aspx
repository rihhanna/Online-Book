<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalProject.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
     *{
         font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
         box-sizing: border-box; 
         color: rgb(0,0,0);

     }
       body {
           
          background-image: url('<%= ResolveUrl("~/Images/light_green_background.jpeg") %>');
          background-size: cover; /* Makes the background cover the entire page */
          background-position: center center; /* Center the image */
          background-repeat: no-repeat; /* Prevents the image from repeating */
          height: 100%; /* Ensures the body takes up the full height */
          margin: 0;
          padding: 0;
      }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="demo" class="container-sm w-25 m-auto mt-5">
      <h1 class="h1 mt-3 mb-3" > Log in </h1>

      <div class="form-group">
          <asp:Label ID="Label1" CssClass="form-label" runat="server"><span class="bx bxs-user"></span>Username: </asp:Label>
          <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
          

      </div>
      <div class="form-group">
          <asp:Label ID="Label2" CssClass="form-label" runat="server" ><span><i class="bx bxs-lock-alt"></i></span> Password: </asp:Label>
          <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
          
      </div>
      <div id="demo2" class="row">
                      
      <asp:button ID="button1" runat="server" class="btn btn-sm btn-light mt-4 m-auto " style="background-color:rgb(220, 234, 183); border:none; width:90%; height:45px; border-radius: 50px;" Text="Log in"  OnClick="button1_Click " />
       <p>Don't have an account? <span><a href="signup.aspx">Sign up</a></span></p>
      </div>
  </div>
</asp:Content>
