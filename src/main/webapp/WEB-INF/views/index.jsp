<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <link href="/css/index.css" rel="stylesheet" type="text/css">
    <script src="/js/holder.js"></script>
</head>

<body>
<main>
    <div class="container py-4">
        <div class="header">
            <%-- start of header --%>
            <jsp:include page="common/header.jsp" />
            <%-- end of header --%>
        </div>

        <%-- start of content --%>
        <div class="content">

            <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                        <img data-src="holder.js/800x400?auto=yes&amp;bg=777&amp;fg=555&amp;text=game image1" />
                    </div>

                    <div class="carousel-item">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                        <img data-src="holder.js/800x400?auto=yes&amp;bg=777&amp;fg=555&amp;text=game image2" />
                    </div>

                    <div class="carousel-item">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                        <img data-src="holder.js/800x400?auto=yes&amp;bg=777&amp;fg=555&amp;text=game image3" />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <div class="p-5 mb-4 bg-light rounded-3">
                <div class="container-fluid py-5">
                    <h2>Welcome!</h2>
                    <p>This Page is Made by Jonghyun Choi.</p>
                </div>
            </div>

            <div class="row align-items-md-stretch">
                <div class="col-md-6">
                    <div class="h-100 p-5 text-white bg-dark rounded-3">
                        <h2>Go Community!</h2>
                        <p>This Board is Made by Spring Boot!</p>
                        <p>Design by Bootstrap.</p>
                        <a class="btn btn-outline-light" type="button" href="/board/list">Go Board</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="h-100 p-5 bg-light border rounded-3">
                        <h2>Go Store!</h2>
                        <p>View and Buy the Game!</p>
                        <p>Design by Bootstrap.</p>
                        <a class="btn btn-outline-secondary" type="button" href="/store/list">Go Store</a>
                    </div>
                </div>
            </div>
        </div>
        <%-- end of content --%>

        <div class="footer">
            <%-- start of footer --%>
            <jsp:include page="common/footer.jsp" />
            <%-- end of footer --%>
        </div>
    </div>
</main>


<!-- bootstrap.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
</body>
</html>