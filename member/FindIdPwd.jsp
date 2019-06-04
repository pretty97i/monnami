<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 	
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>ID/PW 찾기</title>
<jsp:include page="../monnamiTop.jsp" /><!-- 상단 설화꺼 불러오기-->
<meta charset="UTF-8" />
<meta http-equiv="p3p" content='CP="CAO PSA CONi OTR OUR DEM ONL" '>
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

<script src="src="<%=cp %>/monnami/js/commonScript.js"></script>
<script src="src="<%=cp %>/monnami/js//w/cart.js"></script>

<!-- 네이버유입스크립트 -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript"> 
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
</script>


<meta name="decorator" content="default.main" />
<meta name="bodycss" content="home"/>
<meta name="divcss" content="sub"/>
<script>

	$(document).ready(function(){
		$("#memberNm1, #memberEmail1").keydown(function(key){
			if(key.keyCode == 13){
				findIdCheck();
			}
		});
		$("#memberId, #memberNm2, #memberEmail2").keydown(function(key){
			if(key.keyCode == 13){
				findPwdCheck();
			}
		});
	});

	// 아이디 찾기
	function findIdCheck(){
		fn.altErrorClear();
		
		if($.trim($("#memberNm1").val()) ==""){
			fn.altError("#memberNm1", "이름을 입력해 주세요.");
			$("#memberNm1").focus(); 
			return false;
		}
		
		if($.trim($("#memberEmail1").val()) ==""){ 
			fn.altError("#memberEmail1", "이메일을 입력해 주세요.");
			$("#memberEmail1").focus(); 
			return false;
		}
		
		$.ajax({
			 url: "/w/ajax/login/findMemberIdAjax.do",
			 data : {
				 			"memberNm"			: $("#memberNm1").val(), 
				 			"memberEmail"		: $("#memberEmail1").val() 
				 		},
			 type: "POST",	
			 async: false,
			 cache: false,
			 contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
			 error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 },
			 success: function(map){ 
	 			if(map.flag == "I"){
	 				var memberId = map.info.memberId;
		 			var str="";
		 			
			 		for(var i=0; i<memberId.length-3; i++){
			 			str +="*";
			 		}
			 		
			 		var targetCode = "";
				 	var html = "";
				 	
					html += "<p>회원님의 아이디는 <strong>"+memberId.substr(0,3)+str+"(가입일 " +map.info.regDt+")</strong> 입니다.</p>";
					html += "<button type='button' class='btn-black big' onclick=\"location.href='/w/login/loginPage.do'\">로그인</button>";
					
					if(targetCode == "MALL_20"){	 	// 모나르떼 타켓 링크
						html += "<button type='button' class='btn-black big' onclick=\"location.href='https://www.mon-arte.com'\">모나르떼에서 로그인</button>";
					}
					
					$("#resultIdText").html(html);
					fn.toggleClass('.searchid');
					fn.toggleClass('.result.id');
				 }else if(map.flag == "S"){
					 alert("SNS 회원입니다.");
						return false;					 
				 }else{
					 alert("가입되지 않은 회원입니다.");
					return false;
				 }
			 }
		});
	}
	
	// 비밀번호 찾기
	function findPwdCheck(){
		fn.altErrorClear();
		
		if($.trim($("#memberId").val()) ==""){
			fn.altError("#memberId", "아이디를 입력해 주세요.");
			$("#memberId").focus(); 
			return false;
		}
		
		if($.trim($("#memberNm2").val()) ==""){ 
			fn.altError("#memberNm2", "이름을 입력해 주세요.");
			$("#memberNm2").focus(); 
			return false;
		}
		
		if($.trim($("#memberEmail2").val()) ==""){ 
			fn.altError("#memberEmail2", "이메일을 입력해 주세요.");
			$("#memberEmail2").focus(); 
			return false;
		}
		
		$.ajax({
			 url: "/w/ajax/login/findMemberPwdAjax.do",
			 data : {
				 			"memberId"			:	$("#memberId").val(),
				 			"memberNm"			:	$("#memberNm2").val(), 
				 			"memberEmail"		:	$("#memberEmail2").val()
				 		},
			 type: "POST",	
			 async: false,
			 cache: false,
			 contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
			 error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 },
			 success: function(map){ 
				 if(map.flag =="I"){
					 var memberEmail = map.info.memberEmail;
					 var splitEmail = memberEmail.split("@");
					 var str="";
					 
					 for(var i=0; i<splitEmail[0].length-3; i++){
						 str +="*";
					 }
					 
				 	var targetCode = "";
				 	var html = "";
				 	
					html += "<p>회원님의 이메일 주소 <strong>"+splitEmail[0].substr(0,3)+str+"@"+splitEmail[1]+"</strong>로 임시비밀번호가 발송되었습니다.</p>";
					html += "<button type='button' class='btn-black big' onclick=\"location.href='/w/login/loginPage.do'\">로그인</button>";
					
					if(targetCode == "MALL_20"){	 	// 모나르떼 타켓 링크
						html += "<button type='button' class='btn-black big' onclick=\"location.href='https://www.mon-arte.com'\">모나르떼에서 로그인</button>";
					}
					
					$("#resultPwdText").html(html);
					fn.toggleClass('.searchpw');
					fn.toggleClass('.result.pw');
				 }else if(map.flag =="S"){
					 	alert("SNS 회원입니다.");
						return false;
				 }else{
				 	alert("가입되지 않은 회원입니다.");
					return false;
				 }
			 }
		});
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
					<li class="monamipet">
						<a href="/w/petMain.do"><span>MonamiPet</span></a>
						<div class="subnav">
							<ul>
							<li>
									<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2"><span>DOG</span></a>
									<ul>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3"><span>골라먹는 즐거움</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=4"><span>사료 전연령용</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=11"><span>사료- 자견용 (퍼피)</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=18"><span>사료- 성견용 (어덜트)</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=25"><span>사료- 노견용 (시니어)</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=28"><span>간식</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=36"><span>영양제</span></a></li>
											</ul>										
										</li>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43"><span>내 친구의 공간</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=44"><span>위생/배변</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=53"><span>하우스/이동장/울타리</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=60"><span>줄/이름표</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=64"><span>급식기/급수기</span></a></li>
											</ul>										
										</li>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=69"><span>내 친구의 작은 옷장</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=69&schCateIdx4=70"><span>의류</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=69&schCateIdx4=76"><span>미용/목욕</span></a></li>
											</ul>										
										</li>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=83"><span>신나는 하루</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=83&schCateIdx4=84"><span>장난감</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=83&schCateIdx4=473"><span>작가의 솜씨</span></a></li>
											</ul>										
										</li>
									</ul>
								</li>
							<li>
									<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93"><span>CAT</span></a>
									<ul>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94"><span>골라먹는 즐거움</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=95"><span>사료 전연령용</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=102"><span>사료- 자묘용(키튼)</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=109"><span>사료- 성묘용 (어덜트)</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=116"><span>사료- 노묘용 (시니어)</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=119"><span>간식</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=127"><span>영양제</span></a></li>
											</ul>										
										</li>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134"><span>내 친구의 공간</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=135"><span>모래/화장실/패드</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=144"><span>하우스/이동장/울타리</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=151"><span>스크래쳐/캣타워</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=155"><span>급식기/급수기</span></a></li>
											</ul>										
										</li>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=160"><span>내 친구의 작은 옷장</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=160&schCateIdx4=167"><span>미용/목욕/위생/액세서리</span></a></li>
											</ul>										
										</li>
									<li>
										<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=174"><span>신나는 하루</span></a>
										<ul>
										<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=174&schCateIdx4=175"><span>장난감</span></a></li>
											<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=174&schCateIdx4=474"><span>작가의 솜씨</span></a></li>
											</ul>										
										</li>
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
			<li class="monamipet">
				<a href="/w/petMain.do"><span><small>모나미펫</small>MonamiPet</span></a>
				<div class="subnav">
					<ul>
						<li>
									<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2"><span>DOG</span></a>
									<ul>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3"><span>골라먹는 즐거움</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=4"><span>사료 전연령용</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=11"><span>사료- 자견용 (퍼피)</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=18"><span>사료- 성견용 (어덜트)</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=25"><span>사료- 노견용 (시니어)</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=28"><span>간식</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=3&schCateIdx4=36"><span>영양제</span></a></li>
													</ul>										
											</li>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43"><span>내 친구의 공간</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=44"><span>위생/배변</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=53"><span>하우스/이동장/울타리</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=60"><span>줄/이름표</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=43&schCateIdx4=64"><span>급식기/급수기</span></a></li>
													</ul>										
											</li>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=69"><span>내 친구의 작은 옷장</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=69&schCateIdx4=70"><span>의류</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=69&schCateIdx4=76"><span>미용/목욕</span></a></li>
													</ul>										
											</li>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=83"><span>신나는 하루</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=83&schCateIdx4=84"><span>장난감</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2&schCateIdx3=83&schCateIdx4=473"><span>작가의 솜씨</span></a></li>
													</ul>										
											</li>
											</ul>	
								</li>							
							<li>
									<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93"><span>CAT</span></a>
									<ul>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94"><span>골라먹는 즐거움</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=95"><span>사료 전연령용</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=102"><span>사료- 자묘용(키튼)</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=109"><span>사료- 성묘용 (어덜트)</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=116"><span>사료- 노묘용 (시니어)</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=119"><span>간식</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=94&schCateIdx4=127"><span>영양제</span></a></li>
													</ul>										
											</li>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134"><span>내 친구의 공간</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=135"><span>모래/화장실/패드</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=144"><span>하우스/이동장/울타리</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=151"><span>스크래쳐/캣타워</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=134&schCateIdx4=155"><span>급식기/급수기</span></a></li>
													</ul>										
											</li>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=160"><span>내 친구의 작은 옷장</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=160&schCateIdx4=167"><span>미용/목욕/위생/액세서리</span></a></li>
													</ul>										
											</li>
											<li>
												<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=174"><span>신나는 하루</span></a>
												<ul>
												<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=174&schCateIdx4=175"><span>장난감</span></a></li>
													<li><a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=93&schCateIdx3=174&schCateIdx4=474"><span>작가의 솜씨</span></a></li>
													</ul>										
											</li>
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
			<li class="monarte">
				<a href="/w/monarteMain.do"><span><small>모나르떼</small>Monarte</span></a>
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
	<main id="contents" class="member idpwsearch">
		<h2>아이디/비밀번호 찾기</h2>
		<div class="tab-area">
			<div class="tab-menu">
				<a href="#idSearch" class="active">아이디 찾기</a>
				<a href="#pwSearch">비밀번호 찾기</a>
			</div>
			<div id="idSearch" class="tab-contents on">
				<div class="searchid active">
					<form>
						<fieldset class="login-field">
							<legend class="hide">아이디 찾기</legend>
							<label><strong>이름</strong><input type="text" id="memberNm1" placeholder="이름 입력" title="이름 입력" maxlength="10"></label>
							<label><strong>이메일</strong><input type="text" id="memberEmail1" placeholder="이메일 입력" title="이메일 입력" maxlength="50"></label>
							<button type="button" class="btn-black big" onclick="findIdCheck();">아이디 찾기</button>
						</fieldset>
					</form>
					<ul class="infotxt">
						<li>가입 당시 입력한 이름, 이메일로 아이디 일부를 확인할 수 있습니다.</li>
						<li>아이디를 찾기 못하셨다면 고객센터(1544-2884)로 문의해 주세요.</li>
					</ul>
				</div>
				<div class="result id" id="resultIdText"></div>
			</div>
			<div id="pwSearch" class="tab-contents">
				<div class="searchpw active">
					<form>
						<fieldset class="login-field">
							<legend class="hide">비밀번호 찾기</legend>
							<label id=idChk><strong>아이디</strong><input type="text" id="memberId" placeholder="아이디 입력" title="아이디 입력" maxlength="20"></label>
							<label id="nmChk2"><strong>이름</strong><input type="text" id="memberNm2" placeholder="이름 입력" title="이름 입력" maxlength="10"></label>
							<label id="emailChk2"><strong>이메일</strong><input type="text" id="memberEmail2" placeholder="이메일 입력" title="이메일 입력" maxlength="50"></label>
							<button type="button" class="btn-black big" onclick="findPwdCheck();">비밀번호 찾기</button>
						</fieldset>
					</form>
					<ul class="infotxt">
						<li>회원 가입시 입력한 이메일로  임시비밀번호를 발송해드립니다.</li>
						<li>로그인 후, 마이페이지 > 회원정보수정에서 비밀번호를 수정해주세요.</li>
						<li>비밀번호 찾기에 어려움이 있으시면 고객센터(1544-2884)로 문의해 주세요.</li>
					</ul>
				</div>
				<div class="result pw" id="resultPwdText"></div>
			</div>
		</div>
	</main>
<hr/>





<jsp:include page="/monnami/monnamiBottom.jsp"></jsp:include>

</body>
</html>