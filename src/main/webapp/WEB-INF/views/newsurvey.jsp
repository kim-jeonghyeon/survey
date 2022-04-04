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

</style>
<body>
	<!-- 설문등록완료 #btn_survey   질문추가 #btn_q -->
	<h1>설문지 만들기</h1>
	<input type="text" class="title" placeholder="제목 없는 설문지">
	<div class=“q”>
		<input type="text" name="question" placeholder="질문.">
		<select class=“q_type”>
			<option value="none">=== 선택 ===</option>
			<option value=“1”>주관식</option>
			<option value=“2">객관식</option>
			<option value="check">체크박스</option>
		</select>
		<button type="button" class="delete">질문 삭제</button>
	</div>
	<div>
		<button type ="button" class ="add">질문 추가하기</button>
	</div>
	<div>
		<button type="button" class="submit">작성하기</button>
	</div>
<script>
	$(document).on('click', '.q_type', function () {
		let questions = [];
		$.each(‘.q’, function () {
			let q_title = $(this).find(‘.q_title’).val();
			let q_type = $(this).find(‘q_type:selected’).val();
			let items = [];
			$.each(‘.item’, function () {
				let item_content = $(this....
				let item = {
					content: item_content
				};
				items.push(item);
			});
			let question = {
				title: q_title,
				type: q_type,
				items: items
			}
			questions.push(question);
		});
		let survey = {
			title:
			desc:
			questions: questions
		};
		$.ajx(
			data: survey
		)
	});

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