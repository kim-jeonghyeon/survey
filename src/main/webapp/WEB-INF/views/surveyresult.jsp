<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://www.gstatic.com/charts/loader.js"></script>
<title>설문지 결과</title>
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
		border:none;
		width:80%;
		margin:30px 5%;
		font-size: 25px;
		border-bottom:1px solid rgba(0,0,0,0.2);
	}
	.survey:focus{
		outline:none;
	}
	.main{
	    width: 40%;
    	margin: 30px auto;
    	border-radius:5px;
		border-left:5px solid #4285f4;
	}
</style>
<body>
	<h1>설문 결과</h1>
	<hr>
	<div class="t-survey">
		<input type="text" placeholder="" class ="survey">
	</div>
	<%-- <ul class="main">
		<c:forEach items="${survey.questionList}" var="question">
			<input type="hidden" name="q_idx" value="${question.q_idx}">
			<input type="hidden" name="q_contents" value="${question.q_contents}">
			<input type="hidden" name="i_contents" value="${question.itemList.i_contents}">
			<li id="Sarah_chart_div"></li>
			<li id="Anthony_chart_div"></li>
		    <li id="third_chart_div"></li>
	    </c:forEach>
    </ul> --%>
<script>
	//구글차트 

	let surveyObj = ${survey};
	let responseObj = ${response};

	console.log(surveyObj);
	console.log(responseObj);
	

	
		for(var i = 0; i < surveyObj.questionList.length; i++){
			
			google.charts.load('current', {'packages':['corechart']}); 
	        google.charts.setOnLoadCallback(drawSarahChart);
			
			function drawSarahChart() {
				

	        	var data = new google.visualization.DataTable();
	        	
	            data.addColumn('string', 'Topping');
	            data.addColumn('number', 'Slices');
	            
	            data.addRows([
	              [surveyObj.questionList.itemList, 3],
	              ['Onions', 1],
	              ['Olives', 1], 
	              ['Zucchini', 1],
	              ['Pepperoni', 2]
	            ]);


	            // 그래프 옵션 지정
	            var options = {'title':'How Much Pizza Anthony Ate Last Night',
	                    width:763,
	                    height:450
	                    };

	            var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
	            chart.draw(data, options);
	            
	        }
		}
		
        
    	/* 
        google.charts.setOnLoadCallback(drawAnthonyChart);
        google.charts.setOnLoadCallback(drawthirdChart);

       



        
        function drawAnthonyChart() {
            
            var data = new google.visualization.DataTable();
            
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows([
              ['Mushrooms', 2],
              ['Onions', 2],
              ['Olives', 2],
              ['Zucchini', 0],
              ['Pepperoni', 3]
            ]);

            var options = {title:'How Much Pizza Anthony Ate Last Night',
                           width:763,
                           height:450};

            var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
            chart.draw(data, options);
          }

        
		function drawthirdChart() {
            
            var data = new google.visualization.DataTable();
            
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows([
              ['Mushrooms', 2],
              ['Onions', 2],
              ['Olives', 2],
              ['Zucchini', 0],
              ['Pepperoni', 3]
            ]);

            var options = {title:'How Much Pizza Anthony Ate Last Night',
                           width:763,
                           height:450};

            var chart = new google.visualization.PieChart(document.getElementById('third_chart_div'));
            chart.draw(data, options);
          }

 */



		 
 
	</script>
</body>
</html>