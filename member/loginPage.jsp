<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 	
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
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

<script src="<%=cp %>/monnami/js/commonScript.js"></script>
<script src="<%=cp %>/monnami/js/cart.js"></script>

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


<meta name="decorator" content="default.main"/>
<meta name="bodycss" content="home"/>
<meta name="divcss" content="sub"/>
<script>

	$(function(){
		if("" == "N"){
			$("#memberTab").removeClass("active");
			$("#member").removeClass("active").css("display","none");
			$("#nomemberTab").addClass("active");
			$("#nomember").addClass("active").css("display","block");
		}else{
			$("#nomemberTab").removeClass("active");
			$("#nomember").removeClass("active").css("display","none");
			$("#memberTab").addClass("active");
			$("#member").addClass("active").css("display","block");
		}
	});

	$(document).ready(function(){
		createNumeric("#senderHp");
		
		$("#memberId, #memberPwd").keydown(function(key){
			if(key.keyCode == 13){
				goLoginCheck("1");
			}
		});
		
		var targetCode = "";				// 모나르떼 타켓 코드
		var dormancyYn =	"";			// SNS 회원 휴면 상태 값
		
		if(targetCode == "MALL_10"){
			fn.popupOpen("#popPwdChange");				// 비밀번호 변경 레이어 팝업
		}
		
		if(targetCode == "MALL_30" || dormancyYn == "Y") {
			fn.popupOpen("#popDormancy");					// 휴면계정 레이어 팝업
		}
	});
	
 	// 로그인 체크
 	function goLoginCheck(type){
 		var fromOrderFlag =  "";
 		
 		//  type 값  1 : 회원, 2 : 비회원
 		if(type == 1){
 			fn.altErrorClear();
 			
			if($("input[name=cookieIdCheck]:checked").length > 0){
				$("#saveMemberIdFlag").val("Y");
			}else{
				$("#saveMemberIdFlag").val("N");
			}
			
			if($.trim($("#memberId").val()) == ""){
				fn.altError("#memberId", "아이디를 입력해 주세요.");
				$("#memberId").focus();
				return false;
			}
			
			if($.trim($("#memberPwd").val()) == ""){ 
				fn.altError("#memberPwd", "비밀번호를 입력해 주세요.");
				$("#memberPwd").focus();
				return false;
			}
			
			$.ajax({
			 	url : "/w/ajax/login/loginCheckAjax.do",
				data : {
								"memberId"					:	$("#memberId").val(),
								"memberPwd"				:	$("#memberPwd").val(),
								"joinType"						:	"I",
								"saveMemberIdFlag"		:	$("#saveMemberIdFlag").val()
							},
				 type : "POST",	
				 async : false,
				 cache : false,	 		
				 contentType : "application/x-www-form-urlencoded; charset=UTF-8",  
				 error : function(request, status, error){ 
				 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				 },
				 success : function(flag){
					 if(flag == 0 || flag == 2){
						 alert("등록되지 않은 아이디이거나\n아이디 또는 비밀번호를 잘못 입력하셨습니다.");
					 }else if(flag == 1){
						 alert("탈퇴한 아이디 입니다.");
					 }else if(flag == 3){
						 fn.popupOpen("#popDormancy");					// 휴면계정 레이어 팝업
					 }else if(flag == 4){
						 fn.popupOpen("#popPwdChange");				// 비밀번호 변경 레이어 팝업
					 }else if(flag == 5){
						 fn.popupOpen("#popNormalMember");		// 만14세 이상 회원전환 레이어 팝업
					 }else{
				 		var refererUrl = "";		// 이전 페이지 URL
				 		
				 		var domainUrl = location.host;		// bill 도메인 임시 추가
				 		
				 		if("LIVE" == "LIVE" || "LIVE" == "DEV"){
				 			if(domainUrl != "bill.monamimall.com"){					// bill 도메인 임시 추가
				 				if(fromOrderFlag == "Y"){
									var frm = document.orderForm;
									frm.action="/w/order/cartOrderProc.do";
									frm.submit();
								 }else{
					 				$("#refererUrl").val(refererUrl);
						 			var frm = document.loginForm;
									frm.action = "/w/login/ssoLogin.do";
									frm.submit();
								 }
					 		}else{
								 if(refererUrl == ""){
									 location.href = "/w/main.do";
								 }else{
								 	location.href = refererUrl;
								 }
					 		}
				 		}else{
							 if(fromOrderFlag == "Y"){
									var frm = document.orderForm;
									frm.action="/w/order/cartOrderProc.do";
									frm.submit();
							 }else{
								 var refererUrl = "";		// 이전 페이지 URL
								 
								 if(refererUrl == ""){
									 location.href = "/w/main.do";
								 }else{
								 	location.href = refererUrl;
								 }
							 }
				 		}
				 		
// 				 		if("LIVE" == "DEV"){
// 			 				$("#refererUrl").val(refererUrl);
// 				 			var frm = document.loginForm;
// 							frm.action = "/w/login/ssoLogin.do";
// 							frm.submit();
// 				 		}else{
// 							 if(refererUrl == ""){
// 								 location.href = "/w/main.do";
// 							 }else{
// 							 	location.href = refererUrl;
// 							 }
// 				 		}
					 }
				 }
			});
 		}else{
 			fn.altErrorClear();
 			
			if($.trim($("#senderNm").val()) == ""){
				fn.altError("#senderNm", "주문자명을 입력해 주세요.");
				$("#senderNm").focus();
				return false;
			}
			
			if($.trim($("#orderNo").val()) == ""){ 
				fn.altError("#orderNo", "주문번호를 입력해 주세요.");
				$("#orderNo").focus();
				return false;
			}
			
			if($.trim($("#senderHp").val()) == ""){ 
				fn.altError("#senderHp", "휴대폰 번호를 입력해 주세요.");
				$("#senderHp").focus();
				return false;
			}
			
			if(phoneCheck($("#senderHp").val()) == false){
				fn.altError("#senderHp", "잘못된 휴대폰 번호입니다.");
				$("#senderHp").focus();
				return false;
			}
			
			$.ajax({
			 	url : "/w/ajax/login/noLoginChk.do",
				data : {
								"senderNm"	:	$("#senderNm").val(),
								"orderNo"		:	$("#orderNo").val(),
								"senderHp"		:	$("#senderHp").val()			
							},
				 type : "POST",	
				 async : false,
				 cache : false,	 		
				 contentType : "application/x-www-form-urlencoded; charset=UTF-8",  
				 error : function(request, status, error){ 
				 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				 },
				 success : function(flag){
					 if(flag == 0){
						 $("#senderNm").val("");
						 $("#orderNo").val("");
						 $("#senderHp").val("");
						 alert("요청하신 정보가 없습니다.");
					 }else{
						 location.href = "/w/mypage/order/main.do";
					 }
				 }
			});
 		}
 	}
 	
	// 6개월후 비밀번호 변경
	function nextChangePwd(){
		var targetCode = "";
		
		if(targetCode == "MALL_10"){
			var frm = document.rteForm;
		}else{
			var frm = document.loginForm;
		}
		frm.action = "/w/login/changePwdDtUpdate.do";
		frm.submit();
	}
	
	// 비밀번호 변경
	function changePwd(){
		var targetCode = "";
		
		if(targetCode == "MALL_10"){
			var frm = document.rteForm;
		}else{
			var frm = document.loginForm;
		}
		frm.action = "/w/login/changePwd.do";
		frm.submit();	
	}
	
	// 휴면해제신청
	function dormancyRelease(){
		var targetCode = "";
		var submitFlag = "N";
		var dormancyYn =	"";
		var memberId;
		
		if(targetCode == "MALL_30" || dormancyYn == "Y"){
			memberId = "";
		}else{
			memberId = $("#memberId").val();
		}
		
		$.ajax({
		 	url : "/w/ajax/login/dormancyReleaseChk.do",
			data : {
							"memberId"	:	memberId
						},
			 type : "POST",	
			 async : false,
			 cache : false,	 		
			 contentType : "application/x-www-form-urlencoded; charset=UTF-8",  
			 error : function(request, status, error){ 
			 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			 },
			 success : function(flag){
				 if(flag > 0){
					 alert("휴면해제는 법정대리인만 가능합니다.");
					 submitFlag = "N"
					 fn.popupClose("#popDormancy");
					 return false;
				 }else{
					 submitFlag = "Y"
				 }
			 }
		});
		
		if(submitFlag == "Y"){
			if(dormancyYn == "Y"){		
				$("#joinType").val("");
				$("#snsCode").val("");
				$("#memberId").val("");
			}else{						
				$("#joinType").val("I");
			}
			
			if(targetCode == "MALL_30"){
				var frm = document.rteForm;
			}else{
				var frm = document.loginForm;
			}
			
			frm.action = "/w/login/dormancyReleaseUpdate.do";
			frm.submit();
		}
	}
	
	// 14세이상 회원 전환
	function memberTransition(){
		var submitFlag = "N";
		
		$.ajax({
		 	url : "/w/ajax/login/transitionChk.do",
			data : {
							"memberId"	:	$("#memberId").val(),
							"transitionChkFlag"	:	"Y"
						},
			 type : "POST",	
			 async : false,
			 cache : false,	 		
			 contentType : "application/x-www-form-urlencoded; charset=UTF-8",  
			 error : function(request, status, error){ 
			 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			 },
			 success : function(resultYn){
				 if(resultYn == "Y"){
					 alert("학습이 진행중이므로 일반 회원 전환이 불가능 합니다.");
					 submitFlag = "N"
					 return false;
				 }else{
					 submitFlag = "Y"
				 }
			 }
		});
		
		if(submitFlag == "Y"){
			$("#joinFlag").val("T");
			var frm = document.loginForm;
			frm.action = "/w/member/joinStep02.do";
			frm.submit();
		}
	}
	

	
	// 14세이상 전환 취소시 로그인
	function memberTransitionLogin(){
		var frm = document.loginForm;
		frm.action="/w/login/memberTransitionLogin.do";
		frm.submit();
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
	<main id="contents" class="member login">
		<h2>로그인</h2>
		<div class="tab-area">
			
			
			
			<div class="tab-menu">
				<a href="#member" id="memberTab" class="active" >회원</a>
			
			</div>
			<div id="member" class="tab-contents on">
				<form name="loginForm" id="loginForm" method="post" onsubmit="return false;">
					<input type="hidden" name="saveMemberIdFlag" id="saveMemberIdFlag" value=""/>
					<input type="hidden" name="joinType" id="joinType"  value=""/>
					<input type="hidden" name="joinFlag" id="joinFlag" value=""/>
					<input type="hidden" name="memberFlag" id="memberFlag" value=""/>
					<input type="hidden" name="snsCode" id="snsCode"  value=""/>
					<input type="hidden" name=loginPath id="loginPath"  value="loginPage"/>
					<input type="hidden" name=refererUrl id="refererUrl" value=""/>
					
					<fieldset class="login-field">
						<legend class="hide">회원</legend>
						<label><strong>아이디</strong><input type="text" name="memberId" id="memberId" value="" placeholder="아이디 입력" title="아이디 입력"></label>
						<label><strong>비밀번호</strong><input type="password" name="memberPwd" id="memberPwd" placeholder="비밀번호 입력" title="비밀번호 입력"></label>
						<label><input type="checkbox" class="small" name="cookieIdCheck" id="cookieIdCheck" ><span>아이디 저장</span></label>
						<button type="button" class="btn-black big" onclick="goLoginCheck('1');">로그인</button>
					</fieldset>
				</form>
				<ul class="etc-list">
					<li><a href="/study/monnami/member/FindIdPwd.jsp">아이디 찾기</a></li>
					<li><a href="/study/monnami/member/FindIdPwd.jsp#pwSearch">비밀번호 찾기</a></li>
					<li><a href="/study/monnami/member/join.jsp"><strong>회원가입</strong></a></li>
				</ul>
				
			</div>
			<div id="nomember" class="tab-contents">

				<ul class="infotxt">
					
					<li>주문자명, 주문번호, 휴대폰 번호로 주문내역을 확인할 수 있습니다.</li>
					<li>주문번호를 잊으셨다면 고객센터 (1544-2884)로 문의하여 주십시오.</li>
				</ul>
			</div>
			
			
			
		</div>
	</main>

	<!-- 휴면계정안내 -->
	<div id="popDormancy" class="popup popdormancy">
		<div class="popinner">
			<header class="header">
				<h2 class="tit">휴면계정안내</h2>
				<button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>
			</header>
			<div class="contents">
				<p class="txt">
					회원님은 최근 7개월간 <br>로그인 이력이 없어 휴면상태로 전환되었습니다.<br>
					<small>휴면계정을 해제하시려면 아래의 ‘휴면해제신청‘버튼을 선택해 주세요.</small>
				</p>
				<div class="btn-area">
					<button type="button" class="btn-black medium" onclick="dormancyRelease();">휴면해제신청</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 휴면계정안내 -->

	<!-- 비밀번호 변경안내 -->
	<div id="popPwdChange" class="popup poppwchange">
		<div class="popinner">
			<header class="header">
				<h2 class="tit">비밀번호 변경안내</h2>
				<button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>
			</header>
			<div class="contents">
				<p class="txt">
					안전한 개인정보 보호를 위해 <br>모나미몰 비밀번호 변경 권장 안내 드립니다.<br>
				</p>
				<div class="info">
					<ul class="infotxt">
						<li>비밀번호를 변경 하신지 6개월 지난 경우 개인정보 보호를 위해 비밀번호 변경안내를 드리고 있습니다.</li>
						<li>6개월 동안 이 페이지를 보고 싶지 않으신 분은 [6개월 후 변경]버튼을 클릭 하시기 바랍니다.</li>
					</ul>
				</div>
				<div class="btn-area">
					<button type="button" class="btn-white medium" onclick="nextChangePwd();">6개월 후 변경</button>
					<button type="button" class="btn-black medium" onclick="changePwd();">지금비밀번호변경</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 비밀번호 변경안내 -->

	<!-- 14세 이상 회원전환 안내 -->
	<div id="popNormalMember" class="popup popnormalmember">
		<div class="popinner">
			<header class="header">
				<h2 class="tit">14세 이상 회원전환 안내</h2>
				<button type="button" class="btn-close" onclick="memberTransitionLogin();">닫기</button>
			</header>
			<div class="contents">
				<p class="txt1">
					회원님은 만14세가 경과되어 일반회원으로 전환이 가능합니다.<br>
					일반회원으로 전환하면 모나미몰의 다양한 서비스를 이용할 수 있습니다.
				</p>
				<div class="info">
					<strong>일반회원 전환 시 확인 사항</strong>
					<ol class="infotxt">
						<li>1. 일반회원으로 미 전환 시  모나미몰 쇼핑 서비스 제약을 받습니다.</li>
						<li>2. 모나르떼 회원인 경우, 학습 진행 중이면 일반회원 전환이 불가능 합니다.<br>일반회원으로 전환할 경우 본인의 과거 학습 이력은 확인 할 수 없습니다.</li>
					</ol>
				</div>
				<p class="txt2">모나미몰 일반회원으로 전환하시겠습니까?</p>

				<div class="btn-area">
					<button type="button" class="btn-white medium" onclick="memberTransitionLogin();">취소</button>
					<button type="button" class="btn-black medium" onclick="memberTransition();">동의</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 14세 이상 회원전환 안내 -->

	

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
			localStorage.setItem("monamiSessionId","367462CECBAD29571B6470BA8F3067D9");
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
<script type="text/javascript"> 
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_22b1f65c4041";
	if (!_nasa) var _nasa={};
	wcs.inflow();
	wcs_do(_nasa);
</script></div>
</body>
</html>