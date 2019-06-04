<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>MonnamiMall</title>
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

<!-- <link rel="canonical" href="https://www.monamimall.com/w/main.do"/> -->

<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/lib/normalize.min.css" />
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/lib/jquery-ui.min.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/lib/jquery.scrollbar.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/lib/swiper.min.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/common.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/main.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/products.css" /> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/css/w/contents.css" /> --%>

<script src="<%=cp %>/monnami/js/jquery-3.3.1.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery-ui.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery.scrollbar.min.js"></script>
<script src="<%=cp %>/monnami/js/imagesloaded.pkgd.min.js"></script>
<script src="<%=cp %>/monnami/js/lazyload.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery.countdown.js"></script>
<script src="<%=cp %>/monnami/js/swiper.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery.ez-plus.js"></script>
<script src="<%=cp %>/monnami/js/function.js"></script>
<%-- <script src="<%=cp %>/monnami/js/monamimall.js"></script> --%>

<script src="<%=cp %>/monnami/js/commonScript.js"></script>
<script src="<%=cp %>/monnami/js/cart.js"></script>

<!-- 네이버유입스크립트 -->
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<!-- <script type="text/javascript"> 
	var currentUrl = window.location.href;
	if(!currentUrl.match("/order/orderComplete.do")){
		if(currentUrl.match("/member/joinComplete.do") || currentUrl.match("/member/joinSsoComplete.do")){
			var _nasa={};
			_nasa["cnv"] = wcs.cnv("2","0"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
		}else{
			var _nasa={};
			_nasa["cnv"] = wcs.cnv("5","0"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
		}
	}
</script> -->


<meta name="decorator" content="default.main" />
<meta name="bodycss" content="home"/>
<meta name="divcss" content="main"/>
</head>
<body class="home">	
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
		wcs.inflow("monnamimall.com");
		wcs_do(_nasa);
	</script>
<div class="skip">
	 <a href="#contents">본문으로 건너뛰기</a>
</div>

<hr>

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

<jsp:include page="/monnami/content/monnamiTop.jsp" />

	<main id="contents">
		
		<section class="inner visual">
			<div class="innerfull">
				<div class="swiper-container swipervisual">
					<div class="swiper-wrapper">
						 <div class="swiper-slide">
							<img src="<%=cp%>/monnami/images/main/maintop.jpg" alt="">
						 </div>
					</div>
				</div>
			</div>

			<div class="slide-txt slide-txt0">
				<img src="<%=cp%>/monnami/images/main/201903.png" class="txt-date"><br>
				<img src="<%=cp%>/monnami/images/main/stationery.png" class="txt-ti"><br>
			</div>
	
		</section>

		<section class="inner storypick-area">
			
				
					<h2>Story Pick</h2>

			<div class="tab-menu">

				<a href="#30" class="active">Stationery</a>
				
			</div>
			
			<div id="30" class="tab-contents on">
				<div class="pick-ti">	
						
					<small>march, 2019</small>
					<h3>따뜻한 봄날</br>나만을 위한 시간</h3>

				</div>
				<div class="pick-ls">

					<a href="/w/storypick/storypickView.do?storyIdx=78">				
									
						<span class="pic"><img src="<%=cp%>/monnami/images/main/maka.jpg" alt=""></span>			
						<small class="txt-tag">[이럴 땐 이런 마카]</small>
						<strong class="txt-ti">내 소품에 나만의 감성을 입히고 싶을 땐? 패브릭마카</strong>
						<span class="txt-info ellipsis">패브릭마카로 감성을 담다</span>
						
					</a>

					<a href="/w/storypick/storypickView.do?storyIdx=72">
								
						<span class="pic"><img src="<%=cp%>/monnami/images/main/fisherman.jpg" alt=""></span>	
						<small class="txt-tag">[M storyteller]</small>
						<strong class="txt-ti">펜, 필기구 그 이상의 가치, Fisherman</strong>
						<span class="txt-info ellipsis">153 Fisherman은 그물로 물고기를 잡는 어부의 모습과 성당의 스테인드글라스에서 영감을 받아  디자인된 펜입니다.</span>
					</a>
							
					<a href="/w/storypick/storypickView.do?storyIdx=97">
								
						<span class="pic"><img src="<%=cp%>/monnami/images/main/pengod.jpg" alt=""></span>	
						<small class="txt-tag">[필기의 신]</small>
						<strong class="txt-ti">포인트를 주고 싶을 때, 형광펜</strong>
						<span class="txt-info ellipsis">필기에도 강, 약이 필요하다!</span>
					</a>

					<a href="/w/storypick/storypickView.do?storyIdx=16">
								
						<span class="pic"><img src="<%=cp%>/monnami/images/main/insidethecase.jpg" alt=""></span>	
						<small class="txt-tag">[Inside the case] </small>
						<strong class="txt-ti">나에게 필기구란 ‘일상’이다</strong>
						<span class="txt-info ellipsis">문구회사에서 일하는 A씨의 필기구</span>
					</a>

				</div>
			</div>

		</section>

		<div class="inner cont-area">
			<div class="innerfull">
				<h2>
					<img src="<%=cp%>/monnami/images/main/stationery.jpg" alt="">
					<span class="txt-ti">
						격이 다른 기본 
						<strong>Stationery</strong>
					</span>

				</h2>
			</div>
			
			<div class="cont-list">
				<div class="list list1">
					<ul>
						<li>
							<a href="/w/storypick/storypickView.do?storyIdx=28">
								<span class="pic"><img src="<%=cp%>/monnami/images/main/monami153.jpg" alt=""/></span>
								<strong>나에게 필기구란 '소통의수단'이다</strong>
								<span>모나미란 사춘기 아이와 친해질 수 있게 만들어 준  ‘소통의 수단 ’ </span>
							</a>

							<span class="tag">
								
									<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#프러스펜S');">#프러스펜S</a>
									<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#153리스펙트');">#153리스펙트</a>								
									<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#모나미153플라워');">#모나미153플라워</a>								
									<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#올리카EF');">#올리카EF</a>
								
							</span>
							
						</li>

						<li>

							<a href="/w/storypick/storypickView.do?storyIdx=25">
								<span class="pic"><img src="<%=cp%>/monnami/images/main/fashion.jpg" alt=""/></span>
								<strong>나에게 필기구란 ‘fashion’이다</strong>
								<span>소문난 패셔니스타 jk9씨의 필통</span>
							</a>

								<span class="tag">
									
										<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#153DIY');">#153DIY</a>											
										<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#DIY');">#DIY</a>											
										<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#모나미DIY');">#모나미DIY</a>
									
								</span>
							
						</li>
								
					</ul>
				</div>
				
				<div class="list list2">
					<ul>
						<li>
							<a href="/w/storypick/storypickView.do?storyIdx=7">
								<span class="pic"><img src="<%=cp%>/monnami/images/main/brand story.jpg" alt=""/></span>
								<strong>153 Brand Story 첫번째 이야기</strong>
								<span>대한민국 필기구의 역사, 모나미가 걸어온 길<br/></span>
							</a>
						</li>

						<li>
							<a href="/w/storypick/storypickView.do?storyIdx=10">
								<span class="pic"><img src="<%=cp%>/monnami/images/main/brand story2.jpg" alt=""/></span>
								<strong>153 Brand Story 두번째 이야기</strong>
								<span>대한민국 필기구의 역사, 모나미가 걸어온 길</span>
							</a>
						</li>

						<li>
							<a href="/w/storypick/storypickView.do?storyIdx=27">
								<span class="pic"><img src="<%=cp%>/monnami/images/main/freind.jpg" alt=""/></span>
								<strong>나에게 필기구란 ‘친구’다</strong>
								<span>자연스럽게 문구 덕후의 길을 걷게 된 학생</span>
							</a>
						</li>

						<li>
							<a href="/w/storypick/storypickView.do?storyIdx=189">
								<span class="pic"><img src="<%=cp%>/monnami/images/main/tip.jpg" alt=""/></span>
								<strong>수험생이 전하는 필기TIP</strong>
								<span>나만의 필기법으로 암기 효율 UP! </span>
							</a>
						</li>

					</ul>
				</div>
				<div class="list list3">
					<ul>
						<li>
							<a href="/w/storypick/storypickView.do?storyIdx=79">
								<span class="pic"><img src="<%=cp%>/monnami/images/main/signatures.jpg" alt=""/></span>
								<strong>6 SIGNATURES 과거와 현재를 잇다</strong>
								<span>Since 1963 과거와 현재</span>
							</a>
						
							<span class="tag">
								
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#모나미153');">#모나미153</a>									
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#프러스펜');">#프러스펜</a>	
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#네임펜');">#네임펜</a>
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#모나미네임펜');">#모나미네임펜</a>		
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#보드마카');">#보드마카</a>
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#유성매직');">#유성매직</a>
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#불투명네임펜132');">#불투명네임펜132</a>
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('#생잉크');">#생잉크</a>
								<a href="javascript:void(0);" class="lk-tag" onclick="goTopSearch('유성매직');">유성매직</a>
								
							</span>
							
						</li>	
					</ul>
				</div>
			</div>
		</div>
		
	</main>
	
	<div id="popHomeMv" class="popup popdetailmv" style="display: none;">
		<div class="popinner" style="opacity: 1; top: 65.7px;">
			<header class="header">
				<h2 class="tit"></h2>

				<button type="button" class="btn-close">닫기</button>
			</header>

			<div class="contents">
				<div class="mv"><iframe width="736" height="415" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen=""></iframe></div>
			</div>
		</div>
	</div>
<hr/>
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

<jsp:include page="monnamiBottom.jsp" />

<script type="text/javascript">

	var ezwelheight = 0;


	//우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('popAddr');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function execDaumPostcode(callback) {
		new daum.Postcode({
			oncomplete: function(data) {
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = data.address; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수
	
				// 기본 주소가 도로명 타입일때 조합한다.
				if(data.addressType === 'R'){
					//법정동명이 있을 경우 추가한다.
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}
	
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
				
	            // 콜백 함수 
				callback(data.zonecode, fullAddr);
			},
			width : '100%',
			height : '100%',
			maxSuggestItems : 5
		}).embed(element_layer);
	
		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';
	
		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition(){
		var width = 500; //우편번호서비스가 들어갈 element의 width
		var height = 460; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 1; //샘플에서 사용하는 border의 두께
	
		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		if (ezwelheight > 0) {
			element_layer.style.top = '300px';			
		} else {
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		}
	}

	
	function getSessionId(){
		if(localStorage.getItem("monamiSessionId") == null){
			localStorage.setItem("monamiSessionId","7CC87FB60E2F945FBA59E652F7333288");
		}
	
		return localStorage.getItem("monamiSessionId");
	}
	
	
	function deliveryTracking(trackingUrl, invoiceNo){
		if($.trim(trackingUrl) == ""){
			alert("배송추적 URL이 없습니다. 관리자에게 문의하세요.");
			return false;
		}
		
		if($.trim(invoiceNo) == ""){
			alert("송장번호를 확인하세요!");
			return false;
		}
		
		var url = trackingUrl.replace("__INVOICENO__", invoiceNo);
		
		var openNewWindow = window.open("about:blank");
		
		openNewWindow.location.href = url;
	}

</script>

<!-- 이지웰 이중스크롤방지 -->
<!-- 유입경로 호출 -->
<script type="text/javascript">
	var srcPathUrl = window.location.search.substring(1);
	
	if(srcPathUrl != ""){
		$.ajax({
			 url: "/w/ajax/srcPathAjax.do",
			 data : {
				 			"srcPathUrl"	:	srcPathUrl
				 		},
			 type: "GET",	
			 async: false,
			 cache: false,
			 contentType: "application/x-www-form-urlencoded; charset=UTF-8"  
		}); 
		
	}
</script>

<!-- 네이버 로그분석 스크립트 -->
<!-- <script type="text/javascript"> 
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_22b1f65c4041";
	if (!_nasa) var _nasa={};
	wcs.inflow();
	wcs_do(_nasa);
</script> --></div>
</body>
</html>