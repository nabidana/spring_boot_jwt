<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KOPO Site</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    </head>
    <style>
        .gradient-custom {
            /* fallback for old browsers */
            background: rgb(0, 0, 0);
        }
        img {
            width:100%;
            height:300;
            object-fit: contain;
        }
    </style>
    <body>
        <div style="text-align:center;" class="gradient-custom">
            <img src="images/myLogos.png" alt="나만의 그림">
        </div>
        <header class="p-3 text-bg-dark">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li>
                            <a href="home" class="nav-link px-2 text-white">Home</a>
                        </li>
                        <li>
                            <a href="schoollaunch" class="nav-link px-2 text-white">점심메뉴</a>
                        </li>
                        <li>
                            <a href="schoolschedule" class="nav-link px-2 text-white">학교일정</a>
                        </li>
                        <li>
                            <a href="fileboard" class="nav-link px-2 text-secondary">자료실</a>
                        </li>
                        <li>
                            <a href="sheetboard" class="nav-link px-2 text-white">실습 게시판</a>
                        </li>
                        <li>
                            <a href="poll" class="nav-link px-2 text-white">설문조사</a>
                        </li>
                        <li>
                            <a href="faq" class="nav-link px-2 text-white">FAQ</a>
                        </li>
                        <c:choose>
                            <c:when test="${sessionScope.usertype == 'Admin'}">
                                <li>
                                    <a href="boardwaitinfo" class="nav-link px-2 text-white">게시물요청</a>
                                </li>
                                <li>
                                    <a href="takeuser" class="nav-link px-2 text-white">사용자 관리</a>
                                </li>
                                <li>
                                    <a href="userwait" class="nav-link px-2 text-white">사용자 승인</a>
                                </li>
                            </c:when>
                            <c:when test="${sessionScope.usertype == 'User'}">
                                <li>
                                    <a href="boardwaitinfo" class="nav-link px-2 text-white">요청한 게시물</a>
                                </li>
                            </c:when>
                        </c:choose>
                    </ul>
                    <div class="text-end">
                        <c:choose>
                            <c:when test="${sessionScope.userid != null}">
                                <button type="button" class="btn btn-outline-light me-2" onclick="location.href='/updateuserinfo'">정보수정</button>
                                <button type="button" class="btn btn-warning" onclick="location.href='/logout'">LOGOUT</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-outline-light me-2" onclick="location.href='/login'">LOGIN</button>
                                <button type="button" class="btn btn-warning" onclick="location.href='/signup'">Sign-up</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </header>
        <div>
            <h1 style="text-align: center;">
                <font size="6">자료실 reference Room</font>
            </h1>
            <h1 style="text-align: right;">
                <font size="4" style="color: red;">※관리자 권한 : 모든 권한 및 사용자 요청 승인</font><br>
                <font size="4">※사용자 권한 : 파일 다운로드 및 파일 업로드 요청</font>
            </h1>
        </div>
        <div>
            <table style="margin:auto; width:80%;" class="table table-bordered table-hover table-striped text-center">
                <tr>
                    <th style="width: auto;">TITLE</th>
                    <th style="width: 20%;">WRITER</th>
                    <th style="width: 15%;">MAKE DATE</th>
                </tr>
                <c:forEach var="filelists" items="${fpage.content}">
                    <tr>
                        <th>
                            <a href="getfileboard?uuid=${filelists.uuid}">${filelists.title}</a>
                        </th>
                        <th>
                            ${filelists.writer}
                        </th>
                        <th>
                            <fmt:formatDate value="${filelists.date}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="text-xs-center">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <c:when test="${field != null}">
                        <c:choose>
                            <c:when test="${fpage.first}"></c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="fileboard?field=${field}&word=${word}&page=0">GET FIRST</a></li>
                                <li class="page-item"><a class="page-link" href="fileboard?field=${field}&word=${word}&page=${fpage.number-1}">&larr;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <!-- 페이지 그룹 -->
                        <c:forEach begin="${startblockpage}" end="${endblockpage}" var="i">
                            <c:choose>
                                <c:when test="${fpage.pageable.pageNumber+1 == i}">
                                    <li class="page-item disabled"><a class="page-link" href="fileboard?field=${field}&word=${word}&page=${i-1}">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="fileboard?field=${field}&word=${word}&page=${i-1}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <!-- 다음 -->
                        <c:choose>
                            <c:when test="${fpage.last}"></c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="fileboard?field=${field}&word=${word}&page=${fpage.number+1}">&rarr;</a></li>
                                <li class="page-item"><a class="page-link" href="fileboard?field=${field}&word=${word}&page=${fpage.totalPages-1}">GET LAST</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${fpage.first}"></c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="fileboard?page=0">GET FIRST</a></li>
                                <li class="page-item"><a class="page-link" href="fileboard?page=${fpage.number-1}">&larr;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <!-- 페이지 그룹 -->
                        <c:forEach begin="${startblockpage}" end="${endblockpage}" var="i">
                            <c:choose>
                                <c:when test="${fpage.pageable.pageNumber+1 == i}">
                                    <li class="page-item disabled"><a class="page-link" href="fileboard?page=${i-1}">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="fileboard?page=${i-1}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <!-- 다음 -->
                        <c:choose>
                            <c:when test="${fpage.last}"></c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="fileboard?page=${fpage.number+1}">&rarr;</a></li>
                                <li class="page-item"><a class="page-link" href="fileboard?page=${fpage.totalPages-1}">GET LAST</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>

                </c:choose>
            </ul>
        </div>
        <div>
            <c:choose>
                <c:when test="${sessionScope.usertype == 'Admin'}">
                    <form action="insertfileboard" style="text-align: right;" method="post">
                        <button type="submit" class="btn btn-outline-info text-dark me-2">새글 등록</button>
                    </form>
                </c:when>
                <c:when test="${sessionScope.usertype == 'User'}">
                    <form action="insertfileboard" style="text-align: right;" method="post">
                        <button type="submit" class="btn btn-outline-info text-dark me-2">새글 등록 요청</button>
                    </form>
                </c:when>
            </c:choose>
        </div>
        <div class="container">
            <form action="fileboard" method="post" class="form-inline d-flex justify-content-end">
                <c:choose>
                    <c:when test="${field != null && field != ''}">
                        <select name="field" id="field" class="form-control form-control-sm" style="width: 10%;">
                            <c:choose>
                                <c:when test="${field == 'title'}">
                                    <option value="">선택하세요</option>
                                    <option value="title" selected>제목</option>
                                    <option value="writer">작성자</option>
                                </c:when>
                                <c:when test="${field == 'title'}">
                                    <option value="">선택하세요</option>
                                    <option value="title">제목</option>
                                    <option value="writer" selected>작성자</option>
                                </c:when>
                            </c:choose>
                        </select>
                        <input type="text" id="word" name="word" class="form-control form-control-sm" style="width: 30%;" value="${word}">
                    </c:when>
                    <c:otherwise>
                        <select name="field" id="field" class="form-control form-control-sm" style="width: 10%;">
                            <option value="" selected>선택하세요</option>
                            <option value="title">제목</option>
                            <option value="writer">작성자</option>
                        </select>
                        <input type="text" id="word" name="word" class="form-control form-control-sm" style="width: 30%;">
                    </c:otherwise>
                </c:choose>
                <button type="submit" class="btn btn-outline-info text-dark me-2" style="width: 10%;">검색</button>
            </form>
        </div>
    </body>
</html>