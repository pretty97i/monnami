<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>모나미 공식 쇼핑몰 모나미몰</title>

<meta charset="UTF-8" />
<meta http-equiv="p3p" content='CP="ALL CURa ADMa DEVa TAIa OUR BUS IND PHY ONL UNI PUR FIN COM NAV INT DEM CNT STA POL HEA PRE LOC OTC" '>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="format-detection" content="telephone=no, email=no, address=no">
<meta name="keywords" content="" />
<meta name="description" content="문구, 모나미펫, 크래프트&하비, 모나르떼를 통합한 라이프스타일 편집샵" />

<jsp:include page="/monnami/content/monnamiTop.jsp"/>




<meta name="decorator" content="default.main" />
<meta name="bodycss" content="storypick"/>
<meta name="divcss" content="main"/>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<body class="storypick">	
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

<!-- 메인 -->
<main id="contents">

<!-- 수정시작 -->
<div class="visual">
	<div class="inner">
		<div class="innerfull">
			<div class="swiper-container swipervisual swiper-container-horizontal swiper-container-wp8-horizontal">
				<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-2480px, 0px, 0px);"><div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" style="margin-right: 40px;">
					<a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp">
					<img src="/study/monnami/images/storypick/main.jpg" alt="" class="swiper-lazy swiper-lazy-loaded">
					</a>
					
					<div class="info "><a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp">
						<small>M storyteller - 모나미의 6대 대표 제품</small>
						<strong>6 SIGNATURES 과거와 현재를 잇다</strong>
						</a><a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp" class="btn-view">view</a>
					</div>				
				</div>
				
					<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp">
						<img src="/study/monnami/images/storypick/storyPickList6_5.jpg" alt="" class="swiper-lazy swiper-lazy-loaded">
						</a>					
						<div class="info "><a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp">
							<small>[#ISSUE-tag] Keyword #Fisher</small>
							<strong>펜, 필기구 그 이상의 가치, FisherMan </strong>
							</a><a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp" class="btn-view">view</a>
						</div>
				</div>
				
					<div class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-swiper-slide-index="2" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp">
						<img src="/study/monnami/images/storypick/storyPickList8.jpg" alt="" class="swiper-lazy swiper-lazy-loaded">
						</a>
						<div class="info black"><a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp">
							<small>[UPCYCLING DIY]</small>
							<strong>나에게 필기구란 '소통의 수단'이다</strong>
							</a><a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp" class="btn-view">view</a>
						</div>
					</div>
							
					<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="0" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp">
						<img src="/study/monnami/images/storypick/main.jpg" alt="" class="swiper-lazy swiper-lazy-loaded loading" data-was-processed="true">
						</a>
					
						<div class="info "><a href="//study/monnami/storyPick/storyPick_05_pastNow.jsp">
							<small>M storyteller - 모나미의 6대 대표 제품</small>
							<strong>6 SIGNATURES 과거와 현재를 잇다</strong>
							</a><a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp" class="btn-view">view</a>
						</div>
					</div>
							
					<div class="swiper-slide swiper-slide-next" data-swiper-slide-index="1" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp">
						<img src="/study/monnami/images/storypick/storyPickList6_5.jpg" alt="" class="swiper-lazy swiper-lazy-loaded loading" data-was-processed="true">
						</a>
						<div class="info ">
						<a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp">
							<small>[#ISSUE-tag] Keyword #Fisher</small>
							<strong>펜, 필기구 그 이상의 가치, FisherMan </strong>
							</a><a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp" class="btn-view">view</a>
						</div>
					</div>
							
					<div class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="2" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp">
							<img src="/study/monnami/images/storypick/storyPickList8.jpg" alt="" class="swiper-lazy swiper-lazy-loaded">
						</a>
							<div class="info black"><a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp">
								<small>[UPCYCLING DIY]</small>
								<strong>나에게 필기구란 '소통의 수단'이다</strong>
								</a><a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp" class="btn-view">view</a>
							</div>
					</div>
								
					<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp">
							<img src="/study/monnami/images/storypick/main.jpg" alt="" class="swiper-lazy">
							</a>
							<div class="info "><a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp">
								<small>M storyteller - 모나미의 6대 대표 제품</small>
								<strong>6 SIGNATURES 과거와 현재를 잇다</strong>
								</a><a href="/study/monnami/storyPick/storyPick_05_pastNow.jsp" class="btn-view">view</a>
							</div>
					</div>
					
					<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp">
							<img src="/study/monnami/images/storypick/storyPickList6_5.jpg" alt="" class="swiper-lazy">
							</a>
							<div class="info "><a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp">
								<small>[#ISSUE-tag] Keyword #Fisher</small>
								<strong>펜, 필기구 그 이상의 가치, FisherMan </strong>
								</a><a href="/study/monnami/storyPick/storyPick_06_fisherMan.jsp" class="btn-view">view</a>
							</div>
					</div>
					
					<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="margin-right: 40px;">
						<a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp">
						<img src="/study/monnami/images/storypick/storyPickList8.jpg" alt="" class="swiper-lazy">
						</a>
						<div class="info black"><a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp">
							<small>[Inside the case]</small>
							<strong>나에게 필기구란 '소통의 수단'이다</strong>
							</a><a href="/study/monnami/storyPick/storyPick_08_penIsCommunication.jsp" class="btn-view">view</a>
						</div>
					</div>
					
				</div>
			</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		</div>
	</div>
</div>


<!-- 수정끝 -->

		<div class="search">
			<div class="inner">
				<h2 class="hide">Story Pick Search</h2>

					<div class="search-result" id="storyMainSearchResult">

						<div class="search-result" id="storyMainSearchResult">
							<h3>All Story</h3>
							
							<ul class="product-list">
								<li><a href="/study/monnami/storyPick/storyPick_01_noteTip.jsp">
									<span class="thumb-img">
										<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/201/2019021209134334523.jpg"alt="" onerror="this.src='/w/images/285x285.jpg'">
									</span>
									<span class="info"> <span class="txt-brand">[랜선집들이]</span>
									<strong class="txt-ti ellipsis">손재주 부리기</strong>
									</span>
									</a>
								</li>

								<li><a href="/study/monnami/storyPick/storyPick_02_pointPen.jsp">
									<span class="thumb-img"> <img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/200/2019021209054358952.jpg" alt="" onerror="this.src='/w/images/285x285.jpg'">
									</span> 
									<span class="info"> <span class="txt-brand">[랜선집들이]</span>
										<strong class="txt-ti ellipsis">감성 넘치는 캘리그라피 </strong>
									</span>
									</a>
								</li>


								<li><a href="/study/monnami/storyPick/storyPick_03_plusPen.jsp">
									<span class="thumb-img"> <img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/198/2019021208351394871.jpg" alt="" onerror="this.src='/w/images/285x285.jpg'">
									</span> 
									<span class="info"> <span class="txt-brand">[랜선집들이]</span>
											<strong class="txt-ti ellipsis">내 마음대로 컬러링</strong>
									</span>
									</a>
								</li>



								<li><a href="/study/monnami/storyPick/storyPick_04_bluePen.jsp">
									<span class="thumb-img"> <img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/195/2019021208202342271.jpg" alt="" onerror="this.src='/w/images/285x285.jpg'">
									</span> 
									<span class="info"> <span class="txt-brand">[랜선집들이]</span>
										<strong class="txt-ti ellipsis">피곤한데 잠은 오지 않는 밤</strong>
									</span>
									</a>
								</li>
							</ul>



						</div>

				</div>
		</form>
	</div>
</div>

<div class="inner newstory">
	<h2>New Story</h2>
		<div class="swiper-container swipenewstory">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="/w/storypick/storypickView.do?storyIdx=84">
					<img class="pic" src="/study/monnami/images/storypick/Refrigerator.jpg" alt="">
						<div class="info">
							<small>이럴 땐 이런 마카!</small>
							<strong>어지러운 냉장고 정리</strong>
							<p>향횰이님이 전하는 ‘모나미와 함께하는 냉동실 정리법’ </p>
						</div>
					</a>
				</div>
								
						
				<div class="swiper-slide">
					<a href="/w/storypick/storypickView.do?storyIdx=94">
					<img class="pic" src="/study/monnami/images/storypick/book.jpg" alt="">
						<div class="info">
							<small>[랜선집들이]</small>
							<strong>기억을 머무르게 하는 책갈피</strong>
							<p>좋아하는 글귀를 적었더니 마음이 몽글몽글</p>
						</div>
					</a>
				</div>
			</div>
			
			<ul class="newstorytitle">
				<li>01<strong>. 어지러운 냉장고 정리</strong></li>
				<li>02<strong>. 기억을 머무르게 하는 책갈피</strong></li>
			</ul>
			<div class="swiper-pagination-newstory"></div>
		</div>
</div>
	
		
<div class="inner hobbyarea">
	<div class="innerfull">
		<h2>Hobby</h2>
		<img class="pic" src="/study/monnami/images/storypick/room.jpg" alt="">
			<div class="info">
				<small>2019 march</small>
				<strong>다양한 사람들의 공간</strong>
				<p>소중한 시간을 내어 취미 활동을 해보세요. 작지만 소중한, 특별한 소품이 탄생할 거예요. 오롯이 집중할 수 있는 나만의 시간을 가져보는 것도 좋아요. </p>
			</div>
	</div>
		<ul class="product-list">
			<li>
				<a href="/w/storypick/storypickView.do?storyIdx=93">
				<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/93/2019012818400811618.jpg" alt=""></span>
				<span class="info">
				<span class="txt-brand">[랜선집들이]</span>
					<strong class="txt-ti">커피 한 잔과 함께 하는 드로잉</strong>
				<span class="txt-info ellipsis">나만의 캘린더</span>
				</span>
			</a>
			</li>
				
			<li>
				<a href="/w/storypick/storypickView.do?storyIdx=94">
				<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/94/2019012818493032292.jpg" alt=""></span>
				<span class="info">
				<span class="txt-brand">[랜선집들이]</span>
					<strong class="txt-ti">기억을 머무르게 하는 책갈피</strong>
				<span class="txt-info ellipsis">좋아하는 글귀를 적었더니 마음이 몽글몽글</span>
				</span>
			</a>
			</li>
			<li>
				<a href="/w/storypick/storypickView.do?storyIdx=91">
				<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/91/2019020814125269976.jpg" alt=""></span>
				<span class="info">
				<span class="txt-brand">[랜선집들이]</span>
					<strong class="txt-ti">아무 생각을 말고 </strong>
				<span class="txt-info ellipsis">색 조합에 집중해보니</span>
				</span>
			</a>
			</li>
				
			<li>
				<a href="/w/storypick/storypickView.do?storyIdx=70">
				<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/70/2019012310172942982.jpg" alt=""></span>
				<span class="info">
				<span class="txt-brand">[랜선집들이]</span>
					<strong class="txt-ti">마음을 담은 선물</strong>
				<span class="txt-info ellipsis">선물 포장하기</span>
				</span>
			</a>
			</li>
		</ul>
	</div>
		
	<div class="inner happystory">
		<h2><small>ㅡ</small>Storypick</h2>
			<ul>
				<li>
					<a href="/w/storypick/storypickView.do?storyIdx=122">
					<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypickmain/sostory/45/2019021214101991494.jpg" alt="">
					<span >젖은 표면에 글씨를 쓰고 싶을 때</span>
					</a>
				</li>
				
				<li>
					<a href="/w/storypick/storypickView.do?storyIdx=88">
					<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypickmain/sostory/45/2019021216574186559.jpg" alt="">
					<span >법학과 학생 서현씨만의 암기 노하우</span>
					</a>
				</li>
			</ul>
	</div>
		
</main>

<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html>