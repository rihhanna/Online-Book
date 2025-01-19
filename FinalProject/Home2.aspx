<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Home2.aspx.cs" Inherits="FinalProject.Home2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        /* Main Section Styles */
        section .main {
            display: flex;
            align-items: center;
            justify-content: space-around;
            position: relative;
            top: 10%;
        }

        section .main h1 {
            position: relative;
            font-size: 55px;
            top: 80px;
            left: 25px;
        }

        section .main h1 span {
            color: #089da1;
        }

        section .main p {
            width: 650px;
            text-align: justify;
            line-height: 22px;
            position: relative;
            top: 125px;
            left: 25px;
        }

        section .main .main_tag .main_btn {
            background: #089da1;
            padding: 10px 20px;
            position: relative;
            top: 200px;
            left: 25px;
            color: #fff;
            text-decoration: none;
        }
/* Slideshow Container */
.slideshow-container {
    width: 100%; /* Full width for the slideshow */
    height: 200px; /* Reduced height */
    position: relative;
    overflow: hidden;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    top: 90px;
    left: 20px;
}

/* Individual Images */
.slideshow-container img {
    width: 30%; /* Each image takes 30% of the container width */
    height: 100%; /* Ensure images fill the container height */
    position: absolute;
    transition: transform 1s ease-in-out;
    opacity: 0;
    display: block;
}

/* Visible Image */
.slideshow-container img.active {
    opacity: 1;
    z-index: 2;
    transform: translateX(0);
}

/* Adjacent Images */
.slideshow-container img.left, .slideshow-container img.right {
    opacity: 0.5;
    z-index: 1;
}

/* Left Image Position */
.slideshow-container img.left {
    transform: translateX(-150%);
}

/* Right Image Position */
.slideshow-container img.right {
    transform: translateX(150%);
}

        /* Image Animation */
        .slideshow-container img:nth-child(1) {
            animation-delay: 0s;
        }

        .slideshow-container img:nth-child(2) {
            animation-delay: 3s;
        }

        .slideshow-container img:nth-child(3) {
            animation-delay: 6s;
        }

        @keyframes slideAnimation {
            0% {
                transform: translateX(100%);
                opacity: 0;
            }
            10% {
                transform: translateX(0%);
                opacity: 1;
            }
            30% {
                transform: translateX(0%);
                opacity: 1;
            }
            40% {
                transform: translateX(-100%);
                opacity: 0;
            }
            100% {
                transform: translateX(-100%);
                opacity: 0;
            }
        }


        /*services*/


.services h1 {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 100px;
    font-size: 50px;
    padding-top:100px;
}

.services{
    width: 100%;
    height: auto;
    margin: 35px 0;
}

.services .services_box{
    width: 95%;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: space-around;
}

.services .services_box .services_card{
    text-align: center;
    width: 310px;
    height: auto;
    box-shadow: 0 0 8px #089da1;
    padding: 15px 10px;
}

.services .services_box .services_card i{
    color: #089da1;
    font-size: 45px;
    margin-bottom: 15px;
    cursor: pointer;
}

.services .services_box .services_card h3{
    margin-bottom: 10px;
}

/*about*/

.about{
    width: 100%;
    height: auto;
    padding: 20px;
    display: flex;
    align-items: center;
    justify-content: space-around;
}

.about .about_image img{
    width: 800px;
}

.about .about_tag h1{
    font-size: 50px;
    position: relative;
    bottom: 35px;
}

.about .about_tag p{
    line-height: 22px;
    width: 650px;
    text-align: justify;
    margin-bottom: 15px;
}

.about .about_tag .about_btn{
    padding: 10px 20px;
    background: #089da1;
    color: #fff;
    text-decoration: none;
    position: relative;
    top: 50px;
}
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="main">
            <div class="main_tag">
                <h1>WELCOME TO<br><span>BOOK STORE</span></h1>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda molestias atque laborum 
                    non fuga ex deserunt. Exercitationem velit ducimus praesentium, obcaecati hic voluptate id 
                    tenetur fuga illum quidem omnis? Rerum?
                </p>
                <a href="#" class="main_btn">Learn More</a>
            </div>

            <div class="slideshow-container">
                <img src="Images/book_13.png" />
                <img src="Images/book_10.png" />
                <img src="Images/book_12.png" />
                <img src="Images/book_8.png" />
                <img src="Images/book_7.png" />
            </div>
        </div>
    </section>

      <!--Services-->



  <div class="services">
                           <h1>services</h1>

      <div class="services_box">


          <div class="services_card">
              <i class="fa-solid fa-truck-fast"></i>
              <h3>Fast Delivery</h3>
              <p>
                  Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
              </p>
          </div>

          <div class="services_card">
              <i class="fa-solid fa-headset"></i>
              <h3>24 x 7 Services</h3>
              <p>
                  Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
              </p>
          </div>

          <div class="services_card">
              <i class="fa-solid fa-tag"></i>
              <h3>Best Deal</h3>
              <p>
                  Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
              </p>
          </div>

          <div class="services_card">
              <i class="fa-solid fa-lock"></i>
              <h3>Secure Payment</h3>
              <p>
                  Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
              </p>
          </div>

      </div>
      </div>
     <!--About-->

 <div class="about">

     <div class="about_image">
         <img src="Images/about.png" />
     </div>
     <div class="about_tag">
         <h1>About Us</h1>
         <p>
             Lorem ipsum, dolor sit amet consectetur adipisicing elit. Beatae cumque atque dolor corporis 
     architecto. Voluptate expedita molestias maxime officia natus consectetur dolor quisquam illo? 
     Quis illum nostrum perspiciatis laboriosam perferendis? Lorem ipsum dolor sit amet consectetur 
     adipisicing elit. Minus ad eius saepe architecto aperiam laboriosam voluptas nobis voluptates 
     id amet eos repellat corrupti harum consectetur, dolorum dolore blanditiis quam quo.
         </p>
         <a href="#" class="about_btn">Learn More</a>
     </div>

 </div>

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



  
    <!--java-->
    <script>

    let currentIndex = 0;
const images = document.querySelectorAll('.slideshow-container img');

function showSlides() {
    images.forEach((img, index) => {
        img.classList.remove('active', 'left', 'right');
        
        if (index === currentIndex) {
            img.classList.add('active');
        } else if (index === (currentIndex - 1 + images.length) % images.length) {
            img.classList.add('left');
        } else if (index === (currentIndex + 1) % images.length) {
            img.classList.add('right');
        }
    });
    
    currentIndex = (currentIndex + 1) % images.length;
}

// Run the slideshow every 3 seconds
setInterval(showSlides, 3000);
</script>

</asp:Content>
