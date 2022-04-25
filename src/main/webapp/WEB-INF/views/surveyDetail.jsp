<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지 상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
	* {
		margin: 0;
		padding: 0;
	}
	body{
		width:100%;
		height:100%;
		background-color: #ede7f6;
		position: relative;
	}
	h1{
		text-align:center;
		line-height:80px;
		background-color:#fff;
	}
	.t-survey{
		width: 40%;
   	 	margin:30px auto;
   	 	background-color:#fff;
   	 	border-radius:5px;
   	 	border-left:5px solid #4285f4;
   	 	border-top:5px solid rgb(103, 58, 183);
	}
	.survey{
		border:none;
		width:80%;
		margin:30px 5%;
		font-size: 25px;
		border-bottom:1px solid rgba(0,0,0,0.2);
	}
	.survey:focus{
		outline:none;
	}
	.item{
		width:38%;
		height:100%;
		background-color:#fff;
		border-radius:5px;
		margin:2% auto;
		padding:1%;
		border-left:5px solid #4285f4;
	}
	.item::after{
		content:'';
		display:block;
		clear:both;
	}
	.question{
		width: 70%;
		background-color: #f1f2f3;
		border:none;
		border-bottom:2px solid rgb(103,58,183);
		font-size:25px;
		padding:10px;
		float:left;
	}
	.question:focus{
		outline:none;
	}
	.q-option{
		height: 40px;
	    width: 20%;
	    float: right;
	    margin: 1%;
	}
	.i-bottom{
		margin-top:3%;
		border-top:2px solid rgba(0,0,0,0.2);
		width:100%;
		height:50px;
		float:left;
	}
	.d-question{
		widht:30%;
		height:50px;
		margin: 1%;
		float:right;
		background-color: #fff;
		padding: 1%;
		border:1px solid rgba(0,0,0,0.2);
		cursor:pointer;
		border-radius:5px;
	}
	.d-question:hover{
		font-weight:bold;
		border:2px solid rgba(0,0,0,0.3);
	}
	.navi{
		position:absolute;
		top:75%;
		right:20%;
		background-color: #fff;
	    width: 150px;
	    height: 102px;
	    border-radius: 10px;
	    box-shadow: 3px 3px 3px 3px grey;
	}
	.a-question{
		background-color: #fff;
	    border: none;
	    font-size: 18px;
	    text-align: center;
	    width: 100%;
	    margin-top: 18px;
	    cursor: pointer;
	}
	.a-question:hover{
		font-weight:bold;
		text-decoration:underline;
	}
	.submit{
		background-color: #fff;
	    border: none;
	    font-size: 18px;
	    width: 100%;
	    margin-top: 18px;
	    cursor: pointer;
	    text-align: center;
	}
	.submit:hover{
		font-weight:bold;
		text-decoration:underline;
	}
	/* 보기 */
	.example{
		border:none;
		font-size:18px;
		margin: 3% 0;
    	width: 80%;
    	border-bottom:1px solid rgba(0,0,0,0.3);
    	transition:0.2s;
	}
	.example:focus{
		outline:none;
	}
	.example:hover{
		border-bottom:2px solid rgba(103, 58, 183, 0.4);
	}

</style>
<body>
	<h1>설문지</h1>
	<hr>
	<div class="t-survey">
		<input type="text" name="s_title" placeholder="${survey.s_title}" class = "survey" readonly>
	</div>
	<div class="item">
		<input type="text" name="q_contents" placeholder="${question.q_contents}" class = "question" readonly>
		<select name="q_type" class="q-option">
			<option value="none">===선택===</option>
			<option value="short">단답형</option>
			<option value="long">장문형</option>
			<option value="choice">객관식 질문</option>
			<option value="checkbox">체크박스</option>
		</select>
		<br>
		<div class="i-bottom">
			<button type = "button" class = "d-question" >질문 삭제</button>
		</div>	
	</div>
			
	<div class="navi">
		<button type="button" class="submit">작성하기</button>
	</div>
</body>
</html>