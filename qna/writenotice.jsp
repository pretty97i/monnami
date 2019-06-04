<jsp:include page="../monnamiTop.jsp"/>
 

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>MONAMI</title>

<meta name="Robots" content="all" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta name="Author" content="DESIGNPIXEL" />
<meta name="Copyright" content="(c)DESIGNPIXEL" />
<meta name="reply-to" content="" />
<meta name="date" content="" />

 


<link rel="stylesheet" href="<%=cp %>/monnami/css/w/common.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/qna/css/style.css" /> 


<script type="text/javascript" src="<%=cp %>/monnami/qna/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%=cp %>/monnami/qna/js/common.js"></script>
<script type="text/javascript" src="<%=cp %>/monnami/qna/js/include/js/common.js"></script>

 
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-109180295-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-109180295-1');
</script>
</head>
<body style="margin-top: 30px; ">
<div id="wrap">
<!-- 
<script type="text/javascript">
$(function(){

	$(document).on("click",".find_f",function(){
		
		dh = $(document).height();
		poph = $(".find_layer").height()

		$("#bgblack").height(dh).show();
		$(".find_layer").show().animate({top:$(document).scrollTop()+50+"px"},100);	

	});
	$("#bgblack,.btnx_").click(function(){
		$("#bgblack").height(dh).hide();
		$(".find_layer").hide()
	})



})
</script> -->

</div><!--//header-->

<div style="margin-top: 100px;">

		<div class="pagetitle pn4">
		<h2>
												공지사항								</h2>
		<p>
												몬나미가 알려드립니다!								</p>
	</div>
		<div class="pagetabs">
								
	</div>

<script type="text/javascript">
$(function(){

    
	if($("#form2").val() != ""){
		$("label").hide();
		$("label#country").show();
		$("label#attach_file").show();
		$("label#country").text($("select#sel").children("option:selected").text());
	}
    
    
    var select = $("select#sel");
    
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });


	var fileTarget = $('.filebox .upload-hidden');
		
	fileTarget.on('change', function(){ 
		// 값이 변경되면
		
			if(window.FileReader){
				// modern browser 
				var filename = $(this)[0].files[0].name; 
			}else{
				// old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			} 
			
			// 추출한 파일명 삽입 
			$(this).siblings('.ex_filename').html(filename); 
	
	});

	$(".ie9_tit input, .ie9_tit textarea").focus(function(){
		
			if(!$(this).val()){
				$(this).siblings("label").hide();
			}
	
	})
	$(".ie9_tit input, .ie9_tit textarea").focusout(function(){
			
			if(!$(this).val()){
				$(this).siblings("label").show();
			}else{
			}
	})

})
</script>
<h3 class="title2">MONNAMI <span>NOTICE</span></h3>


</div><!--//header-->


<div class="faq2" style="margin-bottom: 100px;">
	
		<div class="faq_box2">
		<div class="qustion2">
			<input type="text">
		</div>
		
		<p style="color: #c40f39; font-size: 25pt; padding-left: 5px; padding-top: 10px; padding-right: 10px; padding-bottom: 10px;"><b>Answer</b></p>
		<textarea rows="20" cols="80"></textarea>
			<a href=""><input type="button" value="글쓰기" class="btn-whitegray2" ></a>
			

		
		
	</div>
	
	<div>

	</div>
	
	

	</div>


<!-- 	
</div>contents

 -->



<jsp:include page="/monnami/monnamiBottom.jsp"/>
</body>
</html> 
