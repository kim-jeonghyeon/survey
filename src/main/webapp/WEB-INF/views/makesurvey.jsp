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
	/* 보기삭제  */
	.d-example{
		background-color: #fff;
	    border-radius: 10px;
	    padding: 1%;
	    border: 1px solid rgba(0,0,0,0.3);
	}
	.d-example:hover{
		border:2px solid rgba(103, 58, 183, 0.6);
		font-weight:bold;
	}
	/* 보기추가  */
	.a-example{
		background-color:#fff;
		border:1px solid rgba(0,0,0,0.3);
		cursor:pointer;
		padding: 1%;
	}
	.a-example:hover{
		border:2px solid rgba(103, 58, 183, 0.6);
	}
	
</style>
<body>
	<h1>설문지 만들기</h1>
	<hr>
	<div class="t-survey">
		<input type="text" placeholder="제목 없는 설문지" class = "survey">
	</div>
	<div class="item">
		<input type="text" name="q_contents" placeholder="제목없는 질문" class = "question">
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
		<button type = "button" class = "a-question">질문 추가하기</button>
		<button type="button" class="submit">작성하기</button>
	</div>
	
<script>
$(document).on('change', '.q-option', function () {
	// 보기 겹침 방지
	while(true) {
		if($(this).next().next().hasClass("example2") == true || $(this).next().next().hasClass("a-example") == true) {
			$(this).next().next().remove();
		} else {
			break;	
		}
	}

	// 질문 클릭시
	if($(this).val() == "short") {
		$(this).prev().prev().prop("placeholder", "단답형 질문")
	} else if($(this).val()  == "long") {
		$(this).prev().prev().prop("placeholder", "장문형 질문")
	} else if($(this).val()  == "choice") {
		$(this).prev().prev().prop("placeholder", "객관식 질문")
		$(this).next().after("<div class = 'example2'><input type='text' name='i_contents' placeholder='보기' class = 'example'> <button type = 'button' class = 'd-example'>보기 삭제</button></div><button type = 'button' class = 'a-example'>보기 추가하기</button>");
	} else if($(this).val()  == "checkbox") {
		$(this).prev().prev().prop("placeholder", "체크박스형 질문")
		$(this).next().after("<div class = 'example2'><input type='text' name='i_contents' placeholder='보기' class = 'example'> <button type = 'button' class = 'd-example'>보기 삭제</button></div><button type = 'button' class = 'a-example'>보기 추가하기</button>");
	} else if($(this).val()  == "none") {
		$(this).prev().prop("placeholder", "제목없는 질문")
	}
});

// 질문 추가
$(document).on('click', '.a-question', function () {
	$(".a-question").parent().before("<div class='item'><input type='text' placeholder='제목없는 질문' class = 'question'><select name='q-option' class='q-option'><option value='none'>===선택===</option><option value='short'>단답형</option><option value='long'>장문형</option><option value='choice'>객관식 질문</option><option value='checkbox'>체크박스</option></select><br><div class='i-bottom'><button type = 'button' class = 'd-question'>질문 삭제</button></div>")
});

// 보기 추가
$(document).on('click', '.a-example', function () {
	$(this).prev().children().last().after("<input type='text' placeholder='보기' class = 'example'> <button type = 'button' class = 'd-example'>보기 삭제</button>");
});


// 질문 삭제
$(document).on('click', '.d-question', function () {
	$(this).parent().parent().remove();
});

// 보기 삭제
$(document).on('click', '.d-example', function () {		
	$(this).prev().remove();
	$(this).remove();
});


// 전송
$(document).on('click', '.submit', function () {
	let questionList = []

	let itemList = []
	// 질문들 반복
	$(".item").each(function() {
	
		// 체크박스나 객관식 질문들
		let $i_contents = $(this).find('input[name="i_contents"]');

		if($i_contents.hasClass("example") == true){
			$(".example").each(function(){
				let item = { 
						i_contents : $i_contents.val()
				};
				
				itemList.push(item);

				$i_contents = $i_contents.next().next();
				
				if($i_contents.hasClass("example") == false) {
					return false;
				}
			});
		}

		// 질문 제목과 타입들
		let question = {
				q_contents: $(this).children().first().val(),
				q_type: $(this).children().first().next().val(),
				itemList : itemList
		};
		questionList.push(question);
	});	


	// 설문지 제목
	let survey = {
		s_title : $(".survey").val(),
		questionList :  questionList
	};	
	console.log(survey);

	
	let makesurvey = JSON.stringify(survey);
	
	$.ajax({
		method: "POST",
		url: "/surveyprocess",
		data: makesurvey,
		contentType : "application/json; charset=utf-8",
		success: function(data) {
			let url = "/savesurvey";
			location.replace(url);
		}
	});

});
</script>  
</body>
</html>