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
				<h3><input type="hidden" name="story_subject">${dto.story_subject} </h3>				
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
					<img alt="img" class="img_big loading" src="${imagePath}/${dto.photo_saveFileName}" >
					
					
					<div class="t_normal" style="margin-bottom: 160px;">
						<input type="hidden" name="story_content">
						${dto.story_content } 
					
					
					</div>
				
				</div>
			</div>
<!-- 		<div class="cont editor-area">상품1 소스 시작 
				<div class="wrap_storypick">
					<div class="t_tit">이 포스트에 등장할 펜</div>
				</div>
			</div>
									
			<div class="product-list "> 
				<ul>
					<li>		
						
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
									
			<div class="cont editor-area">상품2 소스 시작 
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
		
		</div> -->
			
		
		<div class="btn-area">
			<button type="button" class="btn-white" 
			onclick="javascript:location.href='<%=cp %>/monnami/story/update.do?pageNum=${pageNum }&story_id=${story_id }'">수정</button>
			
			<button type="button" class="btn-white" 
			onclick="javascript:location.href='<%=cp %>/monnami/story/delete.do?pageNum=${pageNum }&story_id=${story_id }'">삭제</button>
			
			<button type="button" class="btn-white" 
			onclick="javascript:location.href='<%=cp %>/monnami/story/list.do'">취소</button>
		</div>
	</div>
</form>
			
</main>
</div>
</body>

<jsp:include page="/monnami/monnamiBottom.jsp"/>
	
</html>