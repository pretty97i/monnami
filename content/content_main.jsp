<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.getParameter("UTF-8");
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
<body class="stationery">
	<div id="wrap" class="main">
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






<div class="banner-wing active" style="position: absolute; top: 1058px;">
	<div class="ban">
		<button type="button" class="btn-white small btn-close" onclick="fn.removeClass('.banner-wing');">닫기</button>
		
			
				<a href="<%=cp%>/monnami/event/event_march.jsp">
			
			
		
			<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/banner/21/2019030610170210906.png" alt="3월 구매사은품 " class="loading" data-was-processed="true">
		</a>
	</div>
</div>


	<main id="contents">
		

		<div class="visual">
			<div class="inner">
				<div class="innerfull">
					<div class="swiper-container swipervisual swiper-container-horizontal swiper-container-wp8-horizontal">
						<ul class="visualtitle">
							
							
									
									<li>1<strong>. FX 153 리미티드 에디션</strong></li>
									
								
							
									
									<li>2<strong>. 153 Blossom</strong></li>
									
								
							
									
									<li>3<strong>. 고급 필기구 무료 각인</strong></li>
									
								
							
									
									<li>4<strong>. 유성매직트윈 109 </strong></li>
									
								
							
									
									<li>5<strong>. 색채도구 구매 이벤트</strong></li>
									
								
							
						</ul>
						<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-7680px, 0px, 0px);">
									<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="4" style="width: 1920px;">
										
											
												<a href="/w/promotion/exhibition/exhibitionView.do?promotionIdx=36">
											
											
										
											<img class="bg swiper-lazy swiper-lazy-loaded" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2019030715551425644.jpg" alt="">
											<span class="txt black">색채도구 구매 이벤트<br><small>라이브칼라, 색연필, 프러스펜 구매 시<br>컬러링 페이퍼 증정</small></span>
										</a>
									</div>
							
								
									<div class="swiper-slide" data-swiper-slide-index="0" style="width: 1920px;">
										
											
												<a href="/w/product/productDetail.do?goodsNo=MG000003580">
											
											
										
											<img class="bg swiper-lazy swiper-lazy-loaded loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2019030609050880533.jpg" alt="" data-was-processed="true">
											<span class="txt black">FX 153 리미티드 에디션<small>3.1운동 100주년을 기념하여
<br>모나미 마음을 담아 제작한 한정판 제품</small></span>
										</a>
									</div>
								
							
								
									<div class="swiper-slide" data-swiper-slide-index="1" style="width: 1920px;">
										
											
												<a href="/w/product/productDetail.do?goodsNo=MG000003497">
											
											
										
											<img class="bg swiper-lazy swiper-lazy-loaded loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2019021508392567789.jpg" alt="" data-was-processed="true">
											<span class="txt black">꽃피는 봄이 오면<small>화사한 꽃 한 송이가 내 손 안에
<br>153 Blossom</small></span>
										</a>
									</div>
								
							
								
									<div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="2" style="width: 1920px;">
										
											
												<a href="/w/promotion/exhibition/exhibitionView.do?promotionIdx=37">
											
											
										
											<img class="bg swiper-lazy loading swiper-lazy-loaded" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2019022511284320442.jpg" alt="" data-was-processed="true">
											<span class="txt black">고급 필기구 무료 각인<small>새학기, 새로운 직장생활, 
<br>새로운 계획을 세우기 좋은 시간</small></span>
										</a>
									</div>
								
							
								
									<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="3" style="width: 1920px;">
										
											
												<a href="/w/product/productDetail.do?goodsNo=MG000003585">
											
											
										
											<img class="bg swiper-lazy loading swiper-lazy-loaded" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2019030713303143590.jpg" alt="" data-was-processed="true">
											<span class="txt black">유성매직 트윈 109 출시!<small>다양한 표면에 사용 가능한 
<br>유성매직트윈 109 </small></span>
										</a>
									</div>
								
							
								
									<div class="swiper-slide swiper-slide-next" data-swiper-slide-index="4" style="width: 1920px;">
										
											
												<a href="<%=cp%>/monnami/event/event_coloring.jsp">
											
											
										
											<img class="bg swiper-lazy swiper-lazy-loaded loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2019030715551425644.jpg" alt="" data-was-processed="true">
											<span class="txt black">색채도구 구매 이벤트
											<br><small>라이브칼라, 색연필, 프러스펜 구매 시
											<br>컬러링 페이퍼 증정</small></span>
										</a>
									</div>
								
							
						<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 1920px;">
										
											
												<a href="/w/product/productDetail.do?goodsNo=MG000003580">
											
											
										
											<img class="bg swiper-lazy swiper-lazy-loaded" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2019030609050880533.jpg" alt="">
											<span class="txt black">FX 153 리미티드 에디션<small>3.1운동 100주년을 기념하여
											<br>모나미 마음을 담아 제작한 한정판 제품</small></span></a>
									</div></div>
						<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet">1<strong>. FX 153 리미티드 에디션</strong></span><span class="swiper-pagination-bullet">2<strong>. 153 Blossom</strong></span><span class="swiper-pagination-bullet">3<strong>. 고급 필기구 무료 각인</strong></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active">4<strong>. 유성매직트윈 109 </strong></span><span class="swiper-pagination-bullet">5<strong>. 색채도구 구매 이벤트</strong></span></div>
					</div>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
		

		
		
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		
		<div class="signatures">
			<div class="inner">
				<h2><em>6</em> SIGNATURES</h2>
				<div class="year-ti">
					<span class="txt-year start">1963</span>
					<p><em>과거</em>와 <em>현재</em>를 잇다</p>
					<span class="txt-year end">2019</span>
				</div>
				<div class="swiper-container swipersignatures swiper-container-horizontal swiper-container-wp8-horizontal">
					<div class="swiper-wrapper">
						
						
						<div class="swiper-slide swiper-slide-active" style="width: 1200px;">
							<div class="nav">
							
							
							
							
							
							
							
							
							
							
							
								
								
									<div class="now"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019011713181140563.jpg" alt="" class="swiper-lazy swiper-lazy-loaded loading" data-was-processed="true"></div>
								
							
							
							
							
							
							
							
							
							
								
									<div class="old active"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019011713180806068.jpg" alt="" class="swiper-lazy swiper-lazy-loaded loading" data-was-processed="true"></div>
									
								
								
							
							
							
							
							
							
							
							
							
							
							
							
							
								
								
							
							
							
								
								
							
							
							
								
								
							
							
							</div>
							<div class="scont-area">
								<div class="scont now active" style="left: 0px;">
									<ul class="ls active">
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
												<li class="active"><a>현재 - 153피셔맨</a></li>
											
										
											
										
											
										
											
										
											
										
											
										
											
												<li><a>현재 - 153야미</a></li>
											
										
											
												<li><a>현재- 153블라썸</a></li>
											
										
											
												<li><a>현재 - 153 블랙&amp;화이트</a></li>
											
										
									</ul>
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<div class="lscont active">
												<img class="pic swiper-lazy swiper-lazy-loaded loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019011713202613974.jpg" alt="" data-was-processed="true">
												<strong>현재 - 153피셔맨</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000027">
													
													
												
													<p>프란치스코 교황 방한 기념<br>헌정용 볼펜</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
									
										
									
										
									
										
									
										
											<div class="lscont">
												<img class="pic swiper-lazy swiper-lazy-loaded loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019011713202783961.jpg" alt="" data-was-processed="true">
												<strong>현재 - 153야미</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000003509">
													
													
												
													<p>찰떡궁합 야미 친구들의<br>이야기를 담은 153 야미</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
											<div class="lscont">
												<img class="pic swiper-lazy swiper-lazy-loaded loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019011713202998721.jpg" alt="" data-was-processed="true">
												<strong>현재- 153블라썸</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000003497">
													
													
												
													<p>분홍 작약과 푸른 제비꽃을<br>연상시키는 153 시그니쳐 볼펜</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
											<div class="lscont">
												<img class="pic swiper-lazy swiper-lazy-loaded loading" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021116593051611.jpg" alt="" data-was-processed="true">
												<strong>현재 - 153 블랙&amp;화이트</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000015">
													
													
												
													<p>시크한 올 블랙과 모던한 올 화이트 컬러의<br>153 Black &amp; White</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>

								</div>
								<div class="scont old" style="left: 0px;">

											<div class="lscont">
												<img class="pic swiper-lazy swiper-lazy-loaded" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019011713212203161.jpg" alt="">
												<strong>과거 - 153</strong>

														<a href="/w/product/productDetail.do?goodsNo=MG000000001">

													<p>37억 자루 이상 판매된 <br>모나미 대표 스테디셀러<br></p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>

								</div>
							</div>
						</div>

						<div class="swiper-slide swiper-slide-next" style="width: 1200px;">
							<div class="nav">

									<div class="now"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117182858874.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>

									<div class="old active"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117182687756.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>

							</div>
							<div class="scont-area">
								<div class="scont now active" style="left: 0px;">
									<ul class="ls active">

												<li class="active"><a>현재 - 매직 캡</a></li>

									</ul>

											<div class="lscont active">
												<img class="pic swiper-lazy swiper-lazy-loaded" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117182704954.jpg" alt="">
												<strong>현재 - 매직 캡</strong>

														<a href="/w/product/productDetail.do?goodsNo=MG000000072">

													<p>클립을 적용하여<br>휴대성을 강화한 매직 캡</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
	
								</div>
								<div class="scont old" style="left: 0px;">

											<div class="lscont">
												<img class="pic swiper-lazy swiper-lazy-loaded" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117182890921.jpg" alt="">
												<strong>과거 - 매직 잉크</strong>

														<a href="/w/product/productDetail.do?goodsNo=MG000000107">
										
													<p>어떤 재질에도 <br>마법처럼 쓸 수 있는 매직 잉크</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>

								</div>
							</div>
						</div>

						<div class="swiper-slide" style="width: 1200px;">
							<div class="nav">

									<div class="old active"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117443034154.jpg" alt="" class="swiper-lazy"></div>

									<div class="now"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117432459921.jpg" alt="" class="swiper-lazy"></div>

							</div>
							<div class="scont-area">
								<div class="scont now active" style="left: 0px;">
									<ul class="ls active">

												<li class="active"><a>현재 - 프러스펜 S</a></li>

												<li><a>현재 - 프러스펜 S - 네온컬러</a></li>

									</ul>

											<div class="lscont active">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117432112642.jpg" alt="">
												<strong>현재 - 프러스펜 S</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000186">
													
													
												
													<p>캡에 클립을 적용해<br>휴대성을 더한 프러스펜S</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>

											<div class="lscont">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117432240575.jpg" alt="">
												<strong>현재 - 프러스펜 S - 네온컬러</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000187">
													
													
												
													<p>효과적인 강조, 섬세한 표현을 돕는 <br>프러스펜S 네온컬러</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
	
								</div>
								<div class="scont old" style="left: 0px;">

											<div class="lscont">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021117432471104.jpg" alt="">
												<strong>과거 - 프러스펜 3000</strong>
								
														<a href="/w/product/productDetail.do?goodsNo=MG000000184">

													<p>세밀한 표현이 가능한<br>한국 수성펜의 아이콘</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>

								</div>
							</div>
						</div>
						
						
						
						<div class="swiper-slide" style="width: 1200px;">
							<div class="nav">
							
							
							
							
							
								
								
									<div class="now"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211371238286.jpg" alt="" class="swiper-lazy"></div>
								
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
								
									<div class="old active"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211370929408.jpg" alt="" class="swiper-lazy"></div>
									
								
								
							
							
							
							
							
								
								
							
							
							
							
							
							
							
							
							
							
							</div>
							<div class="scont-area">
								<div class="scont now active" style="left: 0px;">
									<ul class="ls active">
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
												<li class="active"><a>현재 - 불투명 네임펜 132</a></li>
											
										
											
										
											
												<li><a>현재 - 생잉크네임펜 F 122</a></li>
											
										
											
										
											
										
											
										
											
										
									</ul>
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<div class="lscont active">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211370933275.jpg" alt="">
												<strong>현재 - 불투명 네임펜 132</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000110">
													
													
												
													<p>모든 곳에서 진하고 선명하게 써지는 <br>불투명 네임펜 132</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
											<div class="lscont">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211371076615.jpg" alt="">
												<strong>현재 - 생잉크네임펜 F 122</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000126">
													
													
												
													<p>마지막까지 진한 생잉크 타입의<br>생잉크네임펜 F 122</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
									
										
									
										
									
								</div>
								<div class="scont old" style="left: 0px;">
									
										
									
										
											<div class="lscont">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211371245282.jpg" alt="">
												<strong>과거 - 네임펜</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000046">
													
													
												
													<p>모나미 판매 1위<br>선명한 표현이 가능한 네임펜 </p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						</div>
						
						
						
						<div class="swiper-slide" style="width: 1200px;">
							<div class="nav">
							
							
							
								
									<div class="old active"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211470254420.jpg" alt="" class="swiper-lazy"></div>
									
								
								
							
							
							
							
							
							
							
								
								
									<div class="now"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211470374073.jpg" alt="" class="swiper-lazy"></div>
								
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							</div>
							<div class="scont-area">
								<div class="scont now active" style="left: 0px;">
									<ul class="ls active">
										
											
												<li class="active"><a>현재  - 생잉크 보드마카</a></li>
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
									</ul>
									
										
											<div class="lscont active">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211470201208.jpg" alt="">
												<strong>현재  - 생잉크 보드마카</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000121">
													
													
												
													<p>쉽게 마르지 않는<br>생잉크 타입 보드마카</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
								<div class="scont old" style="left: 0px;">
									
										
									
										
									
										
									
										
											<div class="lscont">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211470481432.jpg" alt="">
												<strong>과거 - 보드마카</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000108">
													
													
												
													<p>전 세계 생산량 2위<br>세계인이 사용하는 보드마카</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						</div>
						
						
						
						<div class="swiper-slide" style="width: 1200px;">
							<div class="nav">
							
							
							
							
							
							
							
								
									<div class="old active"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211530151219.jpg" alt="" class="swiper-lazy"></div>
									
								
								
							
							
							
							
							
							
							
								
								
									<div class="now"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211530220498.jpg" alt="" class="swiper-lazy"></div>
								
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							</div>
							<div class="scont-area">
								<div class="scont now active" style="left: 0px;">
									<ul class="ls active">
										
											
										
											
										
											
												<li class="active"><a>현재 - 생잉크 유성매직</a></li>
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
									</ul>
									
										
									
										
									
										
											<div class="lscont active">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211530178786.jpg" alt="">
												<strong>현재 - 생잉크 유성매직</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000124">
													
													
												
													<p>다양한 표면에 사용 가능한 <br>생잉크 유성매직</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
								<div class="scont old" style="left: 0px;">
									
										
									
										
									
										
									
										
									
										
									
										
											<div class="lscont">
												<img class="pic swiper-lazy" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/signatures/2019021211530335059.jpg" alt="">
												<strong>과거  - 유성매직</strong>
												
													
														<a href="/w/product/productDetail.do?goodsNo=MG000000167">
													
													
												
													<p>다양한 표면에 사용 가능한<br>한국 마카의 대명사</p>
													<span class="btn-buy">구매하기</span>
												</a>
											</div>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
				<div class="swiper-button-next-signatures"></div>
				<div class="swiper-button-prev-signatures swiper-button-disabled"></div>
			</div>
		</div>
		

		
		
		
		
		
			
		
			
		
			
		
			
		
			
				
				
				
			
		
			
		
			
		
		
		
		<div class="inner marker">
			<div class="innerfull">
				<div class="swiper-container swipermarker swiper-container-fade swiper-container-horizontal swiper-container-wp8-horizontal">
					<div class="swiper-wrapper">
						<ul class="markertitle">
							
								
									<li>DIY용</li>
								
							
								
									<li>일상생활용</li>
								
							
								
									<li>마킹용</li>
								
							
						</ul>
						
							
								<div class="swiper-slide swiper-slide-active" style="width: 1920px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
									<div class="bg"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019011713295318200.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
									<div class="info">
										<h3><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019011713261272369.png" alt="어디까지 마카 써봤니" class="swiper-lazy swiper-lazy-loaded"></h3>
										<p>
											<strong>세라믹마카</strong>
											<span>머그컵, 접시, 그릇 등의 도자기에 <br>나만의 감성으로 스타일링 해보세요.</span>
										</p>
										<div class="usels">
											<h4><span>사<br>용<br>법</span></h4>
											<ul>
												
													
														<li>
															<a href="javascript:void(0);" class="ban mv" data-mv="https://www.youtube.com/embed/wlpWO37OzSs" data-ti="세라믹마카">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019011713315607453.jpg" alt="" class="swiper-lazy swiper-lazy-loaded">
															</a>
														</li>
													
													
												
												
												
												
													
														<li>
															<a href="/w/product/productDetail.do?goodsNo=MG000000130">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000130/main/MG000000130_REP_THUMB_240X240.blob" onerror="this.src='/w/images/240x240.jpg'" alt="" class="swiper-lazy swiper-lazy-loaded">
																<span>세라믹마카 480</span>
															</a>
														</li>
														
													
												
													
												
													
														<li>
															<a href="/w/product/productDetail.do?goodsNo=MG000000131">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000131/main/MG000000131_REP_THUMB_240X240.blob" onerror="this.src='/w/images/240x240.jpg'" alt="" class="swiper-lazy swiper-lazy-loaded">
																<span>세라믹마카 482</span>
															</a>
														</li>
														
													
												
													
												
													
												
												
												<li>
													
														<a href="/w/product/productList.do?schCateIdx1=184&amp;schCateIdx2=225&amp;schCateIdx3=226" class="btn-more">더 보기</a>
														
													
												</li>
											</ul>
										</div>
									</div>
								</div>
							
						
							
								<div class="swiper-slide swiper-slide-next" style="width: 1920px; opacity: 0; transform: translate3d(-1920px, 0px, 0px);">
									<div class="bg"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019021111272606753.jpg" alt="" class="swiper-lazy"></div>
									<div class="info">
										<h3><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019011713261272369.png" alt="어디까지 마카 써봤니" class="swiper-lazy"></h3>
										<p>
											<strong>키친마카</strong>
											<span>복잡한 냉장고 안, 똑같은 모양의 똑같은 반찬통이<br>헷갈렸다면 이젠 키친마카로 정리해 보세요!</span>
										</p>
										<div class="usels">
											<h4><span>사<br>용<br>법</span></h4>
											<ul>
												
													
														<li>
															<a href="javascript:void(0);" class="ban mv" data-mv="https://www.youtube.com/embed/k1qMTQ2eOQo" data-ti="키친마카">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019021111272811363.jpg" alt="" class="swiper-lazy">
															</a>
														</li>
													
													
												
												
												
												
													
												
													
														<li>
															<a href="/w/product/productDetail.do?goodsNo=MG000000179">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000179/main/MG000000179_REP_THUMB_240X240.blob" onerror="this.src='/w/images/240x240.jpg'" alt="" class="swiper-lazy">
																<span>키친마카 420</span>
															</a>
														</li>
														
													
												
													
												
													
												
													
												
												
												<li>
													
														<a href="/w/product/productList.do?schCateIdx1=184&amp;schCateIdx2=225&amp;schCateIdx3=226" class="btn-more">더 보기</a>
														
													
												</li>
											</ul>
										</div>
									</div>
								</div>
							
						
							
								<div class="swiper-slide" style="width: 1920px; opacity: 0; transform: translate3d(-3840px, 0px, 0px);">
									<div class="bg"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019021114234589776.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
									<div class="info">
										<h3><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019011713261272369.png" alt="어디까지 마카 써봤니" class="swiper-lazy swiper-lazy-loaded"></h3>
										<p>
											<strong>유성 매직</strong>
											<span>유리, 플라스틱, 금속 등<br>모든 곳에 선명하게 필기하고 싶다면!</span>
										</p>
										<div class="usels">
											<h4><span>사<br>용<br>법</span></h4>
											<ul>
												
													
														<li>
															<a href="javascript:void(0);" class="ban mv" data-mv="https://www.youtube.com/embed/7VubcYklYIo" data-ti="유성 매직">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/marker/59/2019021114234632850.jpg" alt="" class="swiper-lazy swiper-lazy-loaded">
															</a>
														</li>
													
													
												
												
												
												
													
												
													
												
													
												
													
														<li>
															<a href="/w/product/productDetail.do?goodsNo=MG000003502">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003502/main/MG000003502_REP_THUMB_240X240.blob" onerror="this.src='/w/images/240x240.jpg'" alt="" class="swiper-lazy swiper-lazy-loaded">
																<span>유성매직</span>
															</a>
														</li>
														
													
												
													
														<li>
															<a href="/w/product/productDetail.do?goodsNo=MG000000128">
																<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000128/main/MG000000128_REP_THUMB_240X240.blob" onerror="this.src='/w/images/240x240.jpg'" alt="" class="swiper-lazy swiper-lazy-loaded">
																<span>생잉크 유성매직 120 6색 세트</span>
															</a>
														</li>
														
													
												
												
												<li>
													
														<a href="/w/product/productList.do?schCateIdx1=184&amp;schCateIdx2=234&amp;schCateIdx3=235" class="btn-more">더 보기</a>
														
													
												</li>
											</ul>
										</div>
									</div>
								</div>
							
						
					</div>
					<div class="swiper-pagination-marker swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active">DIY용</span><span class="swiper-pagination-bullet">일상생활용</span><span class="swiper-pagination-bullet">마킹용</span></div>
				</div>
			</div>
		</div>
		

		
		
		
		
			
		
			
		
			
		
			
		
			
		
			
		
			
				
				
			
		
		
		
		<div class="inner dailyall">
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				<h2>일상 속 모든 문구</h2>
				<p>ㅡ</p>
			
			
			<ul>
				
					
						<li>
							
								<a href="/w/product/productDetail.do?goodsNo=MG000000108">
								
							
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/dailyimg/101/2019021409225810508.jpg" alt="">
								<div class="active ">
									<div class="txt">
										<p class="out"><strong>전 세계 생산량 2위</strong>세계인이 사용하는 마카</p>
										<p class="over">보드마카</p>
									</div>
								</div>
							</a>
						</li>
					
				
					
				
					
				
					
						<li>
							
								<a href="/w/product/productDetail.do?goodsNo=MG000000002">
								
							
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/dailyimg/101/2019013011465329400.jpg" alt="">
								<div class="active ">
									<div class="txt">
										<p class="out"><strong>나만의</strong>153 만들기</p>
										<p class="over">153 DIY PEN KIT</p>
									</div>
								</div>
							</a>
						</li>
					
				
					
				
					
						<li>
							
								<a href="/w/product/productDetail.do?goodsNo=MG000000001">
								
							
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/dailyimg/101/2019013011465455408.jpg" alt="">
								<div class="active ">
									<div class="txt">
										<p class="out"><strong>대한민국</strong>국민볼펜</p>
										<p class="over">모나미 153 오리지널</p>
									</div>
								</div>
							</a>
						</li>
					
				
					
						<li>
							
								<a href="/w/storypick/storypickView.do?storyIdx=83">
								
							
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/dailyimg/101/2019013011465469559.jpg" alt="">
								<div class="active ">
									<div class="txt">
										<p class="out"><strong>누구나 쉽게</strong>네일하는 법</p>
										<p class="over">네일아트펜</p>
									</div>
								</div>
							</a>
						</li>
					
				
					
				
					
				
					
						<li>
							
								<a href="/w/storypick/storypickView.do?storyIdx=122">
								
							
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/dailyimg/101/2019013011465591990.jpg" alt="">
								<div class="active ">
									<div class="txt">
										<p class="out"><strong>젖은 표면 위에도</strong>쓸 수 있는 펜</p>
										<p class="over">물기에  잘 써지는 마카</p>
									</div>
								</div>
							</a>
						</li>
					
				
					
				
					
						<li>
							
								<a href="/w/storypick/storypickView.do?storyIdx=72">
								
							
								<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/dailyimg/101/2019013011465588993.jpg" alt="">
								<div class="active ">
									<div class="txt">
										<p class="out"><strong>펜, </strong>그 이상의 가치</p>
										<p class="over">153 피셔맨</p>
									</div>
								</div>
							</a>
						</li>
					
				
					
				
			</ul>
		</div>
		

		
		
		
		
		
			
		
			
		
			
		
			
		
			
		
			
				
				
				
			
		
			
		
		
		
		<div class="dailym2">
			<div class="inner">
				
					
				
					
				
					
				
					
				
					
				
					
						<h2>일상에+M</h2>
						<p>ㅡ</p>
					
				
					
				
				<div class="ls">
					
						
						<a href="javascript:void(0);" class="btn-more">영상 더보기</a>
					
					<div class="swiper-container swiperdailym2 swiper-container-vertical swiper-container-wp8-vertical">
						<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(0px, -34px, 0px);">
							
							
								
							
								
									<div class="swiper-slide">
										<a href="javascript:void(0);" data-mv="https://www.youtube.com/embed/Xgz6YDETSa8" data-ti="나만의 잉크 이렇게 만들어요">
											<strong>잉크 DIY 사용법</strong>나만의 잉크 이렇게 만들어요
										</a>
									</div>
									
								
							
								
									<div class="swiper-slide swiper-slide-prev">
										<a href="javascript:void(0);" data-mv="https://www.youtube.com/embed/15gcv4CIw1Q" data-ti="컬러에 물들다">
											<strong>컬러 트윈 브러쉬 활용법</strong>컬러에 물들다
										</a>
									</div>
									
								
							
								
							
								
									<div class="swiper-slide swiper-slide-active">
										<a href="javascript:void(0);" data-mv="https://www.youtube.com/embed/R18RQCfhXd8" data-ti="남산서울타워">
											<strong>서울그리기 랜드마크편</strong>남산서울타워
										</a>
									</div>
									
								
							
								
							
								
							
								
									<div class="swiper-slide swiper-slide-next">
										<a href="javascript:void(0);" data-mv="https://www.youtube.com/embed/6FGpkRiiWjA" data-ti="어디까지 써봤니?">
											<strong>모나미 프러스펜</strong>어디까지 써봤니?
										</a>
									</div>
									
								
							
								
									<div class="swiper-slide">
										<a href="javascript:void(0);" data-mv="https://www.youtube.com/embed/8KpDqIuTTKQ" data-ti="둘만의 커플컵 만드는 방법">
											<strong>세라믹 마카</strong>둘만의 커플컵 만드는 방법
										</a>
									</div>
									
								
							
								
							
								
									<div class="swiper-slide">
										<a href="javascript:void(0);" data-mv="https://www.youtube.com/embed/_ujEsUXGxJc" data-ti="쿡북 꾸미기">
											<strong>모나미 DIY 작업실</strong>쿡북 꾸미기
										</a>
									</div>
									
								
							
								
							
								
									<div class="swiper-slide">
										<a href="javascript:void(0);" data-mv="https://www.youtube.com/embed/plahhesBAqc" data-ti="필터타입 VS 생잉크타입 ">
											<strong>비교영상 유성매직</strong>필터타입 VS 생잉크타입 
										</a>
									</div>
									
								
							
						</div>
					</div>
					<div class="swiper-button-next-dailym2"></div>
					<div class="swiper-button-prev-dailym2"></div>
				</div>
				<div class="mv-area">
					<div class="mv"><iframe width="820" height="462" src="https://www.youtube.com/embed/R18RQCfhXd8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen=""></iframe></div>
					<div class="ti">남산서울타워</div>
					<div class="btn-prev">PREV</div>
					<div class="btn-next">NEXT</div>
				</div>
			</div>
		</div>
		
		<style>
			.main .dailym2 {padding-bottom:100px;padding-top:119px;background-color:#f7f7f7;}
			.main .dailym2 h2 {color:#000;font-size:40px;font-weight:500;letter-spacing:-0.04em;text-align:center;}
			.main .dailym2 p {padding-top:23px;line-height:24px;color:#555;font-size:14px;text-align:center;}
			.main .dailym2 .ls  {position:relative;margin-top:35px;padding-top:50px;width:350px;height:526px;background-color:#fff;box-sizing:border-box;}
			.main .dailym2 .ls .btn-more {position:absolute;top:25px;left:30px;display:inline-block;padding:0 14px 0 0;color:#999;font-size:14px;letter-spacing:0;}
			.main .dailym2 .ls .btn-more:before {content:"";position:absolute;top:3px;right:0;display:inline-block;width:5px;height:8px;background:url("../../images/w/main/stationery.png") no-repeat 0 -10px;}
			.main .dailym2 .swiperdailym2 {width:280px;height:420px;}
			.main .dailym2 .swiperdailym2 .swiper-slide {height:70px;}
			.main .dailym2 .swiperdailym2 .swiper-slide a {display:block;padding:16px 0;line-height:24px;color:#999;font-size:14px;text-align:right;}
			.main .dailym2 .swiperdailym2 .swiper-slide a strong {display:block;}
			
			.main .dailym2 .swiperdailym2 .swiper-slide-active {margin:18px 0 23px;height:97px;}
			.main .dailym2 .swiperdailym2 .swiper-slide-active a {padding:22px 0 27px;line-height:30px;color:#000;font-size:20px;border-top:1px solid #000;border-bottom:1px solid #000;}
			/*
			.main .dailym2 .swiperdailym2 .swiper-slide-active {margin:18px 0 23px;height:97px;}
			.main .dailym2 .swiperdailym2 .swiper-slide-active a {padding:22px 0 27px;line-height:30px;color:#000;font-size:20px;border-top:1px solid #000;border-bottom:1px solid #000;}
			/*
			.main .dailym2 .swiperdailym2 .swiper-slide {height:84px;}
			.main .dailym2 .swiperdailym2 .swiper-slide-active {border-top:1px solid #000;border-bottom:1px solid #000;}
			.main .dailym2 .swiperdailym2 .swiper-slide-active a {padding:10px 0 0;line-height:30px;color:#000;font-size:20px;}
			
			.main .dailym2 .swiperdailym2 {width:280px;height:420px;}
			.main .dailym2 .swiperdailym2 .swiper-slide {height:70px;}
			.main .dailym2 .swiperdailym2 .swiper-slide a {display:block;padding:16px 0;line-height:24px;color:#999;font-size:14px;text-align:right;cursor:default;}
			.main .dailym2 .swiperdailym2 .swiper-slide a strong {display:block;}
			.main .dailym2 .swiperdailym2 .swiper-slide-active {margin:18px 0 23px;height:97px;}
			.main .dailym2 .swiperdailym2 .active {margin:18px 0 23px;height:97px;}
			.main .dailym2 .swiperdailym2 .active a {padding:22px 0 27px;line-height:30px;color:#000;font-size:20px;border-top:1px solid #000;border-bottom:1px solid #000;}
			*/
			.main .dailym2 .swiper-button-prev-dailym2 {position:absolute;top:30px;left:50%;display:inline-block;margin-left:-15px;width:30px;height:16px;background:url("../../images/w/main/stationery.png") no-repeat -44px 0;cursor:pointer;z-index:1;}
			.main .dailym2 .swiper-button-next-dailym2 {position:absolute;bottom:30px;left:50%;display:inline-block;margin-left:-15px;width:30px;height:16px;background:url("../../images/w/main/stationery.png") no-repeat -44px 0;transform:rotate(180deg);cursor:pointer;z-index:1;}
			.main .dailym2 .swiper-button-disabled {opacity:.3;}
			.main .dailym2 .mv-area {position:absolute;top:122px;right:0;width:820px;height:526px;}
			.main .dailym2 .mv-area .mv {width:820px;height:462px;background-color:#000;}
			.main .dailym2 .mv-area .ti {display:block;margin-top:23px;color:#666;font-size:20px;letter-spacing:0;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;text-align:center;}
			.main .dailym2 .mv-area .btn-prev {position:absolute;bottom:22px;left:0;display:inline-block;padding:0 0 0 14px;color:#999;font-size:16px;letter-spacing:0;cursor:pointer;z-index:1;}
			.main .dailym2 .mv-area .btn-prev:before {content:"";position:absolute;top:4px;left:0;display:inline-block;width:5px;height:8px;background:url("../../images/w/main/stationery.png") no-repeat 0 -10px;transform:rotate(180deg);}
			.main .dailym2 .mv-area .btn-next {position:absolute;bottom:22px;right:0;display:inline-block;padding:0 14px 0 0;color:#999;font-size:16px;letter-spacing:0;cursor:pointer;z-index:1;}
			.main .dailym2 .mv-area .btn-next:before {content:"";position:absolute;top:4px;right:0;display:inline-block;width:5px;height:8px;background:url("../../images/w/main/stationery.png") no-repeat 0 -10px;}
		</style>
		<script>
			$(document).ready(function(){
				if ( $(".swiper-container.swiperdailym2 .swiper-slide").length == 1 ){
					$(".swiper-button-prev-dailym2, .swiper-button-next-dailym2, .dailym2 .mv-area .btn-prev, .dailym2 .mv-area .btn-next").fadeOut(0);
					$(".swiperdailym2 .swiper-slide").addClass("swiper-slide-active");
					var mv = $(".swiperdailym2 .swiper-slide").eq(0).find("a").attr("data-mv");
					var ti = $(".swiperdailym2 .swiper-slide").eq(0).find("a").attr("data-ti");
					$(".main .dailym2 .mv-area .mv").html('<iframe width="820" height="462" src="'+mv+'" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>');
					$(".main .dailym2 .mv-area .ti").html(ti);
				}else if ( $(".swiper-container.swiperdailym2 .swiper-slide").length <= 5 ){
					$(".main .dailym2 .swiperdailym2").css({"height":"500px"});
					$(".main .dailym2 .swiperdailym2 .swiper-slide a").css({"cursor":"pointer"});
					var dailym2Swiper = new Swiper(".swiper-container.swiperdailym2", {
						slidesPerView: 'auto',
						loop: false,
						slidesOffsetBefore: 20,
						simulateTouch: false,
						direction: 'vertical',
						navigation: {
							nextEl: ".swiper-button-next-dailym2",
							prevEl: ".swiper-button-prev-dailym2",
						},
					});
					$(".swiper-slide").click(function(){
						var idx = $(this).index();
						var mv = $(".swiperdailym2 .swiper-slide").eq(idx).find("a").attr("data-mv");
						var ti = $(".swiperdailym2 .swiper-slide").eq(idx).find("a").attr("data-ti");
						$(".swiperdailym2 .swiper-slide").removeClass("swiper-slide-active");
						$(".swiperdailym2 .swiper-slide").eq(idx).addClass("swiper-slide-active");
						$(".main .dailym2 .mv-area .mv").html('<iframe width="820" height="462" src="'+mv+'" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>');
						$(".main .dailym2 .mv-area .ti").html(ti);
					});
					$(".swiper-slide").eq(0).click();
					$(".swiper-button-prev-dailym2, .swiper-button-next-dailym2, .dailym2 .mv-area .btn-prev, .dailym2 .mv-area .btn-next").fadeOut(0);
				}else{
					var dailym2Swiper = new Swiper(".swiper-container.swiperdailym2", {
						initialSlide: 1,
						slidesPerView: 'auto',
						slidesOffsetBefore: -35,
						simulateTouch: false,
						direction: 'vertical',
						centeredSlides: true,
						navigation: {
							nextEl: ".swiper-button-next-dailym2",
							prevEl: ".swiper-button-prev-dailym2",
						},
					});
					$(".swiper-slide").click(function(e){
						e.preventDefault();
						dailym2Swiper.slideTo($(this).index());
					});
					dailym2Swiper.on("slideChange", function(){
						var mv = $(".swiperdailym2 .swiper-slide").eq(dailym2Swiper.realIndex).find("a").attr("data-mv");
						var ti = $(".swiperdailym2 .swiper-slide").eq(dailym2Swiper.realIndex).find("a").attr("data-ti");
						$(".main .dailym2 .mv-area .mv").html('<iframe width="820" height="462" src="'+mv+'" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>');
						$(".main .dailym2 .mv-area .ti").html(ti);
					});
					$(".swiper-button-next-dailym2").click();
					$(".dailym2 .mv-area .btn-prev").click(function(){
						$(".swiper-button-prev-dailym2").click();
					});
					$(".dailym2 .mv-area .btn-next").click(function(){
						$(".swiper-button-next-dailym2").click();
					});
				}
			});
		</script>

		
		
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		
		<div class="review">
			<h2>#문구스타그램</h2>
			<div class="swiper-area" style="margin: 0px auto; width: 1520px; overflow: hidden;">
				<div class="swiper-container swiperchoice swiper-container-horizontal swiper-container-wp8-horizontal">
					<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-2280px, 0px, 0px);"><div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=49">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/21/2019011711594641561.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">데코마카로 손글씨 쓰기</strong>
											<span class="txt ellipsis">#데코마카</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000056">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000056/main/MG000000056_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">데코마카 463</strong>
															
															<span class="txt-price">
																
																<em>2,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=44">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/23/2019021114075134637.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">모나미펜으로 쓰는 감성 손글씨</strong>
											<span class="txt ellipsis">#불투명네임펜</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000110">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000110/main/MG000000110_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">불투명 네임펜 132</strong>
															
															<span class="txt-price">
																
																<em>1,500</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=74">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/24/2019021114132490192.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">플래너를 깔끔하게 정리하고 싶을 때</strong>
											<span class="txt ellipsis">#ESSENTI소프트형광펜 </span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000149">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000149/main/MG000000149_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">에센티 소프트</strong>
															
															<span class="txt-price">
																
																<em>700</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=40">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/25/2019011716121343018.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">손글씨 연습하기 좋은 펜</strong>
											<span class="txt ellipsis">#젤러펜
</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000174">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000174/main/MG000000174_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">젤러펜 502</strong>
															
															<span class="txt-price">
																
																<em>500</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=78&amp;level2Idx=30&amp;level3Idx=&amp;pageNo=1">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/78/2019021318530882106.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">내 소품에 나만의 감성을 입히고 싶을 땐? </strong>
											<span class="txt ellipsis">#패브릭마카</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000182">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000182/main/MG000000182_REP_THUMB_100X100_20190308131905.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">패브릭마카 470</strong>
															
															<span class="txt-price">
																
																<em>1,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-swiper-slide-index="5" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=86&amp;level2Idx=30&amp;level3Idx=">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/79/2019021318544439182.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">우리 아이의 팝아트 액자가 필요할 땐, 유성매직</strong>
											<span class="txt ellipsis">#유성매직</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000003502">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003502/main/MG000003502_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">유성매직</strong>
															
															<span class="txt-price">
																
																<em>800</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
						
						
							
								<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="0" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=49">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/21/2019011711594641561.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">데코마카로 손글씨 쓰기</strong>
											<span class="txt ellipsis">#데코마카</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000056">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000056/main/MG000000056_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">데코마카 463</strong>
															
															<span class="txt-price">
																
																<em>2,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide swiper-slide-next" data-swiper-slide-index="1" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=44">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/23/2019021114075134637.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">모나미펜으로 쓰는 감성 손글씨</strong>
											<span class="txt ellipsis">#불투명네임펜</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000110">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000110/main/MG000000110_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">불투명 네임펜 132</strong>
															
															<span class="txt-price">
																
																<em>1,500</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide" data-swiper-slide-index="2" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=74">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/24/2019021114132490192.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">플래너를 깔끔하게 정리하고 싶을 때</strong>
											<span class="txt ellipsis">#ESSENTI소프트형광펜 </span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000149">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000149/main/MG000000149_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">에센티 소프트</strong>
															
															<span class="txt-price">
																
																<em>700</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide" data-swiper-slide-index="3" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=40">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/25/2019011716121343018.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">손글씨 연습하기 좋은 펜</strong>
											<span class="txt ellipsis">#젤러펜
</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000174">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000174/main/MG000000174_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">젤러펜 502</strong>
															
															<span class="txt-price">
																
																<em>500</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide" data-swiper-slide-index="4" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=78&amp;level2Idx=30&amp;level3Idx=&amp;pageNo=1">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/78/2019021318530882106.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">내 소품에 나만의 감성을 입히고 싶을 땐? </strong>
											<span class="txt ellipsis">#패브릭마카</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000182">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000182/main/MG000000182_REP_THUMB_100X100_20190308131905.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">패브릭마카 470</strong>
															
															<span class="txt-price">
																
																<em>1,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="5" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=86&amp;level2Idx=30&amp;level3Idx=">
										
										
									
										<div class="pic" style="height: 350px;"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/79/2019021318544439182.jpg" alt="" class="swiper-lazy swiper-lazy-loaded"></div>
										<div class="info">
											<strong class="ti">우리 아이의 팝아트 액자가 필요할 땐, 유성매직</strong>
											<span class="txt ellipsis">#유성매직</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000003502">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003502/main/MG000003502_REP_THUMB_100X100.blob" alt="" class="swiper-lazy swiper-lazy-loaded"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">유성매직</strong>
															
															<span class="txt-price">
																
																<em>800</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
					<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=49">
										
										
									
										<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/21/2019011711594641561.jpg" alt="" class="swiper-lazy"></div>
										<div class="info">
											<strong class="ti">데코마카로 손글씨 쓰기</strong>
											<span class="txt ellipsis">#데코마카</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000056">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000056/main/MG000000056_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">데코마카 463</strong>
															
															<span class="txt-price">
																
																<em>2,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=44">
										
										
									
										<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/23/2019021114075134637.jpg" alt="" class="swiper-lazy"></div>
										<div class="info">
											<strong class="ti">모나미펜으로 쓰는 감성 손글씨</strong>
											<span class="txt ellipsis">#불투명네임펜</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000110">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000110/main/MG000000110_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">불투명 네임펜 132</strong>
															
															<span class="txt-price">
																
																<em>1,500</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=74">
										
										
									
										<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/24/2019021114132490192.jpg" alt="" class="swiper-lazy"></div>
										<div class="info">
											<strong class="ti">플래너를 깔끔하게 정리하고 싶을 때</strong>
											<span class="txt ellipsis">#ESSENTI소프트형광펜 </span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000149">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000149/main/MG000000149_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">에센티 소프트</strong>
															
															<span class="txt-price">
																
																<em>700</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=40">
										
										
									
										<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/25/2019011716121343018.jpg" alt="" class="swiper-lazy"></div>
										<div class="info">
											<strong class="ti">손글씨 연습하기 좋은 펜</strong>
											<span class="txt ellipsis">#젤러펜
</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000174">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000174/main/MG000000174_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">젤러펜 502</strong>
															
															<span class="txt-price">
																
																<em>500</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=78&amp;level2Idx=30&amp;level3Idx=&amp;pageNo=1">
										
										
									
										<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/78/2019021318530882106.jpg" alt="" class="swiper-lazy"></div>
										<div class="info">
											<strong class="ti">내 소품에 나만의 감성을 입히고 싶을 땐? </strong>
											<span class="txt ellipsis">#패브릭마카</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000182">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000182/main/MG000000182_REP_THUMB_100X100_20190308131905.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">패브릭마카 470</strong>
															
															<span class="txt-price">
																
																<em>1,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="width: 380px; padding: 0px 15px;">
									
										
											<a href="/w/storypick/storypickView.do?storyIdx=86&amp;level2Idx=30&amp;level3Idx=">
										
										
									
										<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/mainreview/review/79/2019021318544439182.jpg" alt="" class="swiper-lazy"></div>
										<div class="info">
											<strong class="ti">우리 아이의 팝아트 액자가 필요할 땐, 유성매직</strong>
											<span class="txt ellipsis">#유성매직</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000003502">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003502/main/MG000003502_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">유성매직</strong>
															
															<span class="txt-price">
																
																<em>800</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div></div>
				</div>
			</div>
			<div class="btn-area" style="width: 1620px;">
				<div class="swiper-pagination-choice swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
				<div class="swiper-button-next-choice"></div>
				<div class="swiper-button-prev-choice"></div>
			</div>
		</div>
		
		
		
		
		
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		
		<div class="story-pick">
			
			
			
			
			
			
				<h2>Storypick</h2>
			
			
			
			
			
			
			
			
			
			
			<div class="swiper-area" style="opacity: 1; margin: 0px auto; width: 1520px; overflow: hidden;">
				<div class="swiper-container swiperstorypick" style="margin-left: -1320px;">
					<div class="swiper-wrapper">
						
						
							
								<div class="swiper-slide">
									
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=16">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/16/2019011114241750274.jpg" alt="" class="swiper-lazy"></div>
												
											
										
										
									
										<div class="info">
											<span class="tag">[Inside the case] </span>
											<strong class="ti">나에게 필기구란 ‘일상’이다</strong>
											<span class="txt ellipsis">문구회사에서 일하는 A씨에게 필기구란
'일상'이다</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000015">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000015/main/MG000000015_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">153 블랙&amp;화이트</strong>
															
															<span class="txt-price">
																
																<em>18,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide">
									
										
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=27">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/27/2019011410274621495.jpg" alt="" class="swiper-lazy"></div>
												
											
										
									
										<div class="info">
											<span class="tag">[Inside the case] </span>
											<strong class="ti">나에게 필기구란 ‘친구’다</strong>
											<span class="txt ellipsis">수험생 수현씨에게 필기구란
'친구'이다</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000021">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000021/main/MG000000021_REP_THUMB_100X100_20190308115635.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">153 카툰 </strong>
															
															<span class="txt-price">
																
																<em>500</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide">
									
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=7">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/7/2019010917222394147.jpg" alt="" class="swiper-lazy"></div>
												
											
										
										
									
										<div class="info">
											<span class="tag">[M storyteller] 모나미가 걸어온 길</span>
											<strong class="ti">153 Brand Story 첫번째 이야기</strong>
											<span class="txt ellipsis">1963년 우리나라 최초의 유성 볼펜153 볼펜을 탄생시킨 모나미가 걸어온 길</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000001">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000001/main/MG000000001_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">BP 153 0.7mm</strong>
															
															<span class="txt-price">
																
																<em>300</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide">
									
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=28">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/28/2019011410391180399.jpg" alt="" class="swiper-lazy"></div>
												
											
										
										
									
										<div class="info">
											<span class="tag">[Inside the case] </span>
											<strong class="ti">나에게 필기구란 ‘소통의 수단 ’ 이다</strong>
											<span class="txt ellipsis">사춘기 아이와 친해질 수 있게 만들어 준  
‘소통의 수단 ’ 이다</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000012">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000012/main/MG000000012_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">153 리스펙트</strong>
															
															<span class="txt-price">
																
																<em>35,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide">
									
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=96">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/96/2019012911523101461.jpg" alt="" class="swiper-lazy"></div>
												
											
										
										
									
										<div class="info">
											<span class="tag">[필기의 신]</span>
											<strong class="ti">감성을 더하고 싶을 때, 프러스펜</strong>
											<span class="txt ellipsis">필기구의 진짜 매력은 내 손에 길들여진 후부터 시작된다 </span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000185">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000185/main/MG000000185_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">프러스펜 3000 세트</strong>
															
															<span class="txt-price">
																
																<em>7,200</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide swiper-slide-active">
									
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=97">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/97/2019012912044401304.jpg" alt="" class="swiper-lazy"></div>
												
											
										
										
									
										<div class="info">
											<span class="tag">[필기의 신]</span>
											<strong class="ti">포인트를 주고 싶을 때, 형광펜</strong>
											<span class="txt ellipsis">필기에도 강, 약이 필요하다!</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000151">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000151/main/MG000000151_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">에센티스틱 브라이트 고체타입</strong>
															
															<span class="txt-price">
																
																<em>700</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide">
									
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=85">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/85/2019012515483537212.jpg" alt="" class="swiper-lazy"></div>
												
											
										
										
									
										<div class="info">
											<span class="tag">[이럴 땐 이런 마카]</span>
											<strong class="ti">나만의 귀여운 장식이 필요할 땐, 데코마카!</strong>
											<span class="txt ellipsis">데코마카, 어떻게 사용할지 모르시겠다구요? 모나미에서 알려드립니다!</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000054">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000054/main/MG000000054_REP_THUMB_100X100.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">데코마카 460</strong>
															
															<span class="txt-price">
																
																<em>2,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
							
								<div class="swiper-slide swiper-slide-active">
									
										
											
												
												
													<a href="/w/storypick/storypickView.do?storyIdx=88">
														<div class="pic"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/88/2019012517191508690.jpg" alt="" class="swiper-lazy"></div>
												
											
										
										
									
										<div class="info">
											<span class="tag">[필기의 신]</span>
											<strong class="ti">암기가 필요할 땐 파란색으로 쓰세요</strong>
											<span class="txt ellipsis">법학과 학생 서현씨만의 암기 노하우</span>
										</div>
									</a>
									<div class="product-list">
										<ul>
											
												<li>
													<a href="/w/product/productDetail.do?goodsNo=MG000000162">
														<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000162/main/MG000000162_REP_THUMB_100X100_20190308115939.blob" alt="" class="swiper-lazy"></span>
														<span class="info">
															
																<span class="txt-brand"></span>
															
															
																<strong class="txt-ti ellipsis">올리카(OLIKA) EF</strong>
															
															<span class="txt-price">
																
																<em>3,000</em>원
															</span>
														</span>
													</a>
												</li>
											
										</ul>
									</div>
								</div>
								
							
						
					</div>
				</div>
			</div>
			<div class="btn-area" style="width: 1620px;">
				<div class="swiper-button-next-storypick" style="opacity: 0.2;"></div>
				<div class="swiper-button-prev-storypick" style="opacity: 0.5;"></div>
			</div>
		</div>
		
	</main>

	<!-- 동영상// -->
	<div id="popHomeMv" class="popup popdetailmv">
		<div class="popinner">
			<header class="header">
				<h2 class="tit"></h2>

				<button type="button" class="btn-close">닫기</button>
			</header>

			<div class="contents">
				<div class="mv"></div>
			</div>
		</div>
	</div>
	<!-- //동영상 -->


<div id="btnTop">
	<a href="#TOP">TOP</a>
</div>

<jsp:include page="/monnami/monnamiBottom.jsp"/>
</body>
</html>