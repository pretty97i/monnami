<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 	
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>물품등록</title>
<jsp:include page="/monnami/content/monnamiTop.jsp" /><!-- 상단 설화꺼 불러오기-->

<script type="text/javascript">

function sendIt() {
	
	var f = document.monnamiProduct;
	
	
	f.action = "<%=cp%>/monnami/product/adminArticle_ok.do";
	f.submit();
	
}

function radioDisabled() {
	
	$("input[name='product_subList']").attr('disabled',true);
	$("input[name='product_subList1']").attr('disabled',true);
	$("input[name='product_subList2']").attr('disabled',true);
	$("input[name='product_subList3']").attr('disabled',true);
	
}

</script>

<script type="text/javascript">

function radioValue() {
	
	var st = $(":input:radio[name=product_mainList]:checked").val();
	
	radioEnabled(st)
	
}

function radioEnabled(st) {
	
	alert(st)
	
	if(st=="note"){
		
		$("input[name='product_subList']").attr('disabled',false);
		$("input[name='product_subList1']").attr('disabled',true);
		$("input[name='product_subList2']").attr('disabled',true);
		$("input[name='product_subList3']").attr('disabled',true);
		
	}else if(st=="interior"){
		
		$("input[name='product_subList']").attr('disabled',true);
		$("input[name='product_subList1']").attr('disabled',false);
		$("input[name='product_subList2']").attr('disabled',true);
		$("input[name='product_subList3']").attr('disabled',true);

		
	}else if(st=="imagin"){
		
		$("input[name='product_subList']").attr('disabled',true);
		$("input[name='product_subList1']").attr('disabled',true);
		$("input[name='product_subList2']").attr('disabled',false);
		$("input[name='product_subList3']").attr('disabled',true);
		
		
	}else if(st=="life"){
		
		$("input[name='product_subList']").attr('disabled',true);
		$("input[name='product_subList1']").attr('disabled',true);
		$("input[name='product_subList2']").attr('disabled',true);
		$("input[name='product_subList3']").attr('disabled',false);
		
	}
	
}

</script>


<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="format-detection" content="telephone=no, email=no, address=no">
<meta name="keywords" content="" />
<meta name="description" content="문구, 모나미펫, 크래프트&하비, 모나르떼를 통합한 라이프스타일 편집샵" />

<meta property="og:type" content="website">
<meta property="og:title" content="">
<meta property="og:image" content="">
<meta property="og:url" content="">
<meta property="og:description" content="">
<meta name="decorator" content="default.main"/>
<meta name="bodycss" content="home"/>
<meta name="divcss" content="sub"/>

<link rel="canonical" href="https://www.monamimall.com/w/main.do"/>

	<body class="home" onload="radioDisabled();">	
	<div id="wrap" class="sub">
		<noscript>
	이 사이트를 이용하기 위해서 자바스크립트를 활성화 시킬 필요가 있습니다.
	<a href="http://www.enable-javascript.com/ko/" target="_blank">브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
</noscript>
	
	<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
	<script type="text/javascript"> 
		if (!wcs_add) var wcs_add={};
		wcs_add["wa"] = "s_22b1f65c4041";
		if (!_nasa) var _nasa={};
		wcs.inflow("monamimall.com");
		wcs_do(_nasa);
	</script>
<div class="skip">
	 <a href="#contents">본문으로 건너뛰기</a>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({			
			url: "/w/ajax/cart/getCartListCntAjax.do",
			data : {
				"sessionId" : getSessionId()
			},
		 	type: "post",
		 	async: false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){
//		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(data){
				$(".cartCnt").text(comma(data));
			}
		});
	});
</script>

<form action="" name="monnamiProduct" method="post" enctype="multipart/form-data">

<main id="contents" class="member join">
	<h2>물품등록</h2>

		<div class="join-step2">

			<fieldset class="joinform-field">
				<legend class="hide">물품정보 입력</legend>
				<h3>물품기본정보</h3>
				<p class="txt-need"><em>*<span class="hide">필수</span></em> 표시는 반드시 입력하셔야 하는 항목 입니다.</p>
				<ul>
					<li>
						<label>
							<strong>물품번호<em class="bl-need">*<span class="hide">필수</span></em></strong>
							<input type="hidden" name="product_id" value="${maxNum }">${maxNum }
						</label>
					</li>
					
					<li>
						<label>
							<strong>물품명<em class="bl-need">*<span class="hide">필수</span></em></strong>
							<input type="text" name="product_name" id="memberNm" placeholder="물품명 입력" title="물품명 입력" maxlength="10">
						</label>
					</li>
					
					<li>
						<label>
							<strong>색&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상<em class="bl-need">*<span class="hide">필수</span></em></strong>
							<input type="checkbox" name="productSub_colorRed" value="red" style="left: 155px;" checked="checked">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img alt="" src="<%=cp%>/monnami/images/color/red.png" width="43" height="43">&nbsp;&nbsp;
							<input type="text" name="productSub_stockRed" style="width: 85px; height: 30px;">
						
							<input type="checkbox" name="productSub_colorYellow" value="yellow" style="left: 320px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img alt="" src="<%=cp%>/monnami/images/color/yellow.png" width="43" height="43">&nbsp;&nbsp;
							<input type="text" name="productSub_stockYellow" style="width: 85px; height: 30px;"><br/>
							
							<input type="checkbox" name="productSub_colorGreen" value="green" style="left: 155px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img alt="" src="<%=cp%>/monnami/images/color/green.png" width="43" height="43">&nbsp;&nbsp;
							<input type="text" name="productSub_stockGreen" style="width: 85px; height: 30px;">
							
							<input type="checkbox" name="productSub_colorBlue" value="blue" style="left: 320px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img alt="" src="<%=cp%>/monnami/images/color/blue.png" width="43" height="43">&nbsp;&nbsp;
							<input type="text" name="productSub_stockBlue" style="width: 85px; height: 30px;"><br/>
							
							<input type="checkbox" name="productSub_colorBlack" value="black" style="left: 155px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img alt="" src="<%=cp%>/monnami/images/color/black.png" width="43" height="43">&nbsp;&nbsp;
							<input type="text" name="productSub_stockBlack" style="width: 85px; height: 30px;">
						</label>
					</li>
					
					<li>
						<label>
							<strong>메인사진<em class="bl-need">*<span class="hide">필수</span></em></strong>
							<input type="file" name="mainPhoto" placeholder="메인 사진" title="메인 사진">
							
						</label>
					</li>
					
					<li>
						<label>
							<strong>서브사진</strong>
							<input type="file" name="subPhoto" placeholder="서브 사진" title="서브 사진">
							
						</label>
					</li>
					
					<li>
						<label>
							<strong>컨텐츠사진<em class="bl-need">*<span class="hide">필수</span></em></strong>
							<input type="file" name="contentPhoto" id="memberNm" placeholder="컨텐츠 사진" title="컨텐츠 사진">
							
						</label>
					</li>

					<li>
						<label>
							<strong>대분류<em class="bl-need">*<span class="hide">필수</span></em></strong>
							<input type="radio" name="product_mainList" value="note" style="left: 153px; top: 18px;" onclick="radioValue()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기록의 시작&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_mainList" value="interior" style="left: 273px; top: 18px;" onclick="radioValue()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일상 꾸미기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_mainList" value="imagin" style="left: 393px; top: 18px;" onclick="radioValue()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상상과 표현&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_mainList" value="life" style="left: 513px; top: 18px;" onclick="radioValue()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생활속 문구
						</label>
					</li>
					
					<li>
					</li>
				
					<li>
						<label>
							<strong>소분류<em class="bl-need">*<span class="hide">필수</span></em></strong>
							<input type="radio" name="product_subList" value="notes" style="left: 153px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;필기용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_subList" value="memo" style="left: 243px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;메모용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_subList" value="highlight" style="left: 333px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강조용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_subList" value="exclusive" style="left: 422px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고급필기용
						</label>
					</li>
					
					<li>
						<label>
							<strong><em class="bl-need"><span class="hide">필수</span></em></strong>
							<input type="radio" name="product_subList1" value="notes" style="left: 153px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인테리어&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_subList1" value="memo" style="left: 243px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;패브릭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_subList1" value="highlight" style="left: 333px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다이어리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="radio" name="product_subList1" value="exclusive" style="left: 422px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;그림
						</label>
					</li>
					
					<li>
						<label>
							<strong><em class="bl-need"><span class="hide">필수</span></em></strong>
							<input type="radio" name="product_subList2" value="notes" style="left: 153px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어린이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
						</label>
					</li>
					
					<li>
						<label>
							<strong><em class="bl-need"><span class="hide">필수</span></em></strong>
							<input type="radio" name="product_subList3" value="notes" style="left: 153px; top: 18px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;디자인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						</label>
					</li>	
					
				</ul>

				<div class="btn-area">
					<button type="button" class="btn-black" onclick="sendIt();">확인</button>
					<button type="button" class="btn-white" onclick="javascript:location.href='<%=cp%>/monnami/product/main.do';">취소</button>
				</div>
			</fieldset>
	</div>
</main>
<hr/>
</form>
		<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-133173275-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-133173275-1');
</script>

<!-- 다음우편번호 -->
<div id="popAddr" class="popup popaddr">
	<div class="popinner">
		<header class="header">
			<h2 class="tit">주소찾기</h2>
			<button type="button" class="btn-close" onclick="closeDaumPostcode();">닫기</button>
		</header>
	</div>
</div>

<div id="btnTop">
	<a href="#TOP">TOP</a>
</div>

<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html>