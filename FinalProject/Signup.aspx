<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="FinalProject.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            box-sizing: border-box; 
            color: rgb(0,0,0);
        }
        body {
            background-image: url('<%= ResolveUrl("~/images/light_green_background.jpeg") %>');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            height: 100%;
            background-position: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="demo" class="container-sm w-25 m-auto border-opacity-75 bg-light p-4 rounded">
        <h1 class="h1 mt-3 mb-3">Sign Up</h1>
        <asp:Label ID="Label1" CssClass="form-label" runat="server" AssociatedControlID="TextBox1" Text="Username:"></asp:Label>
        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Required="true"></asp:TextBox>

        <asp:Label ID="Label2" CssClass="form-label mt-3" runat="server" AssociatedControlID="TextBox2" Text="Password:"></asp:Label>
        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" TextMode="Password" Required="true"></asp:TextBox>

        <asp:Label ID="Label3" CssClass="form-label mt-3" runat="server" AssociatedControlID="TextBox3" Text="Email:"></asp:Label>
        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" TextMode="Email" Required="true"></asp:TextBox>

        <asp:Label ID="Label4" CssClass="form-label mt-3" runat="server" AssociatedControlID="FileUpload1" Text="Profile Picture:"></asp:Label>
        <asp:FileUpload ID="FileUpload1" CssClass="form-control-file" runat="server" />

        <asp:Button ID="Button1" CssClass="btn btn-light mt-4" style="background-color: rgb(220, 234, 183); border:none; width:100%; border-radius:50px;" runat="server" Text="Sign Up" OnClick="Button1_Click" />

        <p class="mt-3" style="color: rgb(0,0,0);">Already have an account? <a href="login.aspx">Login</a></p>

        <asp:Label ID="lblMessage" Visible="false" CssClass="alert alert-danger alert-dismissible mt-3" runat="server">
            <span><button type="button" class="btn-close" data-bs-dismiss="alert"></button></span>
        </asp:Label>
    </div>
</asp:Content>
