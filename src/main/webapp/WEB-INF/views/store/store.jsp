<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Store</title>

    <link href="/css/index.css" rel="stylesheet" type="text/css">
    <link href="/css/common.css" rel="stylesheet" type="text/css">
    <script src="/js/holder.js"></script>
</head>

<body>
<main>
    <div class="container py-4">
        <div class="header">
            <%-- start of header --%>
            <jsp:include page="../common/header.jsp" />
            <%-- end of header --%>
        </div>

        <%-- start of content --%>
        <div class="content">
            <div class="album py-5">
                <div class="container">
                    <p class="fw-bold fs-3">Game List</p>
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                        <c:forEach var="sellGameDTO" items="${sellGameCarrier}">
                            <div class="col">
                                <div class="card shadow-sm">
                                    <img class="bd-placeholder-img card-img-top" data-src="holder.js/800x400?auto=yes&amp;bg=777&amp;fg=555&amp;text=${sellGameDTO.name}" width="100%" height="225" focusable="false" />

                                    <div class="card-body">
                                        <p class="card-text">${sellGameDTO.name}</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <a href="/store/buyProcess?name=${sellGameDTO.name}&price=${sellGameDTO.price}&number=${sellGameDTO.number}" class="btn btn-primary text-decoration-none">구매</a>
                                            </div>
                                            <small class="text-muted">${sellGameDTO.price}원 | 수량: ${sellGameDTO.number}</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>

            <hr />

            <div class="container">
                <p class="fw-bold fs-3">Sold List</p>
                <table class="table table-hover" border="1">
                    <thead>
                    <tr class="text-center">
                        <th>제목</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>비고</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="soldGameDTO" items="${soldGameCarrier}">
                        <tr class="text-center">
                            <td>${soldGameDTO.name}</td>
                            <td>${soldGameDTO.price}</td>
                            <td>${soldGameDTO.number}</td>
                            <td><a class="btn btn-primary" href="/store/refundProcess?name=${soldGameDTO.name}&number=${soldGameDTO.number}">환불</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
        <%-- end of content --%>

        <div class="footer">
            <%-- start of footer --%>
            <jsp:include page="../common/footer.jsp" />
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