<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지 목록</title>
</head>
<body>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
	height: 100%;
}

a {
	text-decoration: none;
	color: #000;
}

ul {
	list-style: none;
}

header {
	width: 100%;
	height: 60px;
	line-height: 60px;
	background-color: rgba(0, 0, 0, 0.7);
	text-align: right;
	position: absolute;
	top: 0;
	right: 0;
}

header ul {
	width: 110px;
	height: 60px;
	float: right;
	list-style: none;
	overflow: hidden;
	transition: 0.5s;
}

header ul li:nth-child(1) {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 15px;
	color:#fff;
	cursor:pointer
}

header ul li {
	height: 40px;
	font-size: 15px;
	margin-right: 20px;
}

header ul li:nth-child(n+2) {
	height: 40px;
	font-size: 15px;
	margin-right: 20px;
	margin-bottom: 10px;
	font-weight: lighter;
}
header ul li:nth-child(2){
	margin-right: 25px;
}
header ul li:nth-child(n+2) a{
	color:#000;
}

header ul:hover {
	height: 150px;
	background-color: rgba(0, 0, 0, 0.1);
}

header ul li:hover {
	font-weight: bold;
	text-decoration: underline;
}

<%--헤더 끝    --%>
main {
	width: 90%;
	height: 100%;
	margin: 150px auto;
}

#notice_top li {
	float: left;
	height: 50px;
	margin-bottom: 10px;
}

#notice_top select {
	height: 29px;
	width: 70px;
	margin-right: 10px;
	margin-top: 10px;
}

#notice_top li:nth-child(1) {
	font-size: 35px;
	font-weight: bold;
	width: 200px;
}

#notice_top li:nth-child(2) {
	vertical-align: bottom;
	padding-top: 18px;
	height: 32px;
	font-size: 18px;
}

#notice_top li:nth-child(3) {
	float: right;
	padding-top: 10px;
	height: 30px;
	margin-right: 10px;
}

#notice_top li:nth-child(3) input:nth-child(2) {
	height: 27px;
	font-size: 15px;
}
#notice_top li:nth-child(3) input:nth-child(3){
	height: 31px;
	width: 40px;
	font-size: 12px;
}

#notice_main {
	width: 100%;
	height: 40px;
	float: left;
	text-align: center;
	line-height: 40px;
	background-color: rgba(0, 0, 0, 0.1);
}

#notice_main li {
	float: left;
	width:;
	height: 100%;
	box-shadow: 0 0 0 1px #000 inset;
	font-size: 18px;
}

#notice_main li:nth-child(1) {
	width: 10%;
}

#notice_main li:nth-child(2) {
	width: 40%;
}

#notice_main li:nth-child(3) {
	width: 15%;
}

#notice_main li:nth-child(4) {
	width: 25%;
}

#notice_main li:nth-child(5) {
	width: 10%;
}

#notice_bottom {
	width: 100%;
	float: left;
}

#notice_bottom li a span {
	float: left;
	height: 40px;
	box-shadow: 0 0 0 1px #000 inset;
	font-size: 18px;
	line-height: 40px;
	text-indent: 10px;
	text-align: center;
}

#notice_bottom li a span:nth-child(1) {
	width: 10%
}

#notice_bottom li a span:nth-child(2) {
	width: 40%
}

#notice_bottom li a span:nth-child(3) {
	width: 15%
}

#notice_bottom li a span:nth-child(4) {
	width: 25%
}

#notice_bottom li a span:nth-child(5) {
	width: 10%
}

<%--게시판 메인 끝 --%>
div {
	float: left;
	width: 100%;
	height: 100%;
	text-align: center;
}

div ul {
	width: 60%;
	height: 5%;
	margin: 20px auto;
}

div ul li {
	width: calc(100%/ 7);
	height: 100%;
	float: left;
}

div ul li a:hover {
	font-weight: bold;
}

div p {
	float: right;
	font-weight: bold;
	font-size: 18px;
	padding: 5px;
	border: 1px solid #000;
	border-radius: 5px;
}

div p:hover {
	border: 1px solid #fff;
	background-color: rgba(0, 0, 0, 0.4);
	color: #fff;
	transition: 0.5s;
}

div p:hover a {
	color: #fff;
}
<%-- 설문지 끝 --%>
</style>
<body>
	<header>
		<ul>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="principal"/>
					<li>${principal.uName}</li>
         			<li><a href="/user/info">내 정보</a></li>
         			<li><a href="/logout">로그아웃</a><li>
        	</sec:authorize>
		</ul>
	</header>
	<main>
		<ul id="notice_top">
			<li>설문지 정보</li>
			<li>총 설문지-<span>${pagination.count}</span></li>
			<li>
				<form action="notice"  method="get">
					<select name="field">
						<option value="n_title">제목</option>
						<option value="tb.u_name">작성자</option>
					</select>
					<input type="text" name="query" value="${param.q}">
					<input type="submit" value="검색">
				</form>
			</li>
		</ul>
		<ul id="notice_main">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일자</li>
			<li>조회수</li>
		</ul>
		<c:forEach items="${notice}" var="item">
			<ul id="notice_bottom">
				<li><a href="/noticeDetail?n_no=${item.n_no}">
				
						<span>${item.rownum}</span>
						<span>${item.n_title}</span>
						<span>${item.user.uName}</span>
						<span>${item.n_journal}</span>
						<span>${item.n_views}</span>
				</a></li>
			</ul>
		</c:forEach>
		<div>
			<ul>
				<c:if test = "${pagination.page > 1}">
					<li>
						<a href="/notice?page=${pagination.prevPage}&f=${pagination.search.field}&q=${pagination.search.query}">◀</a>
					</li>
				</c:if> 
			<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
						<c:if test="${ pagination.page eq i }">
							
							<li style="background-color:#000;width:100px; color:#fff; font-weight:bold;">
								<span>${i}</span>
							</li>
						</c:if>
						<c:if test="${ pagination.page ne i }">
							<li>
								<a href="/notice?page=${i}&f=${pagination.search.field}&q=${pagination.search.query}">${i}</a>
							</li>
						</c:if>
			</c:forEach>
				<c:if test = "${pagination.page < pagination.lastPage}">
					<li>
						<a href="/notice?page=${pagination.lastPage}&f=${pagination.search.field}&q=${pagination.search.query}">▶</a>
					</li>
				</c:if>
		</ul>
		<p><a href="/notice-write">글쓰기</a></p>
		</div>
	</main>
</body>
</html>