<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 	
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>2단계 회원가입</title>
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


<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/main.css" />
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/product.css" />
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/common.css" />
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/contents.css" />





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


<meta name="decorator" content="default.main"/>
<meta name="bodycss" content="home"/>
<meta name="divcss" content="sub"/>
<script>

	var doneSubmit = false;			// 중복 가입 제한

	$(document).ready(function(){
		createNumeric("#memberHp, #birthDate");
		cfHistoryNoBack();
	});
	
	// 뒤로가기 방지
	function cfHistoryNoBack(){
	    if(window.history) {
	    	window.history.forward(1);   
    	}
	}
	
	// 회원 저장
	function goSave(){
		fn.altErrorClear();
		
		if($.trim($("#memberNm").val()) == ""){
			fn.altError("#memberNm", "이름을 입력해 주세요.");
			$("#memberNm").focus();
			return false;
		}
		
		if(checkBlank($("#memberNm").val()) == false){
			fn.altError("#memberNm", "이름에 공백은 사용할 수 없습니다.");
			$("#memberNm").focus();
			return false;
		}
		
		if(checkNm($("#memberNm").val()) == false){
			fn.altError("#memberNm", "이름은 영문,한글만 사용할 수 있습니다.");
			$("#memberNm").focus();
			return false;
		}
		
		if($.trim($("#memberId").val()) == ""){
			fn.altError("#memberId", "아이디를 입력해 주세요.");
			$("#memberId").focus();
			return false;
		}
		
     	if(checkId($("#memberId").val()) == false){
     		fn.altError("#memberId", "아이디는 5~16자, 영문, 숫자 또는 영문+숫자 조합으로 입력해 주세요.");
     		$("#memberId").focus();
  	  		return false;
     	}
		
		if($("#memberIdChkFlag").val() == "N" || $("#memberIdChk").val() != $("#memberId").val()){
			fn.altError("#memberId", "아이디 중복 확인을 해주세요.");
			alert("아이디 중복 확인을 해주세요.");
			$("#memberId").focus();
			return false;
		}
		
		if($.trim($("#memberPwd").val()) == ""){
			fn.altError("#memberPwd", "비밀번호를 입력해 주세요.");
			$("#memberPwd").focus();
			return false;
		}
		
		if($("#memberPwd").val() == $("#memberId").val()){
			fn.altError("#memberPwd", "아이디와 동일한 비밀번호 입니다.");
			$("#memberPwd").focus();
			return false;
		}
		
		if(checkBlank($("#memberPwd").val()) == false){
			fn.altError("#memberPwd", "비밀번호에 공백은 사용할 수 없습니다.");
			$("#memberPwd").focus();
			return false;
		}
		
	 	if(checkPwd($("#memberPwd").val()) == false){
	 		fn.altError("#memberPwd", "입력한 비밀번호를 확인해 주세요.");
	 		$("#memberPwd").focus();
	 		return false;
	 	}
	 	
		if($.trim($("#memberPwdChk").val()) == ""){
			fn.altError("#memberPwdChk", "비밀번호를 한번더 입력해 주세요.");
			$("#memberPwdChk").focus();
			return false;
		}
		
		if(checkBlank($("#memberPwdChk").val()) == false){
			fn.altError("#memberPwdChk", "비밀번호확인에 공백은 사용할 수 없습니다.");
			$("#memberPwdChk").focus();
			return false;
		}
		
		if($("#memberPwd").val() != $("#memberPwdChk").val()){
			fn.altError("#memberPwdChk", "입력한 비밀번호가 서로 일치하지 않습니다.");
			alert("입력한 비밀번호가 서로 일치하지 않습니다.");
			$("#memberPwdChk").focus();
			return false;
		}
		
		if($.trim($("#memberEmail").val()) == ""){
			fn.altError("#memberEmail", "이메일을 입력해 주세요.");
			$("#memberEmail").focus();
			return false;
		}
		
		if(emailCheck($("#memberEmail").val()) == false){
			fn.altError("#memberEmail", "이메일 주소를 확인해 주세요.");
			$("#memberEmail").focus();
			return false;
		}
		
		if($("#memberEmailChkFlag").val() == "N" || $("#memberEmailChk").val() != $("#memberEmail").val()){
			fn.altError("#memberEmail", "이메일 중복 확인을 해주세요.");
			alert("이메일 중복 확인을 해주세요.");
			$("#memberEmail").focus();
			return false;
		}
		
		if($.trim($("#memberHp").val()) == ""){
			fn.altError("#memberHp", "핸드폰 번호를 입력해 주세요.");
			$("#memberHp").focus();
			return false;
		}
		
 		if(phoneCheck($("#memberHp").val()) ==false){
			fn.altError("#memberHp", "핸드폰 번호를 확인해 주세요.");
			$("#memberHp").focus();
			return false;
		}
		
		if($("#birthDate").val() != ""){
 			if(checkBirthDate($("#birthDate").val()) ==false){
				fn.altError("#birthDate", "생년월일을 확인해 주세요.");
				$("#birthDate").focus();
				return false;
			}
	 		
	 		if(calcAge($("#birthDate").val()) <= 13){
	 			fn.altError("#birthDate", "만 14세 미만은 회원가입할 수 없습니다.");
	 			alert("만 14세 미만은 회원가입할 수 없습니다.");
	 			$("#birthDate").focus();
	 			return false;
	 		}
		}
		
		if($("input:checkbox[id='mailChk']").is(":checked")){
			$("#mailYn").val("Y");
		}else{
			$("#mailYn").val("N");
		}
		
		if($("input:checkbox[id='smsChk']").is(":checked")){
			$("#smsYn").val("Y");
		}else{
			$("#smsYn").val("N");
		}
		
		if(!$("input:checkbox[id='ageChk']").is(":checked")){
			alert("만 14세 이상 체크는 필수 입니다.");
			return false;
		}
		
	 	if(doneSubmit == false){					
	 		doneSubmit = true;
	 		var frm = document.joinForm;
			frm.action = "/study/monnami/member/joinStep03.jsp";
			frm.submit();
	 	}
	}
	
	// 아이디 중복 확인
	
	
	function idDuplicateChk(){

		fn.altErrorClear();
		
		if($.trim($("#memberId").val()) ==""){
			fn.altError("#memberId", "아이디를 입력해 주세요.");
			$("#memberId").focus(); 
			return false;
		}
		
     	if(checkId($("#memberId").val()) == false){
     		fn.altError("#memberId", "아이디는 5~16자, 영문, 숫자 또는 영문+숫자 조합으로 입력해 주세요.");
			$("#memberId").focus(); 
  	  		return false;
     	}
     	
		$.ajax({
			 url: "/study/monnami/member/DuplicateChk.jsp",
			 data : {
				 			"memberId"	:	$("#memberId").val()
				 		},
			 type: "POST",	
			 async: false,
			 contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
			 error: function(request, status, error){ 
			 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			 },
			 success: function(flag){
				 if(Number(flag) > 0){ 
					 $("#memberIdChkFlag").val("N");
					 $("#memberIdChk").val("");
					 fn.altError("#memberId", "이미 사용 중인 아이디입니다.");
					 alert("이미 사용 중인 아이디입니다.");
					 $("#memberId").focus();
				 }else{
					 $("#memberIdChkFlag").val("Y");
					 $("#memberIdChk").val($("#memberId").val());
					 alert("사용가능한 아이디 입니다.");
				 }
			 }
		});
		
			
		}
		

	
	// 이메일 중복 확인
	function emailDuplicateChk(){
		fn.altErrorClear();
		
		if($.trim($("#memberEmail").val()) == ""){
			fn.altError("#memberEmail", "이메일을 입력해 주세요.");
			$("#memberEmail").focus();
			return false;
		}
		
		if(emailCheck($("#memberEmail").val()) == false){
			fn.altError("#memberEmail", "이메일 주소를 확인해 주세요.");
			$("#memberEmail").focus();
			return false;
		}
		
		$.ajax({
			 url: "/w/ajax/member/emailDuplicateChkAjax.do",
			 data : {
				 			"memberEmail"	:	$("#memberEmail").val()
				 		},
			 type: "POST",	
			 async: false,
			 cache: false,
			 contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
			 error: function(request, status, error){ 
			 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			 },
			 success: function(flag){
				 if(Number(flag) >0){ 
					 $("#memberEmailChkFlag").val("N");
					 $("#memberEmailChk").val("");
					 fn.altError("#memberEmail", "이미 사용 중인 이메일입니다.");
					 alert("이미 사용 중인 이메일입니다.");
					 $("#memberEmail").focus();
				 }else{
					 $("#memberEmailChkFlag").val("Y");
					 $("#memberEmailChk").val($("#memberEmail").val());
					 alert("사용가능한 이메일 입니다.");
				 }
			 }
		});
	}
	
	// 취소
	function goCancel(){
		if(confirm("입력된 회원정보가 초기화됩니다. 이동하시겠습니까?") == true){
	 		var frm = document.joinForm;
			frm.action = "/study/monnami/member/joinStep01.jsp";
			frm.submit();
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

		<div class="join-step2">
			<div class="step">
				<span>STEP1. 약관동의</span>
				<span class="active">STEP2. 회원정보 입력 <span class="hide">현재위치</span></span>
				<span>STEP3. 가입완료</span>
			</div>

			<form name="joinForm" method="post" onsubmit="return false;">
				<input type="hidden" name="joinFlag" value="N">
				<input type="hidden" name="targetCode" id="targetCode" value="">
				<input type="hidden" name="rteDevice" id="rteDevice" value="">
				<input type="hidden" name="joinType" value="I">
				<input type="hidden" name="memberIdChkFlag" id="memberIdChkFlag" value="N"/>
				<input type="hidden" name="memberIdChk" id="memberIdChk" value="">
				<input type="hidden" name="memberEmailChkFlag" id="memberEmailChkFlag" value="N"/>
				<input type="hidden" name="memberEmailChk" id="memberEmailChk" value="">
				<input type="hidden" name="mailYn" id="mailYn" value="">
				<input type="hidden" name="smsYn" id="smsYn" value="">
			
				<fieldset class="joinform-field">
					<legend class="hide">회원정보 입력</legend>
					<h3>회원기본정보</h3>
					<p class="txt-need"><em>*<span class="hide">필수</span></em> 표시는 반드시 입력하셔야 하는 항목 입니다.</p>
					<ul>
						<li>
							<label>
								<strong>이름<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<input type="text" name="memberNm" id="memberNm" placeholder="이름 입력" title="이름 입력" maxlength="10">
							</label>
						</li>
						<li>
							<label>
								<strong>아이디<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<input type="text" class="in-id" name="memberId" id="memberId" placeholder="5~16자, 영문, 숫자 또는 영문+숫자 조합" title="아이디 입력" maxlength="16">
							</label>
							<button type="button" class="btn-white" onclick="idDuplicateChk();">중복확인</button>
						</li>
						<li>
							<label>
								<strong>비밀번호<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<input type="password" name="memberPwd" id="memberPwd" placeholder="영문/숫자/특수문자 중 2가지 조합, 6~16자 이내" title="비밀번호 입력" maxlength="16">
							</label>
							<ul class="infotxt">
								<li>6~16자 이내, 영문 대/소문자, 숫자, 특수문자 중 2가지 조합으로 사용해주세요.<br>가능 특수문자 :  ! @ # $ % ^ ? _ ~</li>
								<li>아이디와 동일한 비밀번호는 사용할 수 없습니다.</li>
							</ul>
						</li>
						<li>
							<label>
								<strong>비밀번호확인<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<input type="password" id="memberPwdChk" placeholder="비밀번호 재입력" title="비밀번호확인 입력" maxlength="16">
							</label>
						</li>
						<li>
							<label>
								<strong>이메일<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<input type="text" class="in-email" name="memberEmail" id="memberEmail" placeholder="이메일 입력" title="이메일 입력" maxlength="50">
							</label>
							<button type="button" class="btn-white" onclick="emailDuplicateChk();">중복확인</button>
						</li>
						<li>
							<label>
								<strong>휴대폰번호<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<input type="text" name="memberHp" id="memberHp" placeholder="숫자만 입력(11자리)" title="휴대폰번호 입력" maxlength="11">
							</label>
						</li>
						<li class="bar">
							<label>
								<strong>생년월일</strong>
								<input type="text" name="birthDate" id="birthDate" placeholder="숫자만 입력(8자리)" title="생년월일 입력" maxlength="8">
							</label>
						</li>
						<li>
							<div class="txt-agree">
								<strong>수신동의</strong>
								<label><input type="checkbox" class="small" id="smsChk"><span> SMS를 통한 상품 및 이벤트 정보 수신에 동의 합니다. [선택]</span></label>
								<label><input type="checkbox" class="small" id="mailChk"><span> 이메일을 통한 상품 및 이벤트 정보 수신에 동의 합니다. [선택]</span></label>
								<ul class="infotxt">
									<li>SMS 및 이메일 수신동의와 무관하게 주문결제/회원 관련 안내 메일/문자는 발송되며 <br>수신미동의 시 쇼핑몰 이용에 제약은 없습니다.</li>
								</ul>
							</div>
						</li>
					</ul>
					<p>
						<label><input type="checkbox" class="small" id="ageChk"><span>만 14세 이상입니다.</span></label><br>
						<em>*</em>14세 미만의 어린이는 보호자 계정의 마이페이지> 회원정보수정에서 등록할 수 있습니다.
					</p>

					<div class="btn-area">
						<button type="button" class="btn-white" onclick="goCancel();">취소</button>
						<button type="button" class="btn-black" onclick="goSave();">확인</button>
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
		<img src="/study/monnami/images/common/footer_secure7.jpg" alt="">
		<img src="/study/monnami/images/common/footer_secure8.jpg" alt="">
		<img src="/study/monnami/images/common/footer_secure9.jpg" alt="">
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
			localStorage.setItem("monamiSessionId","B4F1D32732E5E8E757B059E80AC86E78");
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