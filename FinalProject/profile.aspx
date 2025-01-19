<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="FinalProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
             background-size: 98%;
            background-image: url('<%= ResolveUrl("~/images/bgp.jpg")%>');
            /**/
            background-repeat: no-repeat;
            background-position: center center;

            height: 100%; 
            margin: 0;
            padding: 0;
          

        }
        .container{
           background-color: rgba(0,0,0,0.1);
           margin-top: 10px;
           height: 500px;

        }
       #demo {
            border-radius: 10%;
            margin-top: 20px;
            justify-content: center;
            text-align: center;
            color: rgb(0, 0, 0);
            padding: 10px;
            height: 300px;
            background-color:rgba(255, 255, 255, 1);
            padding: 10px;
            width: 250px;
            box-shadow: 0 0 20px rgba(195, 205, 229, 0.35);
}
       #card2{
            margin-top: 20px;
            
            text-align: left;
            border-radius: 5%;
            padding: 10px;
            height: 250px;
            background-color:rgba(255, 255, 255, 1);
            padding: 10px;
            width: 500px;
            color: rgb(0, 0, 0);
            box-shadow: 0 0 20px rgba(163, 174, 216, 0.35);
       }
       .col-6 {
        display: flex;
        justify-content: center; /* Center horizontally */
        align-items: center;  /*Center vertically */
        
        
    }
       .card .card-img{
           border-radius: 50%;
       }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" >
        <div class="row">
            <div class="col-6">
     <asp:Repeater ID="Repeater1" runat="server">
         <ItemTemplate>
   
    <div  id="demo" class="card">
       
        <asp:Image ID="imgProfile" class="card-img" ImageUrl='<%# Eval("ProfileImage") %>' runat="server"/>
          <p class="card-text"><strong>Username: </strong><%#Eval("username") %> </p>
        
        </div>
      
             </ItemTemplate>
    </asp:Repeater>
                  </div>
  <div class="col-6">
    <asp:Repeater ID="Repeater2" runat="server">
        <ItemTemplate>
            <div id="card2" class="card">
                                <h5 class="bx bxs-user-badge"><strong>My contact information</strong></h5>
                               <hr style="color: rgb(128, 128, 128);"/>
                                <p class="card-text"><strong>Name: </strong> <%# Eval("Name")%></p>
                                <p class="card-text"><strong>Email: </strong> <%# Eval("Email")%></p>
                                <p class="card-text"><strong>Phone: </strong> <%# Eval("Phone")%></p>
                                <p class="card-text"><strong>Address: </strong> <%# Eval("Addresss")%></p>
                                 
        </ItemTemplate>
    </asp:Repeater>
      </div>
              </div>
        </div>
</asp:Content>
