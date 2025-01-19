<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageBooks.aspx.cs" Inherits="FinalProject.ManageBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
        /* Custom Styles for Manage Books Page */
        .page-header {
            background-color: #089da1;
            color: #fff;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .btn-custom {
            background-color: #089da1;
            color: #fff;
        }

        .btn-custom:hover {
            background-color: #066b70;
        }

        .card {
            border: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .card-footer {
            background-color: #f8f9fa;
            border-top: none;
        }

        .card-img-top {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
        }

        .action-buttons .btn {
            width: 48%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <!-- Page Header -->
        <div class="page-header">
            <h2>Manage Books</h2>
        </div>

        <!-- Add New Book Section -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="d-flex justify-content-between">
                    <h5>Add a New Book to the Store</h5>
                    <asp:Button ID="btnAddBook" runat="server" Text="Add New Book" CssClass="btn btn-custom" OnClick="btnAddBook_Click" />
                </div>
            </div>
        </div>

        <!-- Book Cards -->
        <div class="row">
            <asp:Repeater ID="rpBooks" runat="server" OnItemCommand="rpBooks_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm">
                            <img src='<%# ResolveUrl("~/Images/" + Eval("CoverImage")) %>' class="card-img-top" alt="Book Cover" style="height: 200px; object-fit: cover;" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Title") %></h5>
                                <p class="card-text"><strong>Author:</strong> <%# Eval("Author") %></p>
                                <p class="card-text"><strong>Category:</strong> <%# Eval("Category") %></p>
                                <p class="card-text"><strong>Price:</strong> $<%# Eval("Price") %></p>
                                <p class="card-text"><strong>Quantity:</strong> <%# Eval("Quantity") %></p>
                            </div>
                            <div class="card-footer">
                                <div class="action-buttons">
                                    <!-- Edit Button -->
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditBook" CommandArgument='<%# Eval("BookID") %>' CssClass="btn btn-primary btn-sm" />
                                    <!-- Delete Button -->
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteBook" CommandArgument='<%# Eval("BookID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this book?');" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- View All Books and Browse by Category Buttons -->
        <div class="row mt-4">
            <div class="col-md-12 d-flex justify-content-between">
                <asp:Button ID="btnViewBooks" runat="server" Text="View All Books" CssClass="btn btn-info" OnClick="btnViewBooks_Click" />
                <asp:Button ID="btnCategory" runat="server" Text="Browse by Category" CssClass="btn btn-info" OnClick="btnCategory_Click" />
            </div>
        </div>
    </div>
</asp:Content>
