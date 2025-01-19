<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="FinalProject.AddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
        /* Custom Styles for Add Book Page */
        .page-header {
            background-color: #089da1;
            color: #fff;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: bold;
        }

        .input-group-text {
            background-color: #089da1;
            color: #fff;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn-darkgreen {
            background-color: #089da1;
            color: #fff;
        }

        .btn-darkgreen:hover {
            background-color: #066b70;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <!-- Page Header -->
        <div class="page-header">
            <h2><i class="fas fa-book"></i> Add New Book</h2>
        </div>

        <!-- Add Book Form -->
        <div class="row">
            <div class="col-md-6 mx-auto">
                <!-- Title Input -->
                <div class="form-group">
                    <label for="txtTitle">Title</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-book-open"></i></span>
                        </div>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Enter book title" />
                    </div>
                </div>

                <!-- Author Input -->
                <div class="form-group mt-3">
                    <label for="txtAuthor">Author</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user-edit"></i></span>
                        </div>
                        <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" Placeholder="Enter author's name" />
                    </div>
                </div>

                <!-- ISBN Input -->
                <div class="form-group mt-3">
                    <label for="txtISBN">ISBN</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-barcode"></i></span>
                        </div>
                        <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control" Placeholder="Enter book ISBN" />
                    </div>
                </div>

                <!-- Category Input -->
                <div class="form-group mt-3">
                    <label for="txtCategory">Category</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-list-alt"></i></span>
                        </div>
                        <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" Placeholder="Enter book category" />
                    </div>
                </div>

                <!-- Price Input -->
                <div class="form-group mt-3">
                    <label for="txtPrice">Price</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                        </div>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Enter price" />
                    </div>
                </div>

                <!-- Quantity Input -->
                <div class="form-group mt-3">
                    <label for="txtQuantity">Quantity</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-boxes"></i></span>
                        </div>
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" Placeholder="Enter available quantity" />
                    </div>
                </div>

                <!-- Description Input -->
                <div class="form-group mt-3">
                    <label for="txtDescription">Description</label>
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="5" runat="server" CssClass="form-control" Placeholder="Enter a brief description of the book" />
                </div>

                <!-- Cover Image Upload -->
                <div class="form-group mt-3">
                    <label for="fileCoverImage">Cover Image</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-image"></i></span>
                        </div>
                        <asp:FileUpload ID="fileCoverImage" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <!-- Add Book Button -->
                <div class="form-group mt-3">
                    <asp:Button ID="btnAddBook" Text="Add Book" OnClick="btnAddBook_Click" CssClass="btn btn-darkgreen btn-block" runat="server" />
                </div>

               

                <!-- Message Label -->
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3" />
            </div>
        </div>
    </div>
</asp:Content>
