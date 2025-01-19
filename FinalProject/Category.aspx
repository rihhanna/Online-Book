<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="FinalProject.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2>Books by Category</h2>

        <!-- Category Dropdown -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="form-group">
                    <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged" CssClass="form-control">
                        <asp:ListItem Text="Select Category" Value="" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Message Label -->
        <div class="row mt-4">
            <div class="col-md-12">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
            </div>
        </div>

        <!-- Book Cards -->
        <div class="row mt-4">
            <asp:Repeater ID="rpBooks" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm">
                            <img src='<%# Eval("CoverImage", "~/Images/" + Eval("CoverImage")) %>' class="card-img-top" alt="Book Cover" style="height: 200px; object-fit: cover;" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Title") %></h5>
                                <p class="card-text"><strong>Author:</strong> <%# Eval("Author") %></p>
                                <p class="card-text"><strong>Category:</strong> <%# Eval("Category") %></p>
                                <p class="card-text"><strong>Price:</strong> $<%# Eval("Price") %></p>
                                <p class="card-text"><strong>Quantity:</strong> <%# Eval("Quantity") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
