<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<%-- start of header --%>
<header class="p-3 mb-3 border-bottom">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <%-- LOGO --%>
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 me-4 text-dark text-decoration-none">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                 class="bi bi-droplet-fill" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M8 16a6 6 0 0 0 6-6c0-1.655-1.122-2.904-2.432-4.362C10.254 4.176 8.75 2.503 8 0c0 0-6 5.686-6 10a6 6 0 0 0 6 6zM6.646 4.646c-.376.377-1.272 1.489-2.093 3.13l.894.448c.78-1.559 1.616-2.58 1.907-2.87l-.708-.708z"/>
            </svg>
        </a>

        <%-- TOP OF MENU --%>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/" class="nav-link px-2 link-dark">Home</a></li>
            <li><a href="/board/list" class="nav-link px-2 link-dark">Board</a></li>
            <li><a href="/store/list" class="nav-link px-2 link-dark">Store</a></li>
        </ul>

        <%-- IF LOGIN => VIEW NAME --%>
        <div class="text-end me-2">
            <sec:authorize access="isAuthenticated()">
                <a class="fw-bold fs-3 text-decoration-none"><sec:authentication property="name"/></a>
            </sec:authorize>
        </div>

        <%-- IF LOGIN => DROP-DOWN MENU --%>
        <div class="dropdown text-end">
            <a href="#" class="d-block me-2 link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
               data-bs-toggle="dropdown" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                     class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
            </a>

            <ul class="dropdown-menu text-center" aria-labelledby="dropdownUser1">
                <sec:authorize access="isAuthenticated()">
                    <li><a class="btn btn-danger" href="/logout" role="button">로그아웃</a></li>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <li><a class="btn btn-primary mb-2" href="/login" role="button">로그인</a></li>
                    <li><a class="btn btn-danger" href="/join" role="button">회원가입</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</header>
<%-- end of header --%>
</body>
</body>
</html>
