<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalProject.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hero-carousel {
            position: relative;
            width: 80%; /* Adjust width as needed */
            height: 70vh; /* Adjust height based on viewport height */
            overflow: hidden;
            margin: 20px auto; /* Center the carousel */
            border-radius: 15px; /* Rounded corners for the carousel */
            box-shadow: 0 4px 8px rgba(0,0,0,0.3); /* Subtle shadow for better depth */
        }

            .hero-carousel .carousel-item img {
                object-fit: cover; /* Ensure images cover the container */
                width: 100%; /* Ensure images cover the entire width */
                height: 100%; /* Ensure images cover the entire height */
                transition: transform 0.5s ease; /* Smooth transition for zoom effect */
            }

            .hero-carousel .carousel-item:hover img {
                transform: scale(1.1); /* Zoom-in effect on hover */
            }

        /* Carousel controls styling */
        .carousel-control-prev-icon, .carousel-control-next-icon {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for controls */
            border-radius: 50%; /* Rounded controls */
        }

        .carousel-indicators li {
            background-color: darkgreen; /* Dark green color for indicators */
        }

        .carousel-indicators .active {
            background-color: gold; /* Gold color for active indicator */
        }

        /* Ensure responsiveness */
        @media (max-width: 768px) {
            .hero-carousel {
                height: 50vh; /* Adjust height for smaller screens */
            }
        }

        @media (max-width: 576px) {
            .hero-carousel {
                height: 40vh; /* Further adjust height for extra small screens */
            }
        }

        /* Play/Pause Button Styling */
        .carousel-control-custom {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.5);
            border: none;
            color: white;
            font-size: 24px;
            padding: 10px;
            cursor: pointer;
            border-radius: 50%;
        }
        /*section feutures of books*/
        .featured-books {
            padding: 40px 20px;
            background-color: #f9f9f9;
        }

        .section-title {
            font-size: 28px;
            margin-bottom: 30px;
            text-align: center;
        }

        .book-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin: 20px;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            max-width: 300px;
        }

            .book-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

            .book-card img {
                width: 100%;
                height: auto;
                max-height: 250px;
                /*object-fit: cover;*/
                margin-bottom: 15px;
                border-radius: 8px;
            }

            .book-card h5 {
                font-size: 18px;
                margin-top: 10px;
                font-weight: bold;
            }

            .book-card p {
                font-size: 14px;
                color: #555;
            }

            .book-card .rating {
                margin-bottom: 10px;
                color: gold;
            }

            .book-card .btn {
                background-color: darkgreen;
                color: white;
                border-radius: 20px;
                padding: 10px 20px;
                font-size: 14px;
                transition: background-color 0.3s ease-in-out;
            }

                .book-card .btn:hover {
                    background-color: black;
                }


        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-container .book-card {
                flex: 0 0 45%;
                max-width: 45%;
            }
        }

        @media (max-width: 576px) {
            .card-container .book-card {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Carousel Section -->
    <section class="hero-carousel">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="Images/hero4.jpg" class="d-block w-100" alt="High Quality Book Image 1">
                </div>
                <div class="carousel-item">
                    <img src="Images/hero5.jpg" class="d-block w-100" alt="High Quality Book Image 2">
                </div>
                <div class="carousel-item">
                    <img src="Images/hero6.jpg" class="d-block w-100" alt="High Quality Book Image 3">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </a>
            <button class="carousel-control-custom" id="carouselControlBtn" onclick="toggleCarousel()">
                <span id="carouselControlIcon">Pause</span>
            </button>
        </div>
    </section>
    <!-- Featured Books Section -->
    <!-- Featured Books Section -->
    <section class="featured-books">
        <div class="container">
            <h2 class="section-title">Featured Books</h2>
            <div class="row card-container">
                <asp:Repeater ID="FeaturedBooksRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 book-card">
                            <img class="card-img" src='<%# Eval("CoverImage") %>' alt='<%# Eval("Title") %>' />
                            <h5 class="card-title"><%# Eval("Title") %></h5>
                            <p class="card-text">by <%# Eval("Author") %></p>
                            <div class="rating">
                                <%# GenerateStars(Convert.ToInt32(Eval("Rating"))) %>
                            </div>
                            <a href="#" class="btn">View Details</a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>




    <script>
        // JavaScript to handle custom carousel control
        var isPlaying = true;
        var carousel = document.getElementById('carouselExampleIndicators');
        var carouselControlBtn = document.getElementById('carouselControlBtn');
        var carouselControlIcon = document.getElementById('carouselControlIcon');
        var carouselInstance = new bootstrap.Carousel(carousel, {
            interval: 2000, // 2 seconds interval for automatic sliding
            pause: false
        });

        function toggleCarousel() {
            if (isPlaying) {
                carouselInstance.pause();
                carouselControlIcon.textContent = 'Play';
            } else {
                carouselInstance.cycle();
                carouselControlIcon.textContent = 'Pause';
            }
            isPlaying = !isPlaying;
        }

        //feutres of books
        document.addEventListener("DOMContentLoaded", function () {
            fetch('/api/books') // Adjust the URL if needed
                .then(response => response.json())
                .then(data => {
                    const bookContainer = document.getElementById('bookContainer');
                    data.forEach(book => {
                        const cardHtml = `
                        <div class="col-md-4">
                            <div class="card">
                                <img src="${book.coverImage}" class="card-img-top" alt="${book.title}">
                                <div class="card-body">
                                    <h5 class="card-title">${book.title}</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">${book.author}</h6>
                                    <div class="rating">
                                        ${'★'.repeat(book.rating)}${'☆'.repeat(5 - book.rating)}
                                    </div>
                                    <a href="/book/${book.id}" class="btn">View Details</a>
                                </div>
                            </div>
                        </div>
                    `;
                        bookContainer.innerHTML += cardHtml;
                    });
                })
                .catch(error => console.error('Error fetching books:', error));
        });
    </script>

</asp:Content>

