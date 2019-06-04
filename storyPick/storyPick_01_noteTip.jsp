<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<!-- 상단 -->
<jsp:include page="/monnami/content/monnamiTop.jsp"/>


<!-- 중앙 -->
<body class="storypick">	
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
	
<main id="contents" class="storypick detail">

<form name="storypickForm" id="storypickForm" method="post" onsubmit="return false;">
	<input type="hidden" name="storyIdx" id="storyIdx" value="189">
	<input type="hidden" name="schCheck" id="schCheck" value="">
	<input type="hidden" name="level2Idx" id="level2Idx" value="30">
	<input type="hidden" name="level3Idx" id="level3Idx" value="35">
	<input type="hidden" name="pageNo" id="pageNo" value="1">

	<div class="inner">
		<h2>Story Pick</h2>
			<div class="detail-ti">
				<h3><small>[필기의 신]</small> 수험생이 전하는 필기TIP</h3>
					<ul class="share">
						<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
						<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
						<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
					</ul>
				<div class="ico-ls">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="189">찜</a>
					<span class="ico-view">114</span>
				</div>
			</div>
		
		<div class="detail-cont">
			<div class="cont editor-area">
				<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}
					.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
					.t_medium {font-size:1.8em; line-height:1.3em; font-weight:bold; padding-bottom:50px;}
					.t_normal {font-size:1.1em; line-height:1.8em; color:#666666; text-align:center;}
					.mark {display:block; margin:auto; padding:30px 0;}
					.img_big {display:inline-block; padding-bottom:60px;}
					.clear {clear:both;}
				</style>
				<div class="wrap_storypick" style="margin-bottom: 10px;">
					<img alt="img" class="img_big loading" src="/study/monnami/images/storypick/storyPickList01.jpg" data-was-processed="true">
					<div class="t_tit">나만의 필기법으로 암기 효율 UP!</div>
		
					<div class="t_normal" style="margin-bottom: 160px;">
						암기, 마구잡이식으로 머릿속에 집어놓으면 당장은 외워질 수 있지만<br>
						정작 필요할 때 생각해보면 머릿속이 새하얘지곤 한다.<br>
						무작정 눈으로 보고 외우기보다는 자신만의 노하우가 담긴 필기법으로<br>
						정리하고 외우다 보면 암기의 효율을 높일 수 있다는 사실!<br>
						<br>
						다양한 필기구를 활용한 깔끔하고 정돈된 필기법으로 공부 효율을 높이고 있다는<br>
						고3 수험생 수현씨의 암기 노하우를 소개한다.
					</div>
					<img alt="img" class="img_big loading" src="/study/monnami/images/storypick/storyPickList01_1.jpg" data-was-processed="true">
					<div class="t_medium">필기법 1. 최소한의 색을 사용하자</div>
			
					<div class="t_normal" style="margin-bottom: 140px;">
						여러 가지 색을 사용하면 중요한 내용이 무엇인지 알기도 힘들고<br>
						읽다 보면 눈이 아픈 경우가 많습니다.<br>
						그래서 항상 검은색, 빨간색, 파란색 이외의 색은 거의 사용하지 않습니다.<br>
						단원명이나 키워드, 중요한 내용은 형광펜으로 표시해서<br>
						최대한 단순하고 깔끔한 필기를 합니다.
					</div>
					<img alt="img" class="img_big loading" src="/study/monnami/images/storypick/storyPickList01_2.jpg" data-was-processed="true">
					<div class="t_medium">필기법 2. ‘내가’ 실수한 부분이나 헷갈리는 부분을 표기한다</div>
			
					<div class="t_normal" style="margin-bottom: 160px;">
						노트 필기의 가장 큰 장점은 내가 보고 들은 내용을 ‘스스로’ 직접 적는 것이라고 생각합니다.<br>
						그렇기 때문에 다른 요약책에서는 볼 수 없는, 내 취약점을 함께 정리할 수 있습니다.<br>
						나중에 복습할 때 그 부분을 유의해서 보기 때문에 다시 틀릴 확률을 줄일 수 있어 효율적이죠.<br>
						사진 속 노트에서 빨간 글씨가 바로 그 부분입니다.
					</div>
					<img alt="img" class="img_big loading" src="/study/monnami/images/storypick/storyPickList01_3.jpg" data-was-processed="true">
					<div class="t_tit">펜 추천 1. NEW N-JELL</div>
			
					<div class="t_normal" style="margin-bottom: 80px;">
						<img alt="img" class="mark loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/img/storypick/stationery/2019/01/1901_stationery_note_memorization_mark_01.jpg" style="padding: 0px 0px 30px;" data-was-processed="true"> 
						탐구 과목은 그림을 그리기도 하는데, 그때 색을 칠하는 용도로 NEW N-JELL을 사용합니다.<br>
						젤 잉크여서 필기감이 부드럽고, 다양한 색상이 있어서 선택의 폭이 넓습니다.<br>
						노란 계열을 좋아해서 golden yellow와 lime yellow를 주로 사용합니다.<br>
						다이어리를 꾸밀 때도 유용한 펜입니다. 
						<img alt="img" class="mark loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/img/storypick/stationery/2019/01/1901_stationery_note_memorization_mark_02.jpg" data-was-processed="true"></div>
						<img alt="img" class="img_big loading" src="/study/monnami/images/storypick/storyPickList01_4.jpg" data-was-processed="true">
					<div class="t_tit">펜 추천 2. Gripix 샤프</div>
			
					<div class="t_normal" style="margin-bottom: 80px;">
					<img alt="img" class="mark loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/img/storypick/stationery/2019/01/1901_stationery_note_memorization_mark_01.jpg" style="padding: 0px 0px 30px;" data-was-processed="true"> 
						샤프 종류도 많이 모으고 있는데 그 중 Gripix 샤프를 가장 많이 사용합니다.<br>
						하루에 몇십 개의 문제를 풀다 보면 손에 힘이 많이 들어가서 고무그립으로 된 샤프를<br>
						선호하는데, Gripix 샤프는 얇게 고무그립으로 되어있어 장시간 사용해도 무리가 없습니다.<br>
						다른 샤프와 다르게 특이한 지우개도 이 샤프의 매력인 것 같아요. 
					<img alt="img" class="mark loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/img/storypick/stationery/2019/01/1901_stationery_note_memorization_mark_02.jpg" data-was-processed="true"></div>
					<img alt="img" class="img_big loading" src="/study/monnami/images/storypick/storyPickList01_5.jpg" data-was-processed="true">
					<div class="t_tit">펜 추천 3. FX ZETA</div>
		
					<div class="t_normal">
					<img alt="img" class="mark loading" src="/study/monnami/images/storypick/storyPickListBasic1.jpg" style="padding: 0px 0px 30px;" data-was-processed="true">
						FX ZETA는 그립감이 마음에 들어서 자주 사용하는 제품입니다.<br>
						바디가 완전히 플라스틱으로만 되어있으면 손가락이 아프고,<br>
						땀에 미끄러져서 볼펜은 꼭 고무그립이 있는 것만 사용하는데요.<br>
						수능샤프와 비슷한 바디 굵기와 고무그립이 장점입니다. 
					<img alt="img" class="mark loading" src="/study/monnami/images/storypick/storyPickListBasic2.jpg" data-was-processed="true">
					</div>
				</div>
			</div>
			
			<div class="cont editor-area"><!-- 상품1 소스 시작  -->
				<div class="wrap_storypick">
					<div class="t_tit">이 포스트에 등장한 펜</div>
				</div>
			</div>
									
			<div class="product-list "> 
				<ul>
					<li>
						<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000157">찜</a>
						<a href="/w/product/productDetail.do?goodsNo=MG000000157">
							<span class="thumb-img">
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000157/main/MG000000157_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="" class="loading" data-was-processed="true">
							</span>
							<span class="info">
								<span class="txt-brand"></span>
								<strong class="txt-ti">엔젤(N-JELL)</strong>
								<span class="txt-price"><em>700</em>원</span>
							</span>
						</a>
					</li>
					
					<li>
						<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000156">찜</a>
						<a href="/w/product/productDetail.do?goodsNo=MG000000156">
							<span class="thumb-img">
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000156/main/MG000000156_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="" class="loading" data-was-processed="true">
							</span>
							<span class="info">
								<span class="txt-brand"></span>
								<strong class="txt-ti">에프엑스 제타(FX-ZETA)</strong>
								<span class="txt-price"><em>1,000</em>원</span>
							</span>
						</a>
					</li>
											
					<li>
						<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000047">찜</a>
						<a href="/w/product/productDetail.do?goodsNo=MG000000047">
							<span class="thumb-img">
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000047/main/MG000000047_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="" class="loading" data-was-processed="true">
							</span>
							<span class="info">
								<span class="txt-brand"></span>
								<strong class="txt-ti">그리픽스 샤프</strong>
								<span class="txt-price"><em>2,000</em>원</span>
							</span>
						</a>
					</li>
											
											
				</ul>
			</div>
									
			<div class="cont editor-area"><!-- 상품2 소스 시작  -->
				<div class="blank">&nbsp;</div>
			</div>
												
			<div class="detail-tag">
				<a href="javascript:void(0);" onclick="goTopSearch('#FX ZETA');">#FX ZETA</a> 
				<a href="javascript:void(0);" onclick="goTopSearch('#Gripix샤프');">#Gripix샤프</a> 
				<a href="javascript:void(0);" onclick="goTopSearch('#N-JELL');">#N-JELL</a> 
				<a href="javascript:void(0);" onclick="goTopSearch('#에프엑스제타');">#에프엑스제타</a> 
				<a href="javascript:void(0);" onclick="goTopSearch('#엔젤');">#엔젤</a> 
			</div>
			
		</div>
					
	
		<div class="prevnext">
			<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=188">모나르떼로 만난 초등인문학 - 이든과 루를 따라가는 시간여행</a></p>								
			<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=190">지난 주말엔</a></p>								
		
		</div>
					
		<div class="btn-area">
			<a href="javascript:void(0);" class="btn-black" onclick="goList();">목록</a>
		</div>
	</div>
</form>
			
</main>
</div>
</body>

<jsp:include page="/monnami/monnamiBottom.jsp"/>
	
</html>