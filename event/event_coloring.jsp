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
		
			
				<form name="exhibitionForm" id="exhibitionForm" method="post" onsubmit="return false;">
					<input type="hidden" name="pageNo" id="pageNo" value="1">
					<input type="hidden" name="promotionIdx" id="promotionIdx" value="36">
					<input type="hidden" name="gubun" id="gubun" value="P">
					
					
					
					<div class="inner">
						<h2>
							 <a href="javascript:void(0);"><strong>이벤트</strong></a>
						</h2>
			
						<div class="detail-ti">
							<h3>
								<small>2019.02.25 ~ 2019.12.31</small>
								색채 도구 세트 구매 시 컬러링 페이퍼 증정
							</h3>
							
						</div>
			
						<div class="detail-cont editor-area">
							<img alt="" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/editor/2019030516422453516.jpg" style="width: 1200px; height: 2700px;" class="loading" data-was-processed="true">
						</div>
						
						
						
						<div class="detail-pro type1">
							<div class="product-list">
								<ul>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000104">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000000104&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000104/main/MG000000104_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															바우하우스 색연필
															
																(12색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>5,000</em>원
													</span>
												</span>
												<span class="tag">
													
													
													
													
												</span>
											</a>
										</li>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000104">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000000104&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000104/main/MG000000104_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															바우하우스 색연필
															
																(48색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>20,000</em>원
													</span>
												</span>
												<span class="tag">
													
													
													
													
												</span>
											</a>
										</li>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000104">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000000104&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000104/main/MG000000104_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															바우하우스 색연필
															
																(36색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>15,000</em>원
													</span>
												</span>
												<span class="tag">
													
													
													
													
												</span>
											</a>
										</li>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000104">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000000104&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000104/main/MG000000104_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															바우하우스 색연필
															
																(24색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>10,000</em>원
													</span>
												</span>
												<span class="tag">
													
													
													
													
												</span>
											</a>
										</li>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000185">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000000185&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000185/main/MG000000185_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															프러스펜 3000 세트
															
																(36색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>10,800</em>원
													</span>
												</span>
												<span class="tag">
													
													
													
													
												</span>
											</a>
										</li>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000185">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000000185&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000185/main/MG000000185_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															프러스펜 3000 세트
															
																(24색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>7,200</em>원
													</span>
												</span>
												<span class="tag">
													
													
													
													
												</span>
											</a>
										</li>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000003501">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000003501&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003501/main/MG000003501_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															라이브칼라 세트 
															
																(10색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>7,000</em>원
													</span>
												</span>
												<span class="tag">
													
													
													
													
												</span>
											</a>
										</li>
									
										<li>
											<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000003501">찜</a>
											
												
												
													<a href="/w/product/productDetail.do?goodsNo=MG000003501&amp;trackingMonami=36">
												
											
												<span class="thumb-img">
													<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003501/main/MG000003501_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
												</span>
												<span class="info">
													
														<span class="txt-brand"></span>
													
													
														<strong class="txt-ti">
															라이브칼라 세트 
															
																(36색 세트)
															
														</strong>
													
													
													<span class="txt-price">
														
														<em>25,200</em>원
													</span>
												</span>
												<span class="tag">
	
												</span>
											</a>
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