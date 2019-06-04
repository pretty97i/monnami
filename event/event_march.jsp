<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/monnami/content/monnamiTop.jsp"/>

</head>
<body>
<body class="home">	
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
	
	
		
		
			
		
	
		
	<main id="contents" class="event detail">
		
			
				<form name="eventForm" id="eventForm" method="post" onsubmit="return false;">
					<input type="hidden" name="pageNo" id="pageNo" value="1">
					<input type="hidden" name="promotionIdx" id="promotionIdx" value="72">
					<input type="hidden" name="gubun" id="gubun" value="E">
					
					
					
					<input type="hidden" name="replyYn" id="replyYn" value="Y">	
					<input type="hidden" name="replyDupYn" id="replyDupYn" value="N">	
					<input type="hidden" name="nomemberYn" id="nomemberYn" value="N">	
					<input type="hidden" name="schCheck" id="schCheck" value="">
					
		
					<div class="inner">
						<h2>
							<a href="javascript:void(0);"><strong>EVENT</strong></a>
						</h2>
			
						<div class="detail-ti">
							<h3>
								<small>2019.03.05 ~ 2019.03.31</small>
								3월의 구매사은품
							</h3>

						</div>
			
						<div class="detail-cont editor-area">
							<img alt="" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/editor/2019030516210163283.jpg" style="width: 1200px; height: 3514px;" class="loaded" data-was-processed="true">
						</div>
						
						<div id="reply_box"></div>
						<div class="detail-comment">
							
							
							
							<div class="comment-write">
								<textarea placeholder="댓글을 입력해주세요." name="replyDesc" id="replyDesc"></textarea>
								<span class="counter" id="counter">0/200</span>
								<a href="javascript:void(0);" class="btn-black btn-insert" onclick="replySave();">등록</a>
							</div>
			
							<div class="comment-list">
								<ul>
									
								</ul>
			
								<div class="paging">
									
								</div>
							</div>
						</div>
	
							<div id="detailPro43" class="detail-pro type1">
								<div class="event-tabs">
									<ul>
										
										<li><a href="#detailPro43" class="active">사은품 판매 상품 <span class="hide">현재위치</span></a></li>
										
									</ul>
								</div>

										<div class="product-list">
											<ul>
												
													
														<li>
															<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000003423">찜</a>
															<a href="/w/product/productDetail.do?goodsNo=MG000003423&amp;trackingMonami=72">
																<span class="thumb-img">
																	<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003423/main/MG000003423_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
																</span>
																<span class="info">
																	
																		<span class="txt-brand"></span>
																	
																	
																		<strong class="txt-ti">
																			화분 페이퍼커버
																			
																				(M)
																			
																		</strong>
																	
																	
																		<span class="txt-info">인테리어 효과로 좋은</span>
																	
																<span class="txt-price">
																	
																	<em>4,900</em>원
																</span>
																<span class="tag">
																	
																	
																	
																	
																</span>
															</span></a>
														</li>
													
												
													
														<li>
															<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000003423">찜</a>
															<a href="/w/product/productDetail.do?goodsNo=MG000003423&amp;trackingMonami=72">
																<span class="thumb-img">
																	<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003423/main/MG000003423_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
																</span>
																<span class="info">
																	
																		<span class="txt-brand"></span>
																	
																	
																		<strong class="txt-ti">
																			화분 페이퍼커버
																			
																				(S)
																			
																		</strong>
																	
																	
																		<span class="txt-info">인테리어 효과로 좋은</span>
																	
																<span class="txt-price">
																	
																	<em>3,900</em>원
																</span>
																<span class="tag">
																	
																	
																	
																	
																</span>
															</span></a>
														</li>
													
												
													
														<li>
															<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000003424">찜</a>
															<a href="/w/product/productDetail.do?goodsNo=MG000003424&amp;trackingMonami=72">
																<span class="thumb-img">
																	<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003424/main/MG000003424_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
																</span>
																<span class="info">
																	
																		<span class="txt-brand"></span>
																	
																	
																		<strong class="txt-ti">
																			홀로그램 파우치
																			
																		</strong>
																	
																	
																<span class="txt-price">
																	
																	<em>15,000</em>원
																</span>
																<span class="tag">
																	
																	
																	
																	
																</span>
															</span></a>
														</li>
													
												
											</ul>
										</div>
									
									
									
									
								
							</div>
						
						
			
						<div class="btn-area">
							<a href="<%=cp %>/monnami/event/event_main.jsp" class="btn-black">목록</a>
						</div>
					</div>
				</form>
			
			
		
	</main>
	
	
<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html>