<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FinalProject.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

    <style>
        .dashboard-header {
            background-color: #089da1;
            color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }

        .dashboard-header h2 {
            margin: 0;
        }

        .dashboard-section {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .dashboard-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 30%;
            text-align: center;
            padding: 20px;
            transition: transform 0.2s;
        }

        .dashboard-card:hover {
            transform: scale(1.05);
        }

        .dashboard-card .card-icon {
            font-size: 50px;
            color: #089da1;
            margin-bottom: 20px;
        }

        .dashboard-card h5 {
            color: #089da1;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .dashboard-card .btn-darkgreen {
            background-color: #089da1;
            color: white;
            border-radius: 5px;
        }

        .dashboard-card .btn-darkgreen:hover {
            background-color: #066b70;
        }
    </style>

    <div class="dashboard-header">
        <h2>Admin Dashboard</h2>
    </div>

    <div class="container">
        <div class="dashboard-section">
            <!-- Manage Books Section -->
            <div class="dashboard-card">
                <i class="fas fa-book card-icon"></i>
                <h5 class="card-title">Manage Books</h5>
                <p class="card-text">Add, update, or remove books from the store.</p>
                <a href="ManageBooks.aspx" class="btn btn-darkgreen">Manage Books</a>
            </div>

            <!-- Manage Users Section -->
            <div class="dashboard-card">
                <i class="fas fa-users card-icon"></i>
                <h5 class="card-title">Manage Users</h5>
                <p class="card-text">View and manage registered users.</p>
                <a href="ManageUsers.aspx" class="btn btn-darkgreen">Manage Users</a>
            </div>

            <!-- Manage Orders Section -->
            <div class="dashboard-card">
                <i class="fas fa-shopping-cart card-icon"></i>
                <h5 class="card-title">Manage Orders</h5>
                <p class="card-text">View and manage customer orders.</p>
                <a href="ManageOrders.aspx" class="btn btn-darkgreen">Manage Orders</a>
            </div>
        </div>

        <div class="dashboard-section mt-4">
            <!-- Reports Section -->
            <div class="dashboard-card" style="width: 100%;">
                <i class="fas fa-chart-line card-icon"></i>
                <h5 class="card-title">Reports</h5>
                <p class="card-text">Generate sales and user activity reports.</p>
                <a href="Reports.aspx" class="btn btn-darkgreen">Generate Reports</a>
            </div>
        </div>
    </div>
</asp:Content>
