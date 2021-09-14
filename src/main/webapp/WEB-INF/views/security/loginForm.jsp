<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="/css/login.css" rel="stylesheet" type="text/css">
</head>
<body class="text-center">
<main class="form-signin">
    <div class="mb-5">
        <a href="/" class="align-items-center text-dark text-decoration-none">
            <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor"
                 class="bi bi-droplet-fill" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M8 16a6 6 0 0 0 6-6c0-1.655-1.122-2.904-2.432-4.362C10.254 4.176 8.75 2.503 8 0c0 0-6 5.686-6 10a6 6 0 0 0 6 6zM6.646 4.646c-.376.377-1.272 1.489-2.093 3.13l.894.448c.78-1.559 1.616-2.58 1.907-2.87l-.708-.708z"/>
            </svg>
        </a>
    </div>

    <form action="/login" method="post">
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" name="name">
            <label for="floatingInput">아이디</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingPassword" name="password">
            <label for="floatingPassword">비밀번호</label>
        </div>

        <c:if test="${param.error != null}">
            <p class="text-danger">${error_message}</p>
        </c:if>
        <input class="w-100 btn btn-lg btn-primary mb-2" type="submit" value="로그인" />
        <a class="w-100 btn btn-lg btn-danger mb-2" href="/join" role="button">회원가입</a> <br />

        <a href="/oauth2/authorization/naver"><img class="mb-2" src="images/naver_login_img.png" width="301" height="64" /></a>
        <a href="/oauth2/authorization/google"><img src="images/google_login_img.png" width="301" height="64" /></a>

        <p class="mt-5 mb-3 text-muted">&copy; 2021 Jonghyun Choi</p>
    </form>
</main>
</body>
</html>