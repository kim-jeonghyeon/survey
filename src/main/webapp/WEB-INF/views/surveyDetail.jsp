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
	ul{
   		list-style:none;
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
		border: none;
	    width: 80%;
	    margin: 30px 5%;
	    font-size: 30px;
	    font-weight: bold;
	    border-bottom: 1px solid rgba(0,0,0,0.2);
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

	aside{
		position: absolute;
	    top: 75%;
	    right: 22%;
	    background-color: #fff;
	    width: 105px;
	    height: 55px;
	    border-radius: 10px;
	    box-shadow: 3px 3px 3px 3px grey;
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
	}
	.example:focus{
		outline:none;
	}
	.list{
		width:100%;
		float: left;
	}
	.list > li{
		height: 30px;
    	margin: 2% 0;
	}
	#long{
		width:703px;
		height:150px;
		resize:none;
		border:1px solid #f1f2f3;
		transition:0.5s;
		cursor: auto;
	}
	#li_check{
		height:230px;
	}
	#long:focus{
		height:210px;
		border:1px solid #f1f2f3;
		border-right:2px solid #4285f4;
   	 	border-bottom:2px solid rgb(103, 58, 183);
	}
	#long::-webkit-scrollbar {
    width: 10px;
  	}
  	#long::-webkit-scrollbar-thumb {
    background-color: gray;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  	}
  	#long::-webkit-scrollbar-track {
    background-color: #ede7f6;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  	}
	
	
	
	#short{
		width:574px;
		height:27px;
		resize:none;
	}
</style>
<body>
	<input type="hidden" class="s_idx" name="s_idx" value="${survey.s_idx}">
	<h1>설문지</h1>
	<hr>	
	<div class="t-survey">
		<input type="text" name="s_title" placeholder="제목:&nbsp;${survey.s_title}" class ="survey" readonly>
	</div>
	<c:forEach items="${survey.questionList}" var="question" >
		<div class="item">
			<input type="hidden" name="q_idx" class="qidx" value="${question.q_idx}">
			<input type="text" name="q_contents" placeholder="${question.q_contents}" class ="question" readonly>
			<ul class="list">
				<c:forEach items="${question.itemList}" var="item">
					<c:choose>
						<c:when test="${question.q_type eq 'choice'}">
							<li>
								<input type="hidden" name="i_idx" class="i_idx" value="${item.i_idx}">
								<input type="radio" name="i_contents" id="choicelist">
								<label for="choicelist" class="example" name="i_idx">${item.i_contents}</label>
							</li>
						</c:when>
						<c:when test="${question.q_type eq 'checkbox'}">
							<li>
							<input type="hidden" name="i_idx" class="i_idx" value="${item.i_idx}">
							<input type="checkbox" name="i_contents" id="checkboxlist">
							<label for="checkboxlist" class="example" name="i_idx">${item.i_contents}</label>
							</li>
						</c:when>
						<c:when test="${question.q_type eq 'long'}">
							<li id="li_check">
								<textarea placeholder="장문형 텍스트" class="example" id="log" name="i_contents" name="i_idx"></textarea>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<textarea placeholder="단답형 텍스트" class="example" id="short" name="i_contents" name="i_idx"></textarea>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</c:forEach>
	<aside>
		<button type="button" class="submit">작성하기</button>
	</aside>
	
<script>
$(document).on('click','.submit',function(){

	let response={
			s_idx : $(".s_idx").val(),
			answerList : []
	};

	
	$(".item").each(function(){

		let $a_answer = $(this).find('textarea[name="i_contents"]');
		
		if($(this).find('textarea[name="i_contents"]') == true){
			let answer = {
					q_idx : $(this).find('input[name="q_idx"]').val(),
					i_idx : $(this).find('input[name="i_idx"]').val(),
					a_answer : $(this).find('textarea[name="i_contents"]').val()
			};
		}else{
			let answer = {
					q_idx : $(this).find('input[name="q_idx"]').val(),
					i_idx : $(this).find('input[name="i_idx"]').val()
			};
		}
				
		response.answerList.push(answer);
	});
	
	
	console.log(response);


	
/* 	
	let responsesurvey = JSON.stringify(response);
	
	$.ajax({
		method: "POST",
		url: "/responseprocess",
		data: responsesurvey,
		contentType : "application/json; charset=utf-8",
		success: function(data) {
			let url = "/savesurvey";
			location.replace(url);
		}
	}); */
})
</script>
</body>
</html>