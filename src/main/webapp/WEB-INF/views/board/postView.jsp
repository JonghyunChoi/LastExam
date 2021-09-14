<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${bbsDTO.title} - Board</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="/css/common.css" rel="stylesheet" type="text/css">
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
                    <table class="table" border="1">
                        <tr>
                            <th class="text-center" width="25%">제목</th><td>${bbsDTO.title}</td>
                        </tr>
                        <tr>
                            <th class="text-center">작성자</th><td>${bbsDTO.writer}</td>
                        </tr>
                        <tr>
                            <th class="text-center">날짜</th><td>${bbsDTO.regdate}</td>
                        </tr>
                        <tr>
                            <th class="text-center">조회수</th><td>${bbsDTO.count}</td>
                        </tr>
                        <tr>
                            <th class="text-center">내용</th><td>${bbsDTO.content}</td>
                        </tr>
                    </table>
                </div>

                <div class="container">
                    <div class="d-flex">
                        <div class="me-lg-auto">
                            <a class="btn btn-primary text-decoration-none" href="/board/list">목록</a>
                        </div>

                        <div class="text-end">
                            <sec:authorize access="isAuthenticated()">
                                <%
                                    String name = request.getUserPrincipal().getName();
                                %>
                                <c:set var="name" value="<%=name%>"></c:set>
                                <c:if test="${bbsDTO.writer eq name}">
                                    <a class="btn btn-danger text-decoration-none" href="/board/delete?id=${bbsDTO.id}">삭제</a>
                                    <a class="btn btn-secondary text-decoration-none" href="/board/update?id=${bbsDTO.id}">수정</a>
                                </c:if>
                            </sec:authorize>
                            <a class="btn btn-primary text-decoration-none" href="/board/write">글 작성</a>
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
