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
		position: relative;
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
		width: 40%;
   	 	margin:30px auto;
   	 	background-color:#fff;
   	 	border-radius:5px;
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
		width:38%;
		height:100%;
		background-color:#fff;
		border-radius:5px;
		margin:0px auto;
		padding:1%;
		border-left:5px solid #4285f4;
	}
	.q::after{
		content:'';
		display:block;
		clear:both;
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
		width: 25%;
	    font-size: 18px;
	    font-weight: 500;
	    padding: 10px;
	    margin:10px;
	    border: 2px solid rgba(0,0,0,0.2);
	    border-radius: 5px;
	}
	
	
	.q-mid{
		width:100%;
		height:50%;
		margin: 10px 0;
	}
	.mid-top{
		width: 100%;
    	height: 50px;
	}
	.mid-top::after{
		content:'';
		display:block;
		clear:both;
	}
	.mid-top > span{
		width: 2%;
	    height: 70%;
	    margin: 0 1%;
	    float: left;
	    font-weight: bold;
	    font-size: 18px;
	    line-height: 45px;
	}
	.option{
		width:90%;
		border:0;
		float:left;
		height:30px;
		margin-top:10px;
		display: inline-block;
		position: relative;
		font-size: 18px;
	}
	.option:after{
		content:"";
		position:absolute;
		left:50%;
		bottom:0;
		width:0;
		height:4px;
		background-color: rgb(103,58,183);
		transition: all 1s;
	}
	.option:before{
		content:"";
		position:absolute;
		right:50%;
		bottom:0;
		width:0;
		height:4px;
		background-color: rgb(103,58,183);
		transition: all 1s;
	}
	.option:hover::after{
		width:50%;	
	}
	.option:hover::before{
		width:50%;	
	}
	.option:focus{
		outline:none;
	}
	.option-delete{
		width:5%;
		height:70%;
		float:right;
		border-radius:20px;
		margin-top:1%;
		border:0;
		background-color:#fff;
	}
	.option-delete:hover{
		background-color: #f1f2f3;
		cursor:pointer;
	}
	.mid-bottom{
		width:100%;
		heigtt:50px;
	}
	.mid-bottom::after{
		content:'';
		display:block;
		clear:both;
	}
	.mid-bottom > span{
		width: 2%;
	    height: 70%;
	    margin: 0 1%;
	    float: left;
	    font-weight: bold;
	    font-size: 18px;
	    line-height: 45px;
	}
	.addoption{
		width: 12%;
	    border: 0;
	    float: left;
	    height: 30px;
	    margin-top: 10px;
	    font-size: 18px;
	    text-align: left;
	    background-color: #fff;
	    cursor: pointer;
	}
	.addoption:focus{
		outline:none;
	}
	
	.q-bottom{
		width:100%;
		height:20%;
		margin-top: 3%;
	}
	.delete{
		font-size:18px;
		float:right;
		cursor:pointer;
		border:none;
		padding:1%;
		transition:0.2s;
		font-weight:bold;
		background-color:#fff;
	}
	.delete:hover{
		background-color:#f1f2f3;
		border:2px solid #000;
		border-radius:10px;
	}
	
	.navi{
		position: absolute;
	    right: 20%;
	    background-color: #fff;
	    width: 150px;
	    top: 70%;
	    height: 20%;
	    border-radius: 10px;
	    box-shadow: 3px 3px 3px 3px grey;
	}
	.add{
		background-color: #fff;
	    border: none;
	    font-size: 18px;
	    text-align: center;
	    width: 100%;
	    margin-top: 13%;
	    cursor: pointer;
	}
	.add:hover{
		font-weight:bold;
		text-decoration:underline;
	}
	.submit{
		background-color: #fff;
	    border: none;
	    font-size: 18px;
	    width: 100%;
	    margin-top: 13%;
	    text-align: left;
	    cursor: pointer;
	    text-indent: 12px;
	}
	.submit:hover{
		font-weight:bold;
		text-decoration:underline;
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
				<option value="none">=== 선택 ===</option>
				<option value=“1”>주관식</option>
				<option value=“2">객관식</option>
				<option value="check">체크박스</option>
			</select>
		</div>
		<div class="q-mid">
			<div class="mid-top">
				<span>O</span>
				<input type="text" class="option" placeholder="옵션">
				<button type="button" class="option-delete">X</button>
			</div>
			<div class="mid-bottom">
				<span>O</span>
				<button type="button" class="addoption">옵션 추가</button>
			</div>
		</div>
		<hr>
		<div class="q-bottom">
			<button type="button" class="delete">질문 삭제</button>
		</div>
	</div>
	
	<div class="navi">
		<button type ="button" class ="add">- 질문 추가하기</button>
		<button type="button" class="submit">- 작성하기</button>
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