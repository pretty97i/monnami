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

 
<%-- <link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/jquery.scrollbar.css" type="text/css"/> --%>
<%-- <link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/normalize.min.css" type="text/css"/> --%>
<%-- <link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/swiper.min.css" type="text/css"/>

--%>


<link rel="stylesheet" href="<%=cp %>/monnami/css/w/common.css" type="text/css"/>
<%--
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/contents.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/main.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/pruducts.css" type="text/css"/>


<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/qna/css/common.css" /> --%>
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/qna/css/style.css" /> 









<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script> -->
<script type="text/javascript" src="<%=cp %>/monnami/qna/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%=cp %>/monnami/qna/js/common.js"></script>
<script type="text/javascript" src="<%=cp %>/monnami/qna/js/include/js/common.js"></script>

<%-- 
<script type="text/javascript" src="<%=cp%>/monnami/js/cart.js"></script> --%>
<%-- <script type="text/javascript" src="<%=cp%>/monnami/js/commonScript.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/function.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery.countdown.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery.ez-plus.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery.scrollbar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/lazyload.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/monamimall.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/swiper.min.js"></script>

 --%>
 
 
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
</script>

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
<h3 class="title1">MONNAMI <span>NOTICE</span></h3>

</div><!--//header-->
<!-- 
<div id="contents">
 -->
		

<script type="text/javascript">
$(function(){

	$(".faq_box").click(function(){
		
		$(this).toggleClass("on");
		$(this).find(".answer").slideToggle();

	})

})
</script>
<a href="<%=cp %>/monnami/qna/writenotice.jsp" style="margin-left: 1000px; "><input type="button" value="글쓰기" class="btn-whitegray2" ></a>
<div class="faq">

	<div class="faq_box">
		<div class="qustion">
			<a>아이디어를 제공하고 싶어요. 어떻게 하나요? <div class="arr"></div></a>
		</div>
		<div class="answer">
			<p>
				몬나미는 여러분의 의견을 적극 수용한답니다.언제든지 메일로 보내주세요!
				
				<span class="dot">E-MAIL : alclrp011@nate.com</span>
				<span class="dot"><a href="<%=cp%>/monnami/qna/sendqna.jsp">문의하기 click!</a></span>
			</p>
		</div>
	</div>

	<div class="faq_box">
		<div class="qustion">
			<a >특판에 대해 궁금합니다. <div class="arr"></div></a>
		</div>
		 <div class="answer">
			<p>
				모나미 기업서비스팀은 기업의 프로모션 제품을 전문 상품기획담당, 디자인담당, 영업담당, 구매 생산담당자들의 Knowhow와 전문성을 바탕으로 모나미 최상의 상품은 물론 특판상품을<span class="br"></span>
				기획 제작하여 Service하고 있습니다. 중국지사(이우,광주,상해 등)를 통한 직수입으로 원가 경쟁력을 확보하여 소비자(기업)의 만족도를 극대화함과 동시에 기업행사의
				상품별 효과를 분석하여<span class="br"></span>
				제안함으로써 맞춤서비스를 지향하고 있습니다.
				모나미 기업서비스팀은 기업의 프로모션 제품을 담당합니다.<span class="br"></span>
				상품기획, 디자인, 영업, 구매 생산 담당자들의 노하우와 전문성을 바탕으로 모나미 최상의 상품은 물론 특판상품을 기획 제작하여 서비스 하고 있습니다.<span class="br"></span>
				중국지사(이우, 광주, 상해 등)를 통한 직수입으로 원가 경쟁력을 확보하여 소비자(기업)의 만족도를 극대화함과 동시에 기업행사의 상품별 효과를 분석하여 제안합니다.

			</p>
			<ul>
				<li>모나미 문구 사무용품 각종 상품 로고 및 인쇄 판촉물 제작</li>
				<li>팬시용품과 생활 잡화 용품 판촉 홍보용품의 Quality와 Service의 일대 혁신</li>
				<li>고품격, 신뢰성을 바탕으로 타사들과는 다른 차별점을 찾아 기업의 이미지를 최대화</li>
				<li>정확한 타켓, 확실한 컨셉, 탄탄한 기획까지 책임</li>
				<li>상품기획 및 디자인관련 전문적 지식으로 차별화된 'Creative Product' 제안</li>
				<li>시작부터 마무리까지 고객중심의 1:1 맞춤 제안</li>
			</ul>
			<p>
				특판에 관한 궁금한 사항이 있으면 아래의 연락처로 문의하시면 친절한 상담을 받을 수 있습니다.<br />
				(주)몬나미 기업서비스팀<br />
				<span class="dot">TEL : 02-1234-1234</span>
			</p>
		</div>
	</div>

	


</div>
<!-- 	
</div>contents

 -->


<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html> 