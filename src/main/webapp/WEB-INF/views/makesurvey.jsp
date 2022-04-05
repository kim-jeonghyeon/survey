<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지 만들기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}
body{
	background-color: #ede7f6;
}
	.top{
		width:100%;
		height: 80px;
		background-color: #fff;
		border-bottom-style: solid;
	}
	h1{
		text-align:center;
		line-height:80px;
	}
	
	
	.survey-title{
		width: 50%;
   	 	margin:30px auto;
   	 	background-color:#fff;
   	 	border-radius:10px;
   	 	border-left:5px solid #4285f4;
   	 	border-top:5px solid rgb(103, 58, 183);
    }
    .survey-title.click{
    	border-left:5px solid #4285f4;
    }
	.title{
		width:80%;
		margin:30px 5%;
		border-style: hidden hidden double;
		font-size: 25px;
	}
	.q{
		width:48%;
		margin:30px 10%;
		background-color:#fff;
		border-radius:10px;
		margin:0px auto;
		padding:1%;
		border-left:5px solid #4285f4;
	}
	.q.click{
		border-left:5px solid #4285f4;
	}
	.q-top{
		width:100%;
		height:30%;
	}
	.q-top > input{
		width:60%;
		background-color: #f1f3f4;
		border:0;
		border-bottom:2px solid rgb(103, 58, 183);
		font-size:25px;
		text-align:center;
		padding:10px;
	}
	.q_type{
		width: 15%;
	    font-size: 18px;
	    font-weight: 500;
	    padding: 10px;
	}
	
	
	.q-mid{
		width:100%;
		height:50%;
		background-color:yellow;
	}
	
	.q-bottom{
		width:100%;
		height:20%;
		background-color:blue;
	}
</style>
<body>
	<!-- 설문등록완료 #btn_survey   질문추가 #btn_q -->
	<div class="top">
		<h1>설문지 만들기</h1>
	</div>
	
	
	<div class="survey-title">
		<input type="text" class="title" placeholder="제목 없는 설문지">
	</div>
	<div class="q">
		<div class="q-top">
			<input type="text" name="question-title" placeholder="질문 제목">
			<select class="q_type">
				<option value="none">◎ 선택</option>
				<option value=“1”>주관식</option>
				<option value=“2">객관식</option>
				<option value="check">체크박스</option>
			</select>
		</div>
		<div class="q-mid">
			<div class="mid-top">
				<input type="text" class="option" placeholder="옵션">
				<button type="button" class="option-delete">X</button>
			</div>
			<div class="mid-bottom">
				<button type="button" class="addoption">옵션 추가</button>
			</div>
		</div>
		<div class="q-bottom">
			<button type="button" class="delete">질문 삭제</button>
		</div>
	</div>
	
	<div>
		<button type ="button" class ="add">질문 추가하기</button>
	</div>
	<div>
		<button type="button" class="submit">작성하기</button>
	</div>
	
<script>


	$(document).on('click', '.addoption',function(){
		var i = 1;
		
		$(".mid-top").append("<input type=" + text + " class=" + option + " placeholder="  +옵션 + i + ">");
	
		i++;
	})

	// 삭제	
	$(document).on('click', 'delete', function(){
		$(this).parent().remove();
	});

	// 추가
	$(document).on('click', 'add', function(){
		$(this).prev().remove();
		$(this).remove();
	});
</script>
</body>
</html>