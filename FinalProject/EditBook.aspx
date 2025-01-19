<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="FinalProject.EditBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            max-width: 800px;
        }
        .btn-custom {
            background-color: #004d00; /* Dark green */
            color: #fff;
        }
        .btn-custom:hover {
            background-color: #003300; /* Even darker green */
        }
        .form-label {
            font-weight: bold;
            color: #333;
        }
        .form-control {
            border-radius: 0.25rem;
        }
        .img-fluid {
            max-height: 200px;
            object-fit: cover;
        }
        .alert-message {
            font-weight: bold;
            margin-top: 20px;
        }
        .text-success {
            color: green;
        }
        .text-danger {
            color: red;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="mb-4"><i class="fas fa-edit"></i> Edit Book</h2>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="txtTitle" class="form-label">Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mt-3">
                    <label for="txtAuthor" class="form-label">Author</label>
                    <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mt-3">
                    <label for="txtCategory" class="form-label">Category</label>
                    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mt-3">
                    <label for="txtPrice" class="form-label">Price</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mt-3">
                    <label for="txtQuantity" class="form-label">Quantity</label>
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mt-3">
                    <label for="txtDescription" class="form-label">Description</label>
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="5" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mt-3">
                    <label for="imgCoverImage" class="form-label">Cover Image</label>
                    <asp:Image ID="imgCoverImage" runat="server" CssClass="img-fluid" />
                </div>
                <div class="form-group mt-3">
                    <asp:Button ID="btnUpdateBook" Text="Update Book" OnClick="btnUpdateBook_Click" CssClass="btn btn-custom" runat="server" />
                </div>
                <asp:Label ID="lblMessage" runat="server" CssClass="alert-message" />
            </div>
        </div>
    </div>

    <!-- Bootstrap and jQuery JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Optionally add any JavaScript you need here
    </script>
</asp:Content>
