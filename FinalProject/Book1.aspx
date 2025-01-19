<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Book1.aspx.cs" Inherits="FinalProject.Book1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        /* Style for the book cards */
        .book-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 20px auto;
            width: 90%;
        }

        .book-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            padding: 20px;
        }

        .book-card h3 {
            color: #089da1;
            font-size: 18px;
            margin: 10px 0;
        }

        .book-card p {
            margin: 5px 0;
        }

        .book-card button {
            background-color: #089da1;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        .book-card button:hover {
            background-color: #066b70;
        }

        .price {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="book-container">
        <asp:Repeater ID="rptBooks" runat="server">
            <ItemTemplate>
                <div class="book-card">
                    <h3><%# Eval("BookTitle") %></h3>
                    <p><b>Author:</b> <%# Eval("Author") %></p>
                    <p class="price"><%# String.Format("{0:C}", Eval("Price")) %></p>
                    <button type="button">Add to Cart</button>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label> <!-- This label will display any message like 'No books found' -->
    </div>
</asp:Content>
