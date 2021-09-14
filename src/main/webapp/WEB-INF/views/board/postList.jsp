<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Board</title>
</head>

<body>
<main>
    <div class="container py-4">
        <div class="header">
            <%-- start of header --%>
            <jsp:include page="../common/header.jsp" />
            <%-- end of header --%>
        </div>

        <div class="content">
            <%-- start of content --%>
            <div class="p-5 mb-4 rounded-3">
                <div class="container-fluid py-5">
                    <p class="fw-bold fs-3">Board List</p>
                    <table class="table table-hover" border="1">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th width="50%">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="bbsDTO" items="${carrier}">
                            <tr>
                                <td>${bbsDTO.id}</td>
                                <td><a href="view?id=${bbsDTO.id}">${bbsDTO.title}</a></td>
                                <td>${bbsDTO.writer}</td>
                                <td>${bbsDTO.regdate}</td>
                                <td>${bbsDTO.count}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>


                    <div class="container">
                        <div class="d-flex">
                            <div class="me-lg-auto">
                                <a class="btn btn-primary text-decoration-none" href="/board/list">목록</a>
                            </div>

                            <div class="text-end">
                                <a class="btn btn-primary text-decoration-none" href="/board/write">글 작성</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- end of content --%>
        </div>

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
