<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지</title>
</head>
<body>
	<h1>설문지 만들기</h1>
    	<hr>
        <div>
         	<sec:authorize access="isAnonymous()">
          		<a href="/login">로그인</a>
          		<a href="/beforeSignUp">회원가입</a>
         	</sec:authorize>
         	<sec:authorize access="isAuthenticated()">
          		<a href="/logout">로그아웃</a>
          		<a href="makesurvey">설문지 만들기</a>
          		<a href="surveylist">설문지 응답하기</a>
          		<a href="resultlist">설문지 결과</a>
         	</sec:authorize>
        </div>
        <div>
         	<sec:authorize access="isAuthenticated()">   
         		<a href="/mypage">내정보</a>
        	</sec:authorize>
        </div>
</body>
</html>