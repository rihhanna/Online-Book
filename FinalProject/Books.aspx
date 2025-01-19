<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="FinalProject.Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            text-align: center;
            padding: 1.25rem;
        }
        .card-title {
            font-size: 1.25rem;
            margin-bottom: 0.75rem;
        }
        .card-text {
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }
        .pagination {
            justify-content: center;
            margin-top: 1rem;
        }
        .modal-body {
            text-align: center;
        }
        .text-danger {
            color: #dc3545;
        }
        .filter-select {
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }
        .filter-select:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }
        .modal-header {
            background-color: #343a40;
            color: white;
        }
        .modal-footer {
            background-color: #f8f9fa;
        }
        .modal-title {
            font-size: 1.5rem;
        }
        .modal-body h4 {
            margin-bottom: 1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">All Books</h2>

        <!-- Message Label -->
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mb-4"></asp:Label>

        <!-- Filter Books by Category -->
        <div class="row justify-content-center mb-4">
            <div class="col-md-6">
                <select id="categoryFilter" class="form-control filter-select" onchange="filterBooksByCategory()">
                    <option value="All">All Categories</option>
                    <!-- Dynamically fill categories from backend if necessary -->
                </select>
            </div>
        </div>

        <!-- Book Cards -->
        <div class="row" id="bookContainer">
            <asp:Repeater ID="rpBooks" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4 book-card" data-category='<%# Eval("Category") %>'>
                        <div class="card h-100 shadow-sm">
                        <img src='<%# ResolveUrl("~/Images/" + Eval("CoverImage")) %>' class="card-img-top" alt="Book Cover" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Title") %></h5>
                                <p class="card-text"><i class="fas fa-user"></i> <strong>Author:</strong> <%# Eval("Author") %></p>
                                <p class="card-text"><i class="fas fa-tag"></i> <strong>Category:</strong> <%# Eval("Category") %></p>
                                <p class="card-text"><i class="fas fa-dollar-sign"></i> <strong>Price:</strong> $<%# Eval("Price") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#"><i class="fas fa-chevron-left"></i> Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">Next <i class="fas fa-chevron-right"></i></a></li>
            </ul>
        </nav>

        <!-- Book Details Modal -->
        <div class="modal fade" id="bookDetailsModal" tabindex="-1" role="dialog" aria-labelledby="bookDetailsModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="bookDetailsModalLabel">Book Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4 id="modalTitle"></h4>
                        <p><i class="fas fa-user"></i> <strong>Author:</strong> <span id="modalAuthor"></span></p>
                        <!-- Description is removed -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap and jQuery JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Filter books by category
        function filterBooksByCategory() {
            var selectedCategory = document.getElementById('categoryFilter').value;
            var books = document.querySelectorAll('.book-card');

            books.forEach(function (book) {
                if (selectedCategory === 'All' || book.getAttribute('data-category') === selectedCategory) {
                    book.style.display = 'block';
                } else {
                    book.style.display = 'none';
                }
            });
        }

        // Show book details in modal
        function showBookDetails(title, author) {
            document.getElementById('modalTitle').innerText = title;
            document.getElementById('modalAuthor').innerText = author;
        }
    </script>
</asp:Content>
