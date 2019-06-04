<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>MonamiMall(JOINSTEP01)</title>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/main.css" />
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/product.css" />
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/common.css" />
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/contents.css" />

<jsp:include page="../monnamiTop.jsp" /><!-- 상단 설화꺼 불러오기-->

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

<link rel="canonical" href="https://www.monamimall.com/w/main.do"/>

<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/normalize.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/jquery.scrollbar.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/swiper.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/common.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/products.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/monnami/js/contents.css" />

<script src="<%=cp %>/monnami/js/jquery-3.3.1.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery-ui.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery.scrollbar.min.js"></script>
<script src="<%=cp %>/monnami/js/imagesloaded.pkgd.min.js"></script>
<script src="<%=cp %>/monnami/js/lazyload.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery.countdown.js"></script>
<script src="<%=cp %>/monnami/js/swiper.min.js"></script>
<script src="<%=cp %>/monnami/js/jquery.ez-plus.js"></script>
<script src="<%=cp %>/monnami/js/function.js"></script>
<script src="<%=cp %>/monnami/js/monamimall.js"></script>

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


<meta name="decorator" content="default.main"/>
<meta name="bodycss" content="home"/>
<meta name="divcss" content="sub"/>
<script>

	// 약관 확인
	function termsCheck(){
		var serviceUse = $("input:checkbox[id='serviceUse']").is(":checked");
		var privacyCollection = $("input:checkbox[id='privacyCollection']").is(":checked"); 
		var privacyUsage = $("input:checkbox[id='privacyUsage']").is(":checked");
		
		if(!serviceUse){
            alert("서비스 이용약관에 동의해 주세요");
            return false;
        }
		
        if(!privacyCollection) {
            alert("개인정보수집/이용동의에 동의해 주세요.");
            return false;
        }
        
        if(!privacyUsage) {
            alert("개인정보취급/위탁동의에 동의해 주세요.");
            return false;
        }
        
        var frm = document.joinStep02Form;
        frm.action = "/study/monnami/member/joinStep02.jsp";
        frm.submit();
	}
	
	// 전체 동의
	function allAgreeCheck(){
	    if( $("#allAgree").is(':checked') ){
	      $("input[type=checkbox]").prop("checked",true);
	    }else{
	      $("input[type=checkbox]").prop("checked",false);
	    }
	}
	
</script>
</head>
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

<header id="header">
	<a href="#" class="btn-allmenu"><span class="menu-trigger"><span></span><span></span><span></span><small class="hide">메뉴</small></span></a>
	<div class="allmenu">
		<div class="inner">
			<div class="cont scrollbar-macosx">
				<ul>
					<li class="stationery">
						<a href="/w/stationeryMain.do"><span>Stationery</span></a>
						<div class="subnav">
							<ul>
								<li>
										<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221"><span>기록의 시작</span></a>
										<ul>
											<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=222"><span>필기용</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=223"><span>메모용</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=224"><span>글자강조(Highlighting)</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=485"><span>고급필기류</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=487"><span>리필</span></a></li>
												</ul>	
									</li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225"><span>취미의 발견</span></a>
										<ul>
											<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=226"><span>인테리어/소품 꾸미기</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=228"><span>패브릭 꾸미기</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=230"><span>다이어리 꾸미기</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=231"><span>그림그리기</span></a></li>
												<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=229"><span>기타</span></a></li>
												</ul>	
									</li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=232"><span>상상과 표현</span></a>
										<ul>
											<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=232&schCateIdx3=233"><span>유아~어린이</span></a></li>
												</ul>	
									</li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=234"><span>프로들의 도구</span></a>
										<ul>
											<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=234&schCateIdx3=235"><span>산업용</span></a></li>
												</ul>	
									</li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=463"><span>생활 속 문구 </span></a>
										<ul>
											<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=463&schCateIdx3=465"><span>디자인 문구</span></a></li>
												</ul>	
									</li>							
								</ul>
						</div>
					</li>

					<li class="hobby">
						<a href="/w/hobbyMain.do"><span>Craft&Hobby</span></a>
						<div class="subnav">
							<ul>
								<li>
										<a href="/w/product/productList.do?schCateIdx1=241&schCateIdx2=242"><span>내 공간 완성하기</span></a>
											<ul></ul></li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=241&schCateIdx2=243"><span>일상의 즐거움</span></a>
											<ul></ul></li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=241&schCateIdx2=244"><span>센스있게 마음 전달</span></a>
											<ul></ul></li>							
								</ul>
						</div>
					</li>
					<li class="monarte">
						<a href="/w/monarteMain.do"><span>Monarte</span></a>
						<div class="subnav">
							<ul>
								<li>
										<a href="/w/product/productList.do?schCateIdx1=237&schCateIdx2=238"><span>스스로 자라는 아이</span></a>
											<ul></ul></li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=237&schCateIdx2=240"><span>모나르떼 화방</span></a>
											<ul></ul></li>							
								</ul>
						</div>
					</li>
					<li class="storypick">
						<a href="/w/storypickMain.do"><span>Story Pick</span></a>
						<div class="subnav">
							<ul>
								<li>
										<a href="/w/storypick/storypickCateList.do?level2Idx=30"><span>Stationery</span></a>
										<ul>
											<li><a href="/w/storypick/storypickCateList.do?level2Idx=30&level3Idx=35"><span>필기</span></a></li>
												<li><a href="/w/storypick/storypickCateList.do?level2Idx=30&level3Idx=36"><span>취미</span></a></li>
												</ul>
									</li>
								<li>
										<a href="/w/storypick/storypickCateList.do?level2Idx=31"><span>MonamiPet</span></a>
										<ul>
											<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=40"><span>훈련</span></a></li>
												<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=39"><span>노하우</span></a></li>
												<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=43"><span>일상</span></a></li>
												<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=42"><span>푸드</span></a></li>
												</ul>
									</li>
								<li>
										<a href="/w/storypick/storypickCateList.do?level2Idx=33"><span>Craft&Hobby      </span></a>
										<ul>
											<li><a href="/w/storypick/storypickCateList.do?level2Idx=33&level3Idx=45"><span>DIY</span></a></li>
												<li><a href="/w/storypick/storypickCateList.do?level2Idx=33&level3Idx=46"><span>Gift</span></a></li>
												<li><a href="/w/storypick/storypickCateList.do?level2Idx=33&level3Idx=49"><span>인테리어</span></a></li>
												</ul>
									</li>
								<li>
										<a href="/w/storypick/storypickCateList.do?level2Idx=34"><span>Monarte</span></a>
										<ul>
											<li><a href="/w/storypick/storypickCateList.do?level2Idx=34&level3Idx=51"><span>미술</span></a></li>
												<li><a href="/w/storypick/storypickCateList.do?level2Idx=34&level3Idx=50"><span>교육</span></a></li>
												</ul>
									</li>
								</ul>
						</div>
					</li>
					<li class="event">
						<a href="/w/promotion/event/eventList.do"><span>Event</span></a>
						<div class="subnav">
							<ul>
								<li><a href="/w/promotion/event/eventList.do"><span>이벤트</span></a></li>
								<li><a href="/w/promotion/exhibition/exhibitionList.do"><span>기획전</span></a></li>
								<li><a href="/w/promotion/outlet/outletList.do"><span>아울렛</span></a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<h1 class="logo"><a href="/w/">Monami Mall</a></h1>
	<nav>
		<ul>
			<li class="stationery">
				<a href="/w/stationeryMain.do"><span><small>문구</small>Stationery</span></a>
				<div class="subnav">
					<ul>
						<li>
								<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221"><span>기록의 시작</span></a>
								<ul>
									<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=222"><span>필기용</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=223"><span>메모용</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=224"><span>글자강조(Highlighting)</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=485"><span>고급필기류</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=221&schCateIdx3=487"><span>리필</span></a></li>
										</ul>	
							</li>							
						<li>
								<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225"><span>취미의 발견</span></a>
								<ul>
									<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=226"><span>인테리어/소품 꾸미기</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=228"><span>패브릭 꾸미기</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=230"><span>다이어리 꾸미기</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=231"><span>그림그리기</span></a></li>
										<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=225&schCateIdx3=229"><span>기타</span></a></li>
										</ul>	
							</li>							
						<li>
								<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=232"><span>상상과 표현</span></a>
								<ul>
									<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=232&schCateIdx3=233"><span>유아~어린이</span></a></li>
										</ul>	
							</li>							
						<li>
								<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=234"><span>프로들의 도구</span></a>
								<ul>
									<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=234&schCateIdx3=235"><span>산업용</span></a></li>
										</ul>	
							</li>							
						<li>
								<a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=463"><span>생활 속 문구 </span></a>
								<ul>
									<li><a href="/w/product/productList.do?schCateIdx1=184&schCateIdx2=463&schCateIdx3=465"><span>디자인 문구</span></a></li>
										</ul>	
							</li>							
						</ul>
				</div>
			</li>

			<li class="hobby">
				<a href="/w/hobbyMain.do"><span><small>취미DIY</small>Craft&Hobby</span></a>
				<div class="subnav">
					<ul>
						<li>
								<a href="/w/product/productList.do?schCateIdx1=241&schCateIdx2=242"><span>내 공간 완성하기</span></a>
									<ul></ul></li>							
						<li>
								<a href="/w/product/productList.do?schCateIdx1=241&schCateIdx2=243"><span>일상의 즐거움</span></a>
									<ul></ul></li>							
						<li>
								<a href="/w/product/productList.do?schCateIdx1=241&schCateIdx2=244"><span>센스있게 마음 전달</span></a>
									<ul></ul></li>							
						</ul>
				</div>
			</li>
		
			<li class="storypick">
				<a href="/w/storypickMain.do"><span><small>스토리픽</small>Story Pick</span></a>
				<div class="subnav">
					<ul>
						<li>
							<a href="/w/storypick/storypickCateList.do?level2Idx=30"><span>Stationery</span></a>
							<ul>
								<li><a href="/w/storypick/storypickCateList.do?level2Idx=30&level3Idx=35"><span>필기</span></a></li>
									<li><a href="/w/storypick/storypickCateList.do?level2Idx=30&level3Idx=36"><span>취미</span></a></li>
									</ul>
						</li>
						<li>
							<a href="/w/storypick/storypickCateList.do?level2Idx=31"><span>MonamiPet</span></a>
							<ul>
								<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=40"><span>훈련</span></a></li>
									<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=39"><span>노하우</span></a></li>
									<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=43"><span>일상</span></a></li>
									<li><a href="/w/storypick/storypickCateList.do?level2Idx=31&level3Idx=42"><span>푸드</span></a></li>
									</ul>
						</li>
						<li>
							<a href="/w/storypick/storypickCateList.do?level2Idx=33"><span>Craft&Hobby      </span></a>
							<ul>
								<li><a href="/w/storypick/storypickCateList.do?level2Idx=33&level3Idx=45"><span>DIY</span></a></li>
									<li><a href="/w/storypick/storypickCateList.do?level2Idx=33&level3Idx=46"><span>Gift</span></a></li>
									<li><a href="/w/storypick/storypickCateList.do?level2Idx=33&level3Idx=49"><span>인테리어</span></a></li>
									</ul>
						</li>
						<li>
							<a href="/w/storypick/storypickCateList.do?level2Idx=34"><span>Monarte</span></a>
							<ul>
								<li><a href="/w/storypick/storypickCateList.do?level2Idx=34&level3Idx=51"><span>미술</span></a></li>
									<li><a href="/w/storypick/storypickCateList.do?level2Idx=34&level3Idx=50"><span>교육</span></a></li>
									</ul>
						</li>
						</ul>
				</div>
			</li>
			<li class="event">
				<a href="/w/promotion/event/eventList.do"><span><small>이벤트</small>Event</span></a>
				<div class="subnav">
					<ul>
						<li><a href="/w/promotion/event/eventList.do"><span>이벤트</span></a></li>
						<li><a href="/w/promotion/exhibition/exhibitionList.do"><span>기획전</span></a></li>
						<li><a href="/w/promotion/outlet/outletList.do"><span>아울렛</span></a></li>
					</ul>
				</div>
			</li>
		</ul>
	</nav>

	<div class="util">
		<ul>
			<li><a href="/w/cart.do" class="btn-cart">장바구니 <em class="cartCnt">0</em></a></li>
					<li>
						<a href="javascript:" class="btn-member">회원</a>
						<div class="popinfo">
							<a href="/w/login/loginPage.do">로그인</a>
							<a href="/w/member/joinStep01.do">회원가입</a>
							<a href="/w/login/loginPage.do?memberFlag=N">비회원로그인</a>
						</div>
					</li>
				<li><a href="javascript:" class="btn-search">검색</a></li>
		</ul>
	</div>

	<!-- //검색 -->
	<script>
	$(document).ready(function(){
		recentSearchCall();
	});
	
	// 최근 검색어 목록 
	function recentSearchCall(){
		var searchItem = JSON.parse(localStorage.getItem("searchItem"));					// 로컬스토리지 값
		var html = "";
		if(searchItem != null){
			var totCnt = searchItem.length;
			
			if (totCnt == 0) {
				html = "<div class=\"nodata\">최근 검색한 내역이 없습니다.</div>";
			} else {
				html = "<ul>";				
				for(var i=0; i < searchItem.length; i++){
					var keyword = XSSfilter(searchItem[i].keyword);
					var date = searchItem[i].date;
					html += "<li>";
					html += "	<a href='javascript:void(0)' onclick=\"goTopSearch('"+keyword+"')\" >"+keyword+"</a><button type='button' class='btn-delete' onclick=\"deleteTopSearch('"+keyword+"');\">삭제</button> ";
					html += "</li>";
				}
				html += "</ul>";
			}
		}else{
			html = "<div class=\"nodata\">최근 검색한 내역이 없습니다.</div>";	
		}
		$("#recentSearchList").html(html);				// 리스트
	}
	
	//최근 검색어 한개 삭제
	function deleteTopSearch(k) {
		
		//최근검색어
		var array = new Array();		
		var searchItem = JSON.parse(localStorage.getItem("searchItem"));
		if(searchItem != null){
			for(var i=0; i < searchItem.length; i++){
				if(k != searchItem[i].keyword){
					var itemObj = new Object();
					itemObj.keyword = searchItem[i].keyword;
					itemObj.date = searchItem[i].date;
					array.push(itemObj);
				}
			}			
			
		}		
		localStorage.setItem("searchItem", JSON.stringify(array));
		recentSearchCall();
		
	}
	
	// 최근 검색어 목록  삭제
	function recentSearchClear(){
		if (confirm("최근검색어를 삭제하시겠습니까?")) {
			localStorage.removeItem("searchItem");
			recentSearchCall();
		}
	}
	
	function topsearch() {
		if( ($.trim($("#top_search_keyword").val()) == "")){
			alert('검색어를 입력해주세요.'); 
			return false; 						
		}
		
		if (textLength($.trim($("#top_search_keyword").val())) < 2) {
			alert("검색어는 2글자 이상 입력하여야 합니다.");
			$("#top_search_keyword").focus();
			return false;
		}

		if ($.trim($("#top_search_keyword").val()).indexOf('%') > -1) {
			alert("검색어에 '%'문자를 포함할수 없습니다.");
			$("#top_search_keyword").focus();
			return false;
		}
		
		XSSfilter($("#top_search_keyword").val());
		searchItemSave($.trim($("#top_search_keyword").val()));
		return true;
	
	}
	
	//최근검색어 저장
	function searchItemSave(keyword) {
		XSSfilter(keyword);
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if (mm < 10) {
			mm ="0"+mm;
		}
		if (dd < 10) {
			dd ="0"+dd;
		}
		
		var curr = mm+"."+dd;
		var array = new Array();
		var obj = new Object();
		obj.keyword = keyword;
		obj.date = curr;
		
		//최근검색어
		var searchItem = JSON.parse(localStorage.getItem("searchItem"));
		
		if(searchItem != null){
			
			for(var i=0; i < searchItem.length; i++){
				if(keyword != searchItem[i].keyword){
					var itemObj = new Object();
					itemObj.keyword = searchItem[i].keyword;
					itemObj.date = searchItem[i].date;
					array.push(itemObj);
				}
			}
			
			array.unshift(obj);
			
			if(searchItem.length > 9){					// 10개 제한
				array.pop();
			}
			
		}else{
			array.push(obj);
		}
		localStorage.setItem("searchItem", JSON.stringify(array));
		recentSearchCall();
	}
	
	function goTopSearch(keyword) {
		XSSfilter(keyword);
		$("#top_search_keyword").val($.trim(keyword));
		$("#topSearchFrm").submit();
	}
	
	function topSearchKeyup(e) {
		e.preventDefault();
		e.stopPropagation();
		var searchKeyword = $.trim($("#top_search_keyword").val());
		if (searchKeyword == "") {
			fn.removeClass('.slist');fn.addClass('.sdefault');
		}
		else {
			fn.removeClass('.sdefault');fn.addClass('.slist');
	        setTimeout(topsearchAjax(searchKeyword), 400);
		}
		
	}
	
	function help_switch(t) {
		var gubun = $(t).data('gubun'); //1상품, 2:스토리, 3:기획전이벤트
		var title = $(t).data('title');
		var keyword = $(t).data('keyword');
		var img = $(t).data('img');
		var goodsno = $(t).data('goodsno');
		var normalprice = $(t).data('normalprice');
		var price = $(t).data('price');
		var price_txt = "<em>"+comma(price)+"</em>원";
		var brandnm = $(t).data('brandnm');
		
		if (gubun == "1") {
			if (normalprice > price ) {
				price_txt = "<del><em>"+comma(normalprice)+"</em></del>"+price_txt;
			}
		}
		
		var imgpath = 'https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer';
		var html = "";
		//상품
		if (gubun == "1") {
			html += "<a href=\"/w/product/productDetail.do?goodsNo="+goodsno+"\">";
			html += "<img  src=\""+imgpath+img+"\" alt=\"\" onerror=\"this.src='/w/images/240x240.jpg'\">";
			html += "<span class=\"txt-ti\">"+title+"</span> ";
			html += "<span class=\"txt-price\">"+price_txt+"</span>";			
			html += "</a>";
		}
		else if (gubun == "2") {
			html += "<a href=\"/w/storypick/storypickView.do?storyIdx="+goodsno+"\">";
			html += "<img  src=\""+imgpath+'/storypick/'+goodsno+'/'+img+"\" alt=\"\" onerror=\"this.src='/w/images/240x240.jpg'\">";
			html += "<span class=\"txt-ti\">"+title+"</span> ";
			html += "</a>";			
		}
		else if (gubun == "3") {
			//이벤트
			if (brandnm == "E") {
				html += "<a href=\"/w/promotion/event/eventView.do?promotionIdx="+goodsno+"\">";
				html += "<img  src=\""+imgpath+'/promotion/'+goodsno+'/'+img+"\" alt=\"\" onerror=\"this.src='/w/images/240x240.jpg'\">";
				html += "<span class=\"txt-ti\">"+title+"</span> ";
				html += "</a>";	
			}  else {
				//기획전
				html += "<a href=\"/w/promotion/exhibition/exhibitionView.do?promotionIdx="+goodsno+"\">";
				html += "<img  src=\""+imgpath+'/promotion/'+goodsno+'/'+img+"\" alt=\"\" onerror=\"this.src='/w/images/240x240.jpg'\">";
				html += "<span class=\"txt-ti\">"+title+"</span> ";
				html += "</a>";
			}
						
		}
		$("#searchHelperInner .result .recom").html(html);		
	}
	
	function topsearchAjax(query) {
		$.ajaxSetup({cache:false});
		$.ajax({			
			url: getContextPath()+"/ajax/common/topSearchAjax.do",
			data: {"query":query},
		 	type: "post",
		 	async: false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
		 	beforeSend: function() {
		    },
			success: function(data){
				if ($.trim(data) == "검색결과가 없습니다.") {
					$("#searchHelperInner").addClass("snodata").removeClass("slist");
					$("#searchHelperInner").html(data);
					
				} else {
					$("#searchHelperInner").addClass("slist").removeClass("snodata");
					$("#searchHelperInner").html(data);
					 
					$("#topsearchResultProducts > ul > li > a").on("mouseover", function(e){
						e.preventDefault();
						help_switch($(this));
					});
					
					$("#topsearchResultProducts > ul > li > a").on("click", function(e){
						var keyword =$(this).data("keyword");
						goTopSearch(keyword);
					});
					
					help_switch($("#topsearchResultProducts > ul > li:first > a"));
				}
			 }
		});

	};
	
</script>

	<div id="popHSearch" class="hsearch">
	
		<button type="button" class="btn-close">닫기</button>
		<form action="/w/product/searchResult.do" id="topSearchFrm" method="post" onsubmit="return topsearch();">
		<input type="hidden" name="searchGbn" value="top" />
			<fieldset class="search-field">
				<legend class="hide">검색</legend>
				<!-- 검색어 따라 fn.removeClass('.sdefault');fn.addClass('.slist');fn.addClass('.snodata'); 이용하시면 됩니다. -->
				<input type="text" placeholder="검색어를 입력하세요." name="keyword" id="top_search_keyword" title="검색어 입력" onkeyup="topSearchKeyup(event);">
				<button type="submit" class="btn-search">검색</button>
			</fieldset>
		</form>

		<!-- 초기화면// -->
		<div class="sdefault active">
			<div class="sword">
				<!-- 추천 검색어// -->
				<div class="recom">
					<h3>추천 검색어</h3>
					<div class="ls scrollbar-macosx">
						<ul>
						<li><a href="javascript:goTopSearch('네츄럴코어');">네츄럴코어</a></li>
						<li><a href="javascript:goTopSearch('컬러트윈브러쉬');">컬러트윈브러쉬</a></li>
						<li><a href="javascript:goTopSearch('모나미펫 클린패드');">모나미펫 클린패드</a></li>
						<li><a href="javascript:goTopSearch('FX 153');">FX 153</a></li>
						<li><a href="javascript:goTopSearch('모나그라피');">모나그라피</a></li>
						<li><a href="javascript:goTopSearch('시저');">시저</a></li>
						<li><a href="javascript:goTopSearch('모나르떼');">모나르떼</a></li>
						<li><a href="javascript:goTopSearch('153블라썸');">153블라썸</a></li>
						<li><a href="javascript:goTopSearch('프로베스트캣');">프로베스트캣</a></li>
						<li><a href="javascript:goTopSearch('강아지간식');">강아지간식</a></li>
						<li><a href="javascript:goTopSearch('쉬바');">쉬바</a></li>
						<li><a href="javascript:goTopSearch('내추럴키티');">내추럴키티</a></li>
						<li><a href="javascript:goTopSearch('그르르');">그르르</a></li>
						<li><a href="javascript:goTopSearch('북커버');">북커버</a></li>
						<li><a href="javascript:goTopSearch('홀로그램파우치');">홀로그램파우치</a></li>
						</ul>
					</div>
				</div>
				<!-- //추천 검색어 -->

				<!-- 최근 검색어// -->
				<div class="latest">
					<h3>최근 검색어</h3>
					<div class="ls scrollbar-macosx" id="recentSearchList">
						 
						<div class="nodata">
							최근 검색한 내역이 없습니다.
						</div>
						
					</div>
					<div class="btn-area">
						<button type="button" class="btn-whitegray small btn-alldelete" onclick="recentSearchClear();">전체삭제</button>
					</div>
				</div>
				<!-- //최근 검색어 -->
			</div>

			<!-- 추천 태그// -->
			<div class="recomtag">
				<h3>추천 태그</h3>
				<div class="ls">
					<a href="javascript:goTopSearch('#냥스타그램');">#냥스타그램</a>
					<a href="javascript:goTopSearch('#노즈워크에좋은간식');">#노즈워크에좋은간식</a>
					<a href="javascript:goTopSearch('#취미생활');">#취미생활</a>
					<a href="javascript:goTopSearch('#올바른사료고르기');">#올바른사료고르기</a>
					<a href="javascript:goTopSearch('#고양이털관리TIP');">#고양이털관리TIP</a>
					<a href="javascript:goTopSearch('#랜선집들이');">#랜선집들이</a>
					<a href="javascript:goTopSearch('#개스타그램');">#개스타그램</a>
					<a href="javascript:goTopSearch('#루프탑패밀리');">#루프탑패밀리</a>
					<a href="javascript:goTopSearch('#주말나들이');">#주말나들이</a>
					<a href="javascript:goTopSearch('#불투명네임펜132');">#불투명네임펜132</a>
					<a href="javascript:goTopSearch('#라이브칼라');">#라이브칼라</a>
					<a href="javascript:goTopSearch('#암기잘하는법');">#암기잘하는법</a>
					<a href="javascript:goTopSearch('#간식추천');">#간식추천</a>
					<a href="javascript:goTopSearch('#초등인문학배우기');">#초등인문학배우기</a>
					<a href="javascript:goTopSearch('#다이어리꾸미기');">#다이어리꾸미기</a>
					<a href="javascript:goTopSearch('#프러스펜');">#프러스펜</a>
					</div>
			</div>
			<!-- //추천 태그 -->
		</div>
		<!-- //초기화면 -->

		<!-- 검색입력시 데이타있을때// -->
		<div class="slist" id="searchHelperInner" >
			
		</div>
		<!-- //검색입력시 데이타있을때 -->

		<!-- 검색입력시 데이타없을때// -->
		<div class="snodata" id="searchHelperInnerNodata">
			검색된결과가 없습니다.
		</div>
		<!-- //검색입력시 데이타없을때 -->
	</div>
<!-- //검색 -->

	<!-- 개인화// -->
	</header>

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
	<main id="contents" class="member join">
		<h2>회원가입</h2>

		<div class="join-step1">
			<div class="step">
				<span class="active">STEP1. 약관동의 <span class="hide">현재위치</span></span>
				<span>STEP2. 회원정보 입력</span>
				<span>STEP3. 가입완료</span>
			</div>

			<form name="joinStep02Form" method="post" onsubmit="return false;">
				<input type="hidden" name="joinFlag" id="joinFlag" value="N">
				<input type="hidden" name="targetCode" id="targetCode" value="">
				<input type="hidden" name="rteDevice" id="rteDevice" value="">
				
				
				
			
				<fieldset class="joinagree-field">
					<legend class="hide">약관동의</legend>
					<label class="allcheck"><input type="checkbox" class="small" id="allAgree" onclick="allAgreeCheck();"><span>모나미몰 회원서비스 이용약관, 개인정보수집에 모두 동의합니다.</span></label>
					<ul>
						<li class="agree1 active">
							<label><input type="checkbox" class="small" id="serviceUse"><span>서비스 이용약관(필수)</span></label>
							<button type="button" class="btn-more" onclick="fn.toggleClass('.agree1');">서비스 이용약관(필수) 약관보기</button>
							<div class="agree scrollbar-macosx">
								<div class="inner agree-cont">
									<h3>총칙</h3>
									<br>
									<strong>제1조 (목적)</strong><br>
									이 약관은 (주)모나미 회사(전자상거래 사업자)가 운영하는 (주)모나미 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.<br>
									※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br>
									<br>
									<strong>제2조  (정의)</strong><br>
									①	“몰”이란 (주)모나미 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
									②	“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
									③	“회원”이라 함은 “몰”에 회원 등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
									④	“비회원”이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br>
									⑤	“쿠폰”이라 함은 상품 등을 구매할 때나 “몰”이 제공하는 서비스를 이용할 때 표시된 금액 또는 비율만큼 할인 받을 수 있는 쿠폰을 말합니다.<br>
									⑥	 “적립금”이라 함은 상품을 구매하고 그 대가를 지급하는 데 사용할 수 있는 지급수단을 말합니다.<br>
									⑦	“예치금”이라 함은 “회원” 계정에 금액을 예치하고 상품을 구매하고 그 대가를 지급하는데 사용할 수 있는 지급 수단을 말합니다.<br>
									⑧	“클럽”이라 함은 “몰”의 “회원”인 자들이 만들 수 있는 모임 서비스를 말합니다.<br>
									<br>
									<strong>제3조 (약관 등의 명시와 설명 및 개정) </strong><br>
									①	“몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호•모사전송번호•전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 (주)모나미 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
									②	“몰”은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회•배송책임•환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>
									③	 “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
									④	 “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
									⑤	“몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
									⑥	이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.<br>
									<br>
									<strong>제4조 (서비스의 제공 및 변경)</strong><br>
									①	“몰”은 다음과 같은 업무를 수행합니다.<br>
									ㄱ. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
									ㄴ. 구매계약이 체결된 재화 또는 용역의 배송<br>
									ㄷ. 기타 “몰”이 정하는 업무<br>
									②	“몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다. <br>
									③	“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>
									④	전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
									<br>
									<strong>제5조  (서비스의 중단)</strong><br>
									①	“몰”은 컴퓨터 등 정보통신설비의 보수점검•교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>
									②	“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
									③	사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br>
									<br>
									<strong>제6조  (회원가입)</strong><br>
									①	이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>
									②	 “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br>
									ㄱ. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>
									ㄴ. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
									ㄷ. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br>
									ㄹ. 가입 신청자가 14세 미만인 경우<br>
									③	회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br>
									④	회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br>
									<br>
									<strong>제 7조  (기존 모나미몰,모나미펫,모나르떼 회원 통합)</strong><br>
									①	2019년 3월 6일, (구)모나미몰, (구)모나미펫, 모나르떼 사이트 통폐합으로 인해 기존 별도로 가입하여 이용하던 아이디들을 하나의 아이디로 통합한 후 이용할 수 있습니다.<br>
									②	아이디를 통합하면 기존 사이트의 아래 정보와 혜택이 “몰”로 이관됩니다.<br>
									ㄱ. 모나미몰 : 회원정보, 주문/배송 이력<br>
									ㄴ. 모나미펫 : 회원정보, 반려동물, 최종 적립금, 등급, 상담 이력, 상품, 상품이미지, 구매후기, 상품평, 상품Q&A, 주문/배송 이력<br>
									ㄷ. 모나르떼 : 부모/자녀 회원정보<br>
									③	“몰” 회원통합 절차는 아래와 같은 순서로 진행됩니다.<br>
									ㄱ. 회원가입/로그인 화면 하단 ‘통합회원전환’버튼 클릭<br>
									ㄴ.휴대폰번호로 본인 인증<br>
									ㄷ.인증된 휴대폰 번호로 가입된 회원 리스트 확인<br>
									ㄹ. 통합 원하는 계정 및 사용할 ID 선택<br>
									ㅁ. 약관 동의<br>
									ㅂ. 선택한 ID 기준 회원정보 노출<br>
									ㅅ. 정보 수정 후 통합회원 전환 완료<br>
									④	단, 인증되지 않은 휴대폰 번호로는 ID 통합이 불가합니다.<br>
									⑤	모나르떼가 포함된 ID인 경우 모나르떼 ID로만 통합이 가능하며, 모나르떼 자녀 회원은 부모회원이 통합회원으로 전환 시 함께 전환됩니다.<br>
									⑥	사용하려는 기존 ID가 한글 또는 5자리 미만일 경우는 통합회원 전환 시 사용 불가하며, 다른 ID를 선택하거나 ID를 변경하여야 합니다. <br>
									<br>
									<strong>제8조  (회원 탈퇴 및 자격 상실 등)</strong><br>
									①	회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br>
									②	회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br>
									ㄱ. 가입 신청 시에 허위 내용을 등록한 경우<br>
									ㄴ. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>
									ㄷ. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br>
									ㄹ.“몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br>
									③	“몰”이 회원 자격을 제한•정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br>
									④	“몰” 마지막 접속 후 7개월이 경과되면 ‘휴면 계정’으로 전환되며, 휴면계정 전환 후 5개월(마지막 로그인 접속 기록 후 1년) 경과 시 자동 회원탈퇴 처리됩니다.<br>
									⑤	회원탈퇴가 불가한 경우는 다음 각 호를 따릅니다.<br>
									ㄱ.	현재 고객의 반품처리 또는 고객 서비스 미완료 상태<br>
									ㄴ.	배송요청, 배송중, 반품요청, 송금예정 등의 거래가 진행 중인 상태(종료 후 회원탈퇴 가능)<br>
									ㄷ.	클럽의 클럽장인 경우(클럽 멤버 및 클럽 삭제 후 회원탈퇴 가능)<br>
									ㄹ.	예치금이 존재할 경우<br>
									ㅁ.	모나르떼 회원일 경우(추가 승인 필요)<br>
									⑥	“몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br>
									<br>
									<strong>제9조  (회원에 대한 통지)</strong><br>
									①	“몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br>
									②	“몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br>
									<br>
									<strong>제10조  (개인정보보호)</strong><br>
									①	“몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.<br>
									②	“몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br>
									③	“몰”은 이용자의 개인정보를 수집•이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.<br>
									④	“몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br>
									⑤	“몰”이 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br>
									⑥	이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br>
									⑦	“몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br>
									⑧	“몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br>
									⑨	“몰”은 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br>
									<br>
									<strong>제11조  (개인정보의 파기 등)</strong><br>
									①	정보통신서비스 제공자등은 이용자가 정보통신서비스를 법 제29조제2항의 기간 동안 이용하지 아니하는 경우에는 이용자의 개인정보를 해당 기간 경과 후 즉시 파기하거나 다른 이용자의 개인정보와 분리하여 별도로 저장•관리하여야 한다. 다만, 법 제29조제2항 본문에 따른 기간(법 제29조제2항 단서에 따라 이용자의 요청에 따라 달리 정한 경우에는 그 기간을 말한다)이 경과한 경우로서 다른 법령에 따라 이용자의 개인정보를 보존하여야 하는 경우에는 다른 법령에서 정한 기간이 경과할 때까지 다른 이용자의 개인정보와 분리하여 별도로 저장•관리하여야 한다.<br>
									②	정보통신서비스 제공자등은 제2항에 따라 개인정보를 별도로 저장•관리하는 경우에는 법 또는 다른 법률에 특별한 규정이 있는 경우를 제외하고는 해당 개인정보를 이용하거나 제공하여서는 아니 된다.<br>
									③	법 제29조제3항에서 "개인정보가 파기되는 사실, 기간 만료일 및 파기되는 개인정보의 항목 등 대통령령으로 정하는 사항"이란 다음 각 호의 사항을 말한다.  <개정 2016.5.31.><br>
									ㄱ. 개인정보를 파기하는 경우: 개인정보가 파기되는 사실, 기간 만료일 및 파기되는 개인정보의 항목<br>
									ㄴ. 다른 이용자의 개인정보와 분리하여 개인정보를 저장•관리하는 경우: 개인정보가 분리되어 저장•관리되는 사실, 기간 만료일 및 분리•저장되어 관리되는 개인정보의 항목<br>
									ㄷ. 법 제29조 제3항에서 "전자우편 등 대통령령으로 정하는 방법"이란 전자우편•서면•모사전송•전화 또는 이와 유사한 방법을 말한다.  <신설 2016.5.31.><br>
									<strong>제 12조  (제3자 정보 제공 안내)</strong><br>
									①	회사는 수집한 정보를 이용자의 사전 동의 없이 제3자에게 제공하지 않으며 다음의 경우는 예외로 합니다. <br>
									ㄱ.	법령에 규정하거나, 수사 등의 목적으로 법령에 정해진 절차에 의하여 수사기관 등이 요청한 경우<br>
									ㄴ.	이용자가 사전에 동의한 경우(이용자가 사전에 동의한 경우란, 서비스 이용 등을 위하여 이용자가 자발적으로 자신의 개인정보를 제3자에게 제공하는 것에 동의하는 것을 의미합니다)<br>
									②	이용자가 이용함에 있어 회사와 이용자 사이의 개인정보를 제3자에게 제공합니다.<br>
									ㄱ.  결제수단 사업자<br>
									• 신용카드사ㅇ<br>
									국민, 비씨, 롯데, 삼성, NH농협, 현대, 외환, 신한 등<br>
									•계좌이체 <br>
									-은행(기업/국민/외환/수협/농협중앙회/단위농협/우리/SC제일/한국씨티/대구/부산/광주/제주/전북/경남/새마을금고/신협/우체국/하나/신한/산림조합/산업),<br>
									-증권(동양/현대/미래에셋/한국투자/우리투자/하이/HMC/SK/대신/하나대투/신한금융/동부/유진/메리츠/신영/삼성/한화),<br>
									-금융결제원<br>
									•가상계좌<br>
									-은행(NH농협, KB국민, 신한, 우리, 기업, KEB하나, 대구, 부산, 우체국, 광주, SC, 경남, 한국씨티, 수협중앙회 등)<br>
									-KG이니시스<br>
									• 개인정보를 제공받는 자의 개인정보 이용 목적<br>
									-본인 인증, 거래승인, 요금정산을 위한 거래정보전송, 수납 등 요금 정산 관련 업무<br>
									-결제수단별 제공하는 개인정보의 항목<br>
									-신용카드 : 이용자의 서비스 거래정보<br>
									-계좌이체 : 이용자의 서비스 거래정보<br>
									-가상계좌 : 이용자의 서비스 거래정보<br>
									• 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간<br>
									해당 사업자가 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음. 단, 법령의 규정에 의한 거래 내역 등을 보관(건당 거래금액이 1만원 이하의 경우 1년, 1만원 초과의 경우 5년)<br>
									ㄴ.이용자의 거래 상대방<br>
									• 개인정보를 제공받는 자의 개인정보 이용 목적<br>
									거래 승인 확인, 취소 및 환불, 거래 대금의 정산, 거래 확인 요청에 대한 응대 및 확인<br>
									• 제공하는 개인정보의 항목<br>
									이용자의 서비스 거래 정보(각 결제 수단의 거래 승인 여부, 거래 승인 실패 원인, 결제 일시, 결제금액 등)<br>
									• 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간<br>
									법령의 규정에 의한 거래 내역을 보관(건당 거래금액이 1만원 이하의 경우 1년, 1만원 초과의 경우 5년)<br>
									ㄷ.	교육법인 모나르떼<br>
									• 기존 ㈜모나미의 사업부문이었던 모나르떼의 전문성과 경쟁력을 더욱 강화하기 위해 2019년 2월 1일자로 ㈜모나미에서 분할하여 신설법인인 ‘교육법인 모나르떼’를 설립함에 따라 ㈜모나미가 모나르떼를 운영하면서 이용계약 및 모나르떼 회원의 개인정보, 거래 및 결제 정보, 학습정보, 자녀정보 등의 정보를 지속적이고 정상적인 서비스 제공을 위하여 교육법인 모나르떼에 정보를 제공합니다.<br>
									모나르떼 회원 개인정보 및 거래, 결제, 학습, 자녀 정보 등<br>
									③	회사는 아래와 같이 이용자로부터 수집한 개인정보를 제3자에게 위탁 합니다.<br>
									ㄱ.결제수단 사업자<br>
									• 신용카드<br>
									   신용카드사(국민, 비씨, 롯데, 삼성, NH농협, 현대, 외환, 신한) 등<br>
									• 계좌이체<br>
									-은행(기업/국민/외환/수협/농협중앙회/단위농협/우리/SC제일/한국씨티/대구/부산/광주/제주/전북/경남/새마을금고/신협/우체국/하나/신한/산림조합/산업),<br>
									-증권(동양/현대/미래에셋/한국투자/우리투자/하이/HMC/SK/대신/하나대투/신한금융/동부/유진/메리츠/신영/삼성/한화),<br>
									-금융결제원<br>
									• 가상계좌<br>
									-은행(NH농협, KB국민, 신한, 우리, 기업, KEB하나, 대구, 부산, 우체국, 광주, SC, 경남, 한국씨티, 수협중앙회 등)<br>
									-KG이니시스<br>
									• 개인정보 취급위탁을 하는 업무의 내용<br>
									본인 인증, 거래승인, 요금정산을 위한 거래정보전송, 수납 등 요금 정산 관련 업무<br>
									ㄴ.이용자의 거래 상대방<br>
									• 개인정보 취급위탁을 하는 업무의 내용<br>
									거래 승인 확인, 취소 및 환불, 거래 대금의 정산, 거래 확인 요청에 대한 응대 및 확인<br>
									ㄷ.모나미교육법인모나르떼㈜<br>
									• 제공사유<br>
									기존 ㈜모나미의 사업부문이었던 모나르떼의 전문성과 경쟁력을 더욱 강화하기 위해 2019년 2월 1일자로 ㈜모나미에서 분할하여 신설법인인 ‘교육법인 모나르떼’를 설립함에 따라 ㈜모나미가 모나르떼를 운영하면서 사용하였던 이용계약 및 모나르떼 회원의 개인정보, 거래 및 결제 정보, 학습정보, 자녀정보 등의 정보를 지속적이고 정상적인 서비스 제공을 위하여 교육법인 모나르떼에 정보를 제공합니다.<br>
									• 제공대상<br>
									모나르떼 회원 개인정보 및 거래, 결제, 학습, 자녀 정보 등<br>
									이용자는 회사의 개인정보 제공 및 위탁 동의를 거부할 수 있습니다. 단, 동의를 거부하는 경우 서비스 결제가 정상적으로 완료될 수 없으며, 서비스를 정상적으로 이용할 수 없습니다.<br>

									<br>
									<strong>제 13조  (“몰“의 의무)</strong><br>
									①	“몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화•용역을 제공하는데 최선을 다하여야 합니다.<br>
									②	“몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br>
									③	“몰”이 상품이나 용역에 대하여 「표시•광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시•광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br>
									④	“몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br>
									<br>
									<strong>제14조  (회원의 ID 및 비밀번호에 대한 의무)</strong><br>
									① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br>
									② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br>
									③ 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.<br>
									<br>
									<strong>제15조  (이용자의 의무)</strong><br>
									①	이용자는 다음 행위를 하여서는 안 됩니다.<br>
									ㄱ. 신청 또는 변경시 허위 내용의 등록<br>
									ㄴ. 타인의 정보 도용<br>
									ㄷ. “몰”에 게시된 정보의 변경<br>
									ㄹ. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>
									ㅁ. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
									ㅂ. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
									ㅅ. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위<br>
									<br>
									<strong>제 16조  (쿠폰)</strong><br>
									①	쿠폰은 “몰”이 무상으로 발행하는 쿠폰으로 발행대상, 발행경로, 사용대상 등에 따라 구분될 수 있으며, 할인쿠폰의 세부구분, 할인금액(할인율), 사용방법, 사용기한 및 제한에 대한 사항은 할인쿠폰 또는 서비스 화면에 표시됩니다. 할인쿠폰의 종류 및 내용과 발급 여부는 “몰”의 서비스 정책에 따라 변경될 수 있습니다.<br>
									②	할인쿠폰은 현금으로 출금될 수 없으며, 할인쿠폰에 표시된 유효기간이 만료되거나 회원자격이 상실되면 소멸합니다.<br>
									③	할인쿠폰은 “몰”에서 별도로 명시한 경우를 제외하고는 타인에게 양도할 수 없으며, 부정한 목적이나 용도로 사용할 수 없습니다. 이를 위반한 경우 “몰”은 할인쿠폰을 소멸시키거나 회원자격을 제한 또는 상실시킬 수 있습니다.<br>
									④	회원이 부정한 방법으로 할인쿠폰, 적립금 또는 예치금을 획득한 사실이 확인될 경우, “몰”은 회원의 할인쿠폰, 적립금 또는 예치금을 회수하고, 회원자격 상실(아이디 삭제) 및 민∙형사 상의 법적 조치 등을 취할 수 있습니다.<br>
									<br>
									<strong>제 17조  (회원 등급)</strong><br>
									“몰”에서는 구매 금액에 따른 회원 등급별 혜택이 구분되어 제공되며, 다음의 각 호의 내용을 따릅니다. 회원등급별 할인 혜택, 회원등급 적용 시점, 기준 금액, 혜택 적용 범위 등에 대한 사항은 서비스 화면에 표시되며 회원등급별 혜택 및 내용은 “몰”의 서비스 정책에 따라 변경될 수 있습니다. <br>
									<br>
									<strong>제 18조  (적립금 등)</strong><br>
									①	“몰”의 회원은 다음 각 호의 방법을 통해 적립금을 적립할 수 있으며 “몰” 내에서 실제 통화가치에 상응하게 사용할 수 있습니다. 등급별, 상품별 지급 내용은 “몰”의 서비스 정책에 따라 변경될 수 있습니다. <br>
									ㄱ. 상품구매 확정 시 (그린 등급의 경우 구매금액의3% 적립)<br>
									ㄴ. 일반 상품평, 포토 상품평, SNS 추가 상품평 작성 시<br>
									ㄷ. 기타 이벤트 당첨 시<br>
									②	적립금의 사용은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. <br>
									③	기본 적립금액 1,000원 이상 100원 단위로 사용 가능<br>
									④	보유 적립금 한도 내에서 구매금액 전액 구매 가능<br>
									⑤	타 결제수단과 통합 결제 시 할인금액으로 복합결제 가능<br>
									⑥	적립금의 소멸 기준은 다음 각 호를 따릅니다. <br>
									ㄱ. 적립일 기준으로 1년 후 소멸<br>
									ㄴ. 선입된 적립금 먼저 선소멸/선사용<br>
									⑦	적립금의 회수는 다음 각 호의 경우 적용됩니다. <br>
									ㄱ. 가상계좌 주문접수 후 미입금 상태로 주문취소 시 <br>
									ㄴ. 입금완료, 결제완료 후 주문취소 시<br>
									ㄷ. 부분취소 및 부분 반품진행 시(실결제수단>예치금>적립금 순)<br>
									ㄹ. 전체 반품진행 시 반품승인 완료 시<br>
									<br>
									<strong>제 19조  (예치금 등) </strong><br>
									①	예치금은 회원이 “몰”의 상품 등을 구매할 때 결제 수단으로 사용할 수 있으며 1회 최대 3백만 원을 클럽 예치금으로 전환할 수 있습니다.<br>
									②	예치금 신청은 최초 1회 실명인증 후 사용 신청할 수 있으며 이 때 이름, 회원 아이디, 전화번호는 필수 데이터입니다.<br>
									③	예치금 입금은 무통장입금으로 진행되며 입급자명은 회원 “아이디”로 하여 송금하는 절차에 따릅니다.<br>
									④	예치금 충전은 ㈜모나미의 고객센터를 통해 확인 후 “회원” 계정의 예치금 항목으로 입력됩니다. 예치금의 사용은 10원 단위로 가능하며, 정기배송, 컨시어지 서비스, 일반 구매 시 결제 수단으로 사용 가능합니다.<br>
									⑤	개인 예치금을 클럽으로 양도는 가능하나 개인 간 양도는 불가합니다.<br>
									⑥	예치금 환불은 실명인증 후에 가능하며 계좌를 통해 전액 환불 가능합니다.<br>
									<br>
									<strong>제 20조  (클럽 및 클럽 장바구니 등)</strong><br>
									①	“몰”의 회원은 누구나 클럽을 생성할 수 있으며 개인 예치금을 클럽 예치금으로 전환하여 사용 가능합니다. 1회 최대 3백만 원을 한도로 하며 해당 금액을 초과해서 전환 진행할 수 없습니다.
									②	클럽 장바구니의 경우 30일 경과 후에는 자동으로 상품이 삭제됩니다.
									③	클럽의 삭제는 클럽 멤버의 전원 탈퇴 처리, 예치금 0원, 진행 주문 0건일 경우 가능합니다.
									<br>
									<br>
									<br>
									<h3>전자상거래 서비스</h3>
									<br>
									<strong>제20조  (구매신청)</strong><br>
									①	“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<br>
									ㄱ. 재화 등의 검색 및 선택<br>
									ㄴ. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br>
									ㄷ. 약관내용, 청약철회권이 제한되는 서비스, 배송료•설치비 등의 비용부담과 관련한 내용에 대한 확인<br>
									ㄹ. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시 (예, 마우스 클릭)<br>
									ㅁ. 재화 등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의<br>
									ㅂ. 결제방법의 선택<br>
									②	“몰”이 제3자에게 구매자 개인정보를 제공•위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유•이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.<br>
									<br>
									<strong>제21조  (계약의 성립)</strong><br>
									①	“몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br>
									1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>
									2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br>
									3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우<br>
									②	“몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br>
									③	“몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br>
									<br>
									<strong>제22조  (지급방법)</strong><br>
									“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br>
									①	폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체<br>
									②	선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br>
									③	온라인무통장입금<br>
									④	전자화폐에 의한 결제<br>
									⑤	“몰”이 지급한 적립금에 의한 결제<br>
									⑥	선입금 방식의 예치금에 의한 결제<br>
									⑦	기타 전자적 지급 방법에 의한 대금 지급 등<br>
									<br>
									<strong>제23조  (수신확인통지•구매신청 변경 및 취소)</strong><br>
									①	“몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>
									②	수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제20조의 청약철회 등에 관한 규정에 따릅니다.<br>
									<br>
									<strong>제24조  (재화 등의 공급)</strong><br>
									①	“몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 문구의 각인 서비스를 신청한 경우에는 기존 7일 이내 상품 등을 배송해야 하는 기간보다 3~5일 더 소요됨을 알립니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br>
									②	“몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의•과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br>
									<br>
									<strong>제25조  (환급)</strong><br>
									“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br>
									<br>
									<strong>제 26조  (청약철회 등)</strong><br>
									①	“몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.<br>
									②	이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br>
									ㄱ. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>
									ㄴ. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br>
									ㄷ. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br>
									ㄹ. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br>
									③	제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br>
									④	이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br>
									<br>
									<strong>제27조  (청약철회 등의 효과)</strong><br>
									①	“몰”은 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br>
									②	“몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br>
									③	청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.<br>
									④	이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br>
									<br>
									<strong>제 28조  (배송 및 거래완료)</strong><br>
									①	회원은 구매한 상품 등의 배송이 완료되었을 때로부터 일정한 기간 내에 “몰”에 대하여 구매확정, 교환 또는 반품의 의사표시를 하여야 합니다.<br>
									②	“몰”은 제1항의 구매확정 기간 내에 구매확정, 교환 또는 반품에 대한 회원의 의사표시가 없는 경우, 해당 거래에 대하여 회원의 구매확정 의사표시가 있는 것으로 간주하여 자동구매확정으로 처리할 수 있습니다.<br>
									③	회원이 교환 또는 반품신청을 한 날로부터 14일이 지날 때까지 이미 수령한 상품을 판매자에게 반환하지 아니 하거나 전화, 전자우편 등으로 연락되지 아니하는 경우, 해당 회원의 교환 또는 반품 신청은 효력을 상실합니다.<br>
									<br>
									<br>
									<br>
									<h3>기타</h3>
									<br>
									<strong>제29조  (연결“몰”과 피연결“몰” 간의 관계)</strong><br>
									①	상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.<br>
									②	연결“몰”은 피연결 “몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.<br>
									<br>
									<strong>제30조  (저작권의 귀속 및 이용제한)</strong><br>
									①	“몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.<br>
									②	이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br>
									③	“몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br>
									<br>
									<strong>제31조  (분쟁해결)</strong><br>
									①	“몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치•운영합니다.<br>
									②	“몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br>
									③	 “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br>
									<br>
									<strong>제32조  (재판권 및 준거법)</strong><br>
									①	“몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>
									②	“몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br>
									<br>
									본 약관은 2019년 3월 6일부터 적용됩니다.<br>
									<br>
									<br>
									<h3>[정기주문 서비스 약관]</h3>
									<br>
									<strong>제1조 (정의)</strong><br>
									정기배송 서비스는 고객의 편의를 위하여 상품을 정기적으로 배송하는 서비스입니다. <br>
									<br>
									<strong>제2조 (정기주문 서비스 이용 자격)</strong><br>
									정기배송 서비스는 ㈜모나미몰(이하 ‘몰’) 회원이면 누구나 정기배송 서비스를 신청해 이용할 수 있습니다. <br>
									<br>
									<strong>제3조 (정기배송서비스 상품의 결제 등)</strong><br>
									①	“몰” 정기배송 서비스 상품에 대하여 할인 혜택을 제공할 수 있으며, 할인율 및 거래조건 등은 상품 별로 다를 수 있고 변경될 수 있습니다. 또한 쿠폰할인 혜택은 제외됩니다. 할인율 및 거래조건 등이 고객에게 불리하게 변경되는 경우 “몰”은 2주 이상의 상당한 기간 동안 위 변경에 대하여 공지하고, 고객은 위 변경에 동의하지 않으면 위 기간 동안 본 서비스를 종료시킬 수 있으며, 위 기간 동안 서비스를 종료시키지 않으면 위 변경에 고객이 동의한 것으로 봅니다.<br>
									②	정기배송 서비스의 설정은 멀티로 가능하며 주기 또한 주간, 월간, 특정일로 설정할 수 있습니다.<br>
									③	정기배송 서비스의 특성 상 상품의 가격은 계속적으로 변경될 수 있으며, 고객에게 고지된 시점의 상품 가격을 기준으로 결제가 이루어집니다. 가격 결정의 기준 시점은 변경될 수 있습니다.<br>
									④	정기배송 서비스의 할인혜택은 회원 등급할인의 기준을 따르며 적립금이 발생하는 상품을 구매 시 적립금이 지급됩니다.<br>
									⑤	결제는 예치금 또는 간편결제(PG) 중 선택하여 진행하고, 결제일은 정기배송일 3일 전 자동결제(예치금, 간편결제)됩니다.<br>
									⑥	카드 한도 초과 등으로 상품의 결제가 이루어 지지 않을 경우, 해당 회차의 정기주문은 이루어지지 않을 수 있습니다.<br>
									⑦	다음의 각 호에 따라 정기배송이 취소될 수 있습니다.<br>
									ㄱ. 예치금 부족<br>
									ㄴ. 결제 카드의 한도 초과<br>
									ㄷ. 결제 카드 분실 및 사용 중지 상태<br>
									ㄹ. 품절 상품의 존재<br>
									⑧	정기배송의 배송비는 다음의 각 호에 따릅니다.<br>
									ㄱ. 3만원 이상 구매 경우 무료배송<br>
									ㄴ. 업체배송 상품의 경우 업체 배송비 정책에 따름<br>
									ㄷ. 도서산간 지역은 배송비 추가 부과<br>
									<br>
									<strong>제4조 (정기배송 서비스 상품의 판매 종료 등)</strong><br>
									정기배송 상품을 더 이상 판매할 수 없거나 해당 상품을 정기주문 서비스로 제공할 수 없는 사유가 있는 경우, “몰”은 해당 상품의 정기주문 서비스를 중지하거나 해당 회차의 상품을 공급하지 않을 수 있습니다.<br>
									<br>
									<strong>제5조 (정기주문 서비스의 종료)</strong><br>
									회원은 “몰”에게 정기주문 서비스 종료의 의사를 통지함으로써 정기주문 서비스를 종료시킬 수 있습니다.<br>
									<br>
									<strong>제6조 (정기배송 서비스 이용의 제한)</strong><br>
									①	회원의 통지 또는 과실에 의해서 정기배송 서비스가 중지되는 경우(일부 상품에 대하여 정기배송 서비스가 중지되는 경우를 포함합니다.) 해당 상품의 정기배송 서비스 신청이 2개월의 범위 내에서 제한될 수 있습니다.<br>
									②	“몰”은 특정상품에 대하여 구매 수량을 제한할 수 있습니다.<br>
									③	“몰”은 상품의 재판매 가능성이 있는 경우, 또는 불법적이거나 부당한 행위와 관련된 경우 정기배송 서비스 제공을 제한할 수 있습니다.<br>
									④	서비스 이용의 제한에 대한 구체적인 기준은 내부 운영정책에 따라 적용 됩니다.<br>
									⑤	“몰”은 자체적인 시스템을 통한 모니터링과 각종 기관에서 접수된 민원 내용, 수사기관의 정보 등을 통해 정황을 확인한 후, 정기배송 서비스 제한 사유 행위를 한 것으로 추정되는 경우 정기주문 서비스 이용을 제한할 수 있습니다.<br>
								</div>
							</div>
						</li>
						<li class="agree2">
							<label><input type="checkbox" class="small" id="privacyCollection"><span>개인정보수집/이용동의(필수)</span></label>
							<button type="button" class="btn-more" onclick="fn.toggleClass('.agree2');">개인정보수집/이용동의(필수) 약관보기</button>
							<div class="agree scrollbar-macosx">
								<div class="agree-cont">
									<h3>[개인정보수집 이용동의]</h3>
									<br>
									회사는 이용자에게 서비스 제공을 위해 필요 한 고객 정보 외에는 불필요한 정보 수집을 하지 않습니다. 단, 필수 기재 항목 외에 특별 서비스 제공에 따른 추가 정보 수집은 예외로 합니다.<br>
									<br>
									또한, 정보통신서비스의 제공에 따른 요금정산에 필요한 경우에 해당하여 이용자의 동의 없이 개인정보를 이용할 수 있습니다. 이용자로부터 취득한 정보는 회사가 제공하는 서비스 및 각종 행사 또는 판촉 행사 안내 등 기타 마케팅 활동에만 사용될 것입니다. 마케팅 활동이란 제품 구매 및 DM, 설문 조사, 프로모션, 광고 전달, 기타 E-Mail 및 제휴 업체와의 공동 프로모션을 통한 회원들에게 로열티를 증대시키는 활동을 말합니다.<br>
									<br>
									<strong>[개인정보의 수집•이용목적]</strong>
									①	회원 서비스 이용에 따른 본인 확인<br>
									②	모나르떼 이용 대상 자녀 확인<br>
									③	고지 사항 전달, 불만 처리 등을 위한 원활한 의사 소통 경로의 확보, 새로운 서비스 및 신상품이나 이벤트 정보 등의 안내<br>
									④	청구서, 경품 및 쇼핑물품 배송에 대한 정확한 배송지의 확보<br>
									⑤	개인 맞춤 서비스 제공<br>
									⑥	회사가 제공하는 서비스 및 각종 행사 또는 판촉 행사 안내 등 기타 마케팅 활동<br>
									⑦	불량회원의 부정이용 방지와 비인가 사용방지, 가입 및 가입회수 제한<br>
									⑧	회원탈퇴 의사의 확인, 회원 탈퇴 후 서비스의 중복 적용 방지<br>
									⑨	만 14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인<br>
									⑩	회사의 상품•서비스•컨텐츠 제공, 구매 및 대금결제, 대금 추심<br>
									⑪	신규 상품•서비스 개발, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속빈도 파악, 회원의 서비스이용에 대한 통계<br>
									<br>
									<strong>[수집하는 개인정보의 항목]</strong>
									①	이름, 회원 ID, 비밀번호, 성별, 생년월일 등<br>
									②	자녀이름, 자녀성별, 출생여부, 자녀출생일<br>
									③	이메일, 연락처(유선전화, 무선전화)<br>
									④	주소<br>
									⑤	기타 선택항목 : 개인맞춤 서비스를 제공하기 위하여 회사가 필요로 하는 정보<br>
									⑥	특별 서비스 이용과정이나 사업처리 과정에서 IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록 등의 정보 자동 생성/수집<br>
									<br>
									<strong>[보유 및 이용기간과 공유 및 3자 제공]</strong>
									①	이용자의 개인정보는 “몰”의 회원으로서 서비스를 받는 동안 계속 보유하며, 서비스 제공을 위해 이용합니다. 회원의 정보는 회원 탈퇴시 재생이 불가능 하도록 완전 삭제됩니다.<br>
									②	이 개인정보 처리 및 보유 기간은 홈페이지 회원 가입 및 관리와 관련된 부분의 경우 홈페이지 탈퇴 시까지이며, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지로 할 수 있습니다.<br>
									- 관련 법령 위반에 따른 수사•조사 등이 진행 중인 경우에는 해당 수사•조사 종료 시까지<br>
									- 홈페이지 이용에 따른 채권•채무관계 정산 시까지<br>
									- 예외 사유 시에는 보유기간 까지<br>
									③	다만, 개인정보의 수집 및 이용목적이 달성된 경우에도 다음과 같이 관계법령의 규정에 따라 해당 정보를 일정 기간 보유하여야 할 필요가 있을 경우에는 일정 기간 해당 정보를 보유할 수 있습니다.<br>
									- 계약 또는 청약 철회 등에 관한 기록(전자상거래등에서의소비자보호에관한법률) : 5년<br>
									- 대금결제 및 재화 등의 공급에 관한 기록(전자상거래등에서의소비자보호에관한법률) : 5년<br>
									- 소비자의 불만 또는 분쟁 처리에 관한 기록(전자상거래등에서의소비자보호에관한법률) : 3년<br>
									- 표시•광고에 관한 기록(전자상거래등에서의소비자보호에관한법률) : 6월<br>
									- 가입자 전기통신일시, 개시•종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료(통신비밀보호법 시행령 제41조에 따른 통신사실확인자료 보관) : 1년<br>
									- 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료(통신비밀보호법 시행령 제41조에 따른 통신사실확인자료 보관) : 3개월<br>
									④	이용자의 개인정보는 보다 나은 서비스 및 마케팅 활동을 위해 제휴 파트너와 공유할 수 있으며 이 경우 파트너 공개 및 제공 서비스, 정보보호대책 등에 대해 사전 안내 및 동의 절차를 반드시 거칩니다.
								</div>
							</div>
						</li>
						<li class="agree3">
							<label><input type="checkbox" class="small" id="privacyUsage"><span>개인정보취급/위탁동의(필수)</span></label>
							<button type="button" class="btn-more" onclick="fn.toggleClass('.agree3');">개인정보취급/위탁동의(필수) 약관보기</button>
							<div class="agree scrollbar-macosx">
								<div class="agree-cont">
									<h3>[개인정보 위탁동의]</h3>
									<br>
									회사는 제품과 서비스의 향상을 위해서 이용자 개인정보의 처리를 외부업체에 위탁할 수 있으며, 관계법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 규정하고 있습니다.<br><br>
									(1)수탁자, 위탁업무내용, 공유 정보의 범위 등에 관한 사항을 서면, 전자우편, 전화 또는 홈페이지를 통해 게시합니다.<br>
									(2)위탁 계약 시 서비스제공자의 개인정보보호 관련 지시엄수, 개인정보에 관한 비밀유지, 제3자 제공의 금지 및 사고시의 책임부담, 위탁기간, 처리 종료후의 개인정보의 반환 또는 파기 등을 규정하고 당해 계약내용을 서면 또는 전자적으로 보관합니다.
									회사는 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
									<br>
									<table>
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th>위탁 대상자(수탁자)</th>
												<th>위탁업무 내용</th>
												<th>개인정보항목</th>
												<th>보유 및 이용기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>CJ 대한통운</td>
												<td>상품배송</td>
												<td>주문정보, 배송정보</td>
												<td>계약 종료시까지</td>
											</tr>
											<tr>
												<td>㈜코리아센터닷컴</td>
												<td>고객정보DB시스템운영(전산아웃소싱)</td>
												<td></td>
												<td>계약 종료시까지</td>
											</tr>
											<tr>
												<td>서울신용평가정보</td>
												<td>실명인증, 본인확인, 유효성 체크, 아이핀</td>
												<td>회원정보</td>
												<td>계약 종료시까지</td>
											</tr>
											<tr>
												<td>㈜이니시스</td>
												<td>결제관련</td>
												<td>회원정보, 결제정보</td>
												<td>계약 종료시까지</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</li>
					</ul>
					<div class="btn-area">
						<button type="button" class="btn-white" onclick="location.href='/study/monnami/member/join.jsp'">취소</button>
						<button type="button" class="btn-black" onclick="termsCheck();">확인</button>
					</div>
				</fieldset>
			</form>
		</div>
	</main>
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

<!-- 이지웰 이중스크롤방지 -->
<footer id="footer">
	<div class="util">
		<div class="inner">
			<div class="notice">
				<strong>공지사항</strong>
				<a href="/w/cscenter/notice/noticeList.do" class="btn-more">공지사항 더보기</a>
				<ul>
					<li>
							<a href="/w/cscenter/notice/noticeView.do?noticeIdx=43">
								<span class="txt-subject">통합회원 전환 방법을 안내합니다. </span>
								<span class="txt-date">2019.03.06</span>
							</a>
						</li>
					<li>
							<a href="/w/cscenter/notice/noticeView.do?noticeIdx=23">
								<span class="txt-subject">3월 카드사 무이자 할부 안내</span>
								<span class="txt-date">2019.02.28</span>
							</a>
						</li>
					<li>
							<a href="/w/cscenter/notice/noticeView.do?noticeIdx=6">
								<span class="txt-subject">편리한 예치금 서비스! 소개합니다. </span>
								<span class="txt-date">2019.02.12</span>
							</a>
						</li>
					</ul>
			</div>
			<div class="customer">
				<strong><a href="/w/cscenter/faq/faqList.do">고객지원센터  ></a></strong>
				<div class="info">
					<em>1544-2884</em>
					평일 <strong>08:30~17:30</strong> (점심시간 <strong>12:00~13:00</strong>)<br>
					주말/공휴일: 휴무
				</div>
				<p class="btn-area">
					<a href="/w/mypage/activity/inquiry/inquiryWrite.do" class="btn-whitegray small">1:1 상담 문의</a>
				</p>
			</div>
			<div class="helper">
				<strong><small>전화 한통으로 간편하게 주문</small> 컨시어지 서비스</strong>
				<p class="btn-area">
					<a href="/w/cscenter/notice/noticeView.do?noticeIdx=1" class="btn-whitegray small">컨시어지 서비스 문의</a>
				</p>
			</div>
			<div class="sns">
				<strong>모나미 공식 SNS</strong>
				<p class="btn-area">
					<a href="https://www.instagram.com/monami_pet/" target="_blank" class="btn-Instagram" title="인스타그램 새창 열림">인스타그램</a>
					<a href="https://www.facebook.com/monami1960" target="_blank" class="btn-facebook" title="페이스북 새창 열림">페이스북</a>
				</p>
			</div>
		</div>
	</div>
	<div class="cont">
		<div class="inner">
			<span class="logo">monamimall</span>
			<nav>
				<ul>
					<li><a href="http://www.monami.com/about/ceo.php" target="_blank" title="회사소개 새창 열림">회사소개</a></li>
					<li><a href="/w/etc/terms.do">이용약관</a></li>
					<li><a href="/w/etc/privacy.do"><strong>개인정보처리방침</strong></a></li>
					<li><a href="javascript:void(0);" onclick="owScrollYesCenter('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1208108227&apv_perm_no=', '_ftcpopup', '900', '800')">사업자 정보확인</a></li>
					<li><a href="/w/etc/proposal.do">제휴/입점 안내</a></li>
				</ul>
			</nav>
			<div class="familysite">
				<select>
					<option value="">패밀리 사이트</option>
					<option value="http://www.monami.com/">모나미공식사이트</option>
					<option value="http://www.mon-arte.com">모나르떼</option>
					<option value="http://www.monamistation.com">모나미스테이션</option>
					<option value="http://monamiconcept.com/">모나미컨셉스토어</option>
					<option value="http://www.monami.co.kr/art_contest/contest/introduction.asp">모나미환경사랑미술대회</option>
				</select>
			</div>
			<div class="copyright">
				<address>
					(주)모나미 | 대표 : 송하경 | 주소 : 경기도 용인시 수지구 손곡로 17 | 사업자등록번호 : 120-81-08227<br>
					고객센터 : 1544-2884 | 개인정보관리책임자 : 김준혁(monamihelp@monami.com)  | 통신판매업신고 : 제2008-용인수지-0117
				</address>
				<p>
					본 사이트의 모든 저작물의 저작권은 (주)모나미에 있습니다.<br>
					무단 복제나 도용은 저작권법 제 97조 5항에 의해 법으로 금지되어 있습니다.<br>
					<small>Copyright(c) (주)모나미 All rights Reserved.</small>
				</p>

			</div>
			<div class="escrow">
				<strong>이니시스(에스크로) 서비스</strong>
				<p>고객님은 안전거래를 위해 모든 거래 결제 시 <br>저희 쇼핑몰에서 가입한 전자 결제의 <br>매매보호(에스크로) 서비스를 이용하실 수 <br>있습니다.</p>
				<!-- <a href="#" onclick="owScrollYesCenter('https://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=ws_monami', '_upluspopup', '460', '520')">서비스 가입사실 확인 ></a> -->
			</div>
		</div>
	</div>
	<div class="secure">
		<img src="/study/monnami/images/common/footer_secure1.jpg" alt="모나미 공식사이트">
		<img src="/study/monnami/images/common/footer_secure2.jpg" alt="">
		<img src="/study/monnami/images/common/footer_secure3.jpg" alt="">
		<img src="/study/monnami/images/common/footer_secure4.jpg" alt="">
		<img src="/study/monnami/images/common/footer_secure5.jpg" alt="">
		<img src="/study/monnami/images/common/footer_secure6.jpg" alt="">
		<img src="/study/monnami/images//common/footer_secure7.jpg" alt="">
		<img src="/study/monnami/images/common/footer_secure8.jpg" alt="">
		<img src="/study/monnami/images//common/footer_secure9.jpg" alt="">
	</div>
</footer>
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
			localStorage.setItem("monamiSessionId","8AE277E10427719EEBD1C55CEAA1E424");
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