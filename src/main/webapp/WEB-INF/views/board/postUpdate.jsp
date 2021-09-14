<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update</title>

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
                    <p class="fw-bold fs-3">Post Update</p>
                    <form action="postUpdate">
                        <table class="table">
                            <tr>
                                <th class="text-center">제목</th>
                                <td><input type="text" name="title" value="${title}" />
                                    <a class="text-danger">${title_error_message}</a>
                                </td>

                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>
                                    <input type="text" placeholder=<sec:authentication property="name"/> disabled />
                                    <input type="hidden" name="writer" value="<sec:authentication property="name" />" />
                                    <input type="hidden" name="id" value="${id}" />
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">내용</th>
                                <td><input type="text" name="content" maxlength="500" size="100" value="${content}" />
                                    <a class="text-danger">${content_error_message}</a>
                                </td>
                            </tr>
                        </table>
                        <div class="text-end">
                            <a class="btn btn-secondary text-decoration-none" href="/board/list">취소</a>
                            <input class="btn btn-primary text-decoration-none" type="submit" value="등록" />
                        </div>
                    </form>
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