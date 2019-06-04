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
<title>모나미 공식 쇼핑몰 모나미몰</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="format-detection" content="telephone=no, email=no, address=no">
<meta name="keywords" content="" />
<meta name="description" content="문구, 모나미펫, 크래프트&하비, 모나르떼를 통합한 라이프스타일 편집샵" />



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

<script>

	$(document).ready(function(){
		settingInit();  // 설정정보 초기화
		dataInit();     // 데이터로딩 및 변수 초기화
		displayInit();  // 메뉴, 목록 표시
		btnInit();
	});
	
	function settingInit() {
		// javascript 로그를 확인하고 싶은경우 true, 로그표시를 없애려면 false;
		_ut.setDevMode(false);

		// Context root 설정
		_da.setContext("/w");
		
		// 이미지 경로 설정
		_da.setImgDomain("https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer");
		
		// 한페이지 row 갯수 설정
		_da.setData("ROWCNT_PERPAGE", 10);
		
		_da.setData("type","TODO");
		
		// 작성가능 상품리뷰 목록 초기 페이지
		_da.setData("TODO_PAGE", "1");
		
		//나의상품리뷰 목록 표시
		_da.setData("DONE_PAGE", "1");
	}
	
	function dataInit() {
		_ut.log("dataInit");
		// Ajax 호출 초기화
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/mypage/activity/review/reviewListAjax.do";

		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			if(_.isObject(retObj)) {
				_ut.log("dataInit : retObj ====", retObj);
				
				//작성가능 상품리뷰 목록 
				if(_.isArray(retObj.goodsReviewTodoList)) { _da.setData("goodsReviewTodoList", retObj.goodsReviewTodoList); }
				
				//나의상품리뷰 목록 
				if(_.isArray(retObj.goodsReviewDoneList)) { _da.setData("goodsReviewDoneList", retObj.goodsReviewDoneList); }
			}
		});
		
		_ut.log("DATA_LIST ======", _da.DATA_LIST);
	}
	
	function displayInit() {
		_ut.log("displayInit");
		
		if(_da.getData("type") === "TODO") {
			goPage("TODO", _da.getData("TODO_PAGE"));
		}
		
		if(_da.getData("type") === "DONE") {
			
			goPage("DONE", _da.getData("DONE_PAGE"));
		}
	}
	
	
	function setMenu(type) {
		if(!_.isString(type)) return false;
		if(type === "TODO") {
			if($("#menuTitle2").hasClass("active")) {
				$("#menuTitle2").removeClass("active");
				$("#menu2").removeClass("active");
				if(!$("#menuTitle1").hasClass("active")) {
					$("#menuTitle1").addClass("active");
					$("#menu1").addClass("active");
				}
			}else{
				if(!$("#menuTitle1").hasClass("active")) {
					$("#menuTitle1").addClass("active");
					$("#menu1").addClass("active");
				}
			}
		}
		
		if(type === "DONE") {
			if($("#menuTitle1").hasClass("active")) {
				$("#menuTitle1").removeClass("active");
				$("#menu1").removeClass("active");
				if(!$("#menuTitle2").hasClass("active")) {
					$("#menuTitle2").addClass("active");
					$("#menu2").addClass("active");
				}
			}else{
				if(!$("#menuTitle2").hasClass("active")) {
					$("#menuTitle2").addClass("active");
					$("#menu2").addClass("active");
				}
			}
		}
	}
	
	function goPage(type, cPage) {
		if(!_.isString(type) || !$.isNumeric(cPage)) return false;
		
		_ut.log("goPage : type ="+type + ", cPage ="+cPage);
		
		setMenu(type);

		if(typeof cPage === "string") {
			cPage = parseInt(cPage);
		}
		
		$("#type").val(type);
		if(type === "TODO") $("#todoCPage").val(cPage);
		if(type === "DONE") $("#doneCPage").val(cPage);
		
		
		if ($("#nodata").length) $("#nodata").remove();
		
		switch(type) {
		case "TODO": //작성가능 상품리뷰 목록 
			_da.setData("TODO_PAGE", cPage);
			var todoListPageObj = _ut.getPageObj(_da.getData("goodsReviewTodoList"), cPage, _da.getData("ROWCNT_PERPAGE"));
			
			$("#goodsReviewTodoList").empty();
			if(todoListPageObj.data.length > 0) {
				$("#goodsReviewTodoListTable").show();
				$("#goodsReviewDoneListTable").hide();
				_.map(todoListPageObj.data, function(obj) {
					$("#goodsReviewTodoList").append(_cv.getTodoListRow(obj, _da));
				});
				$("#paging").empty();
				$("#paging").append(_cv.getPageRow(type, todoListPageObj, goPage));
			}else{
				$("#goodsReviewTodoListTable").hide();
				$("#goodsReviewDoneListTable").hide();
				$("#paging").empty();
				$("#menu1").append("<div id=\"nodata\" class=\"nodata\"><p>작성가능 상품리뷰 정보가 없습니다.</p></div>");
			}
			
			break;
		case "DONE": //나의상품리뷰 목록 
			_da.setData("DONE_PAGE", cPage);
			var doneListPageObj = _ut.getPageObj(_da.getData("goodsReviewDoneList"), cPage, _da.getData("ROWCNT_PERPAGE"));
			
			$("#goodsReviewDoneList").empty();
			if(doneListPageObj.data.length > 0) {
				$("#goodsReviewTodoListTable").hide();
				$("#goodsReviewDoneListTable").show();
				_.map(doneListPageObj.data, function(obj) {
					var doneListRow = _cv.getDoneListRow(obj, _da);
					$("#goodsReviewDoneList").append(doneListRow);
				});
				$("#paging").empty();
				$("#paging").append(_cv.getPageRow(type, doneListPageObj, goPage));
				break;
			}else{
				$("#goodsReviewTodoListTable").hide();
				$("#goodsReviewDoneListTable").hide();
				$("#paging").empty();
				$("#menu2").append("<div id=\"nodata\" class=\"nodata\"><p>나의 상품리뷰 정보가 없습니다.</p></div>");
			}
			
		}
	}
	
	function goWrite(goodsNo, optionItemIdx, orderNo, petType) {
		_ut.log("goWrite : goodsNo ===", goodsNo);
		_ut.log("goWrite : optionItemIdx ===", optionItemIdx);
		_ut.log("goWrite : orderNo ===", orderNo);
		_ut.log("goWrite : petType ===", petType);
		$("#goodsNo").val(goodsNo);
		$("#optionItemIdx").val(optionItemIdx);
		$("#orderNo").val(orderNo);
		$("#petType").val(petType);
		$("#statusFlag").val("I");
		var form = document.reviewForm;
		form.method = "post";
		form.action="/w/mypage/activity/review/reviewWrite.do";
		form.submit();
	}
	
	function goView(reviewIdx) {
		_ut.log("goView : reviewIdx ===", reviewIdx);
		$("#reviewIdx").val(reviewIdx);
		
		var form = document.reviewForm;
		form.method = "post";
		form.action="/w/mypage/activity/review/reviewView.do";
		form.submit();
	}
	
	function goGoods(goodsNo) {
		var form = document.reviewListForm;
		var goodsNo = _cv.getInputbox().attr("name","goodsNo").attr("value",goodsNo).appendTo(form);
		form.method = "get";
		form.action="/w/product/productDetail.do";
		form.submit();
	}
	
	function btnInit() {
		_ut.log("btnInit");	
		
		$("a[name='menuTitle']").click(function() {
			var menuNm = $(this).attr("data-value")
			if(menuNm === "menu1") {
				goPage("TODO", _da.getData("TODO_PAGE"));
			}
			if(menuNm === "menu2") {
				goPage("DONE", _da.getData("DONE_PAGE"));
			}
			
		});
	}
	
	


</script>

</head>
<body>
<!-- 상단 -->
<jsp:include page="/monnami/monnamiTop.jsp" />

<!-- 중앙 -->


<div id="wrap" class="sub">
<!-- 지우기 후보1 -->
<!-- 	<noscript>
	이 사이트를 이용하기 위해서 자바스크립트를 활성화 시킬 필요가 있습니다.
	<a href="http://www.enable-javascript.com/ko/" target="_blank">브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
	</noscript> -->


	<!-- 지우기 후보2 -->	
<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
<!-- 	<script type="text/javascript"> 
		if (!wcs_add) var wcs_add={};
		wcs_add["wa"] = "s_22b1f65c4041";
		if (!_nasa) var _nasa={};
		wcs.inflow("monamimall.com");
		wcs_do(_nasa);
	</script>  -->
	
	
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

	
<main id="contents" class="mypage payment" data-index="0">
	<div class="inner">
		<h2 class="tit">마이페이지</h2>
			<div class="info">
				<div style="margin-top: 50px;">
					<span><strong>membera</strong>님</span>
					<div class="btn-area">
						<button type="button" class="btn-black small" onclick="location.href='/w/logout.do';">로그아웃</button>
					</div>
				</div>
				<ul class="info-number">
					<li>
						<a href="/w/mypage/benefit/coupon/couponList.do">
						<span>쿠폰</span>
						<span>
							<strong>1</strong>장
						</span>
						</a>
					</li>
					<li>
						<a href="/w/mypage/order/myOrderList.do">
						<span>배송중</span>
						<span>
							<strong>0</strong>건
						</span>
						</a>
					</li>
				</ul>
			</div>
			
			<div class="mypage-inner">
				<div class="lnb-area">
					<ul>
						<li class="lnb-depth1 lnb-home" data-page="mypage-home">
							<a href="/w/mypage/order/main.do">마이페이지 메인</a>
						</li>
		
						<!-- 회원 -->
						<li class="lnb-depth1 active" data-page="payment">
							<a href="javascript:">주문관리</a>
								<ul class="lnb-depth2" style="height: 150px; margin-top: 10px;">
									<li class="active"><a href="/w/mypage/order/myOrderList.do">주문목록/배송</a></li>
									<li><a href="/w/mypage/order/myClaimList.do">취소/교환/반품조회</a></li>
								</ul>
						</li>
			
					<li class="lnb-depth1 " data-page="active">
						<a href="javascript:">활동관리</a>
							<ul class="lnb-depth2" style="height: 0px; margin-top: 6px;">
								<li><a href="/w/mypage/wish/wishList.do">찜리스트</a></li>
								<li><a href="/w/mypage/activity/inquiry/inquiryList.do">1:1 문의</a></li>
								<li><a href="/w/mypage/activity/review/reviewList.do">상품리뷰</a></li>
							</ul>
					</li>
					
						<li class="lnb-depth1 " data-page="members">
							<a href="javascript:">회원정보관리</a>
								<ul class="lnb-depth2" style="height: 0px; margin-top: 6px;">
									<li><a href="/w/mypage/member/memberInfo.do">개인정보관리</a></li>
									<li><a href="/w/mypage/member/memberWithdraw.do">회원탈퇴</a></li>
								</ul>
						</li>
					</ul>
				</div>

				<div class="cont-area pay">
					<h3 class="tit">주문/배송목록</h3>
					
						
						
							<ul class="deliver-step">
								<li>
									<span class="tit">입금대기</span>
									<span class="num">0</span>
								</li>
								<li>
									<span class="tit">결제완료</span>
									<span class="num">0</span>
								</li>
								<li>
									<span class="tit">상품준비중</span>
									<span class="num">0</span>
								</li>
								<li>
									<span class="tit">배송중</span>
									<span class="num">0</span>
								</li>
								<li>
									<span class="tit">배송완료</span>
									<span class="num">0</span>
								</li>
							</ul>
						
					

					<!-- 조회기간 검색// -->
					<form name="orderForm" id="orderForm" method="post">
						<input type="hidden" name="pageNo" id="pageNo" value="1"/>
						<input type="hidden" name="orderNo" id="orderNo" value=""/>
						<input type="hidden" name="orderDetailIdx" id="orderDetailIdx" value=""/>	
						<input type="hidden" name="schType" id="schType" value=""/> 
						
						<fieldset>
							<legend class="hide">조회기간 검색</legend>
							<div class="date-form">
								<div class="date-area">
									<span class="tit">조회기간</span>
									<!--
										div class="btn-month" button 클릭 시
										금일 기준으로 시작기간, 종료기간 인풋박스
										각각 n개월 전, 금일로 표기
									-->
									<div class="btn-month">
										<button type="button" class="btn-white active" onclick="setMonth('1');" data-month="1">1개월</button>
										<button type="button" class="btn-white " onclick="setMonth('3');" data-month="3">3개월</button>
										<button type="button" class="btn-white " onclick="setMonth('6');" data-month="6">6개월</button>
									</div>

									<div class="form-deliveryusedate">
										<input type="text" name="schStartDt" id="from"  title="시작기간 입력" readonly="readonly">
										<button type="button" class="btn-cal btn-calfrom">달력보기</button>
										<span class="txt-bar">~</span>
										<input type="text" name="schEndDt" id="to"  title="종료기간 입력" readonly="readonly">
										<button type="button" class="btn-cal btn-calto">달력보기</button>
										<div class="datecalform"></div>
										<div class="datecalto"></div>
										<button type="button" name="button" class="btn-gray btn-search" onclick="goSearch();">조회</button>
									</div>
								</div>

								<div class="select-area">
									<p>
										<b>2019.02.12 ~ 2019.03.12</b>주문내역 입니다.
									</p>
									<select name="schStatus" id="schStatus" onchange="goSearch();">
										<option value="" selected>전체</option>
										<option value="100" >입금대기</option>
										<option value="200" >결제완료</option>
										<option value="300" >상품준비중</option>
										<option value="400" >배송중</option>
										<option value="500" >배송완료</option>
										<option value="900" >구매확정</option>
									</select>
								</div>
							</div>
						</fieldset>
					</form>
					<!-- //조회기간 검색 -->

				
					
						<!-- nodata// -->
						<div class="nodata">
							주문내역이 없습니다
						</div>
						<!-- //nodata -->
					
					
				

					<ul class="infotxt">
						<li>주문상세보기를 클릭하시면 주문상세내역을 보실 수 있습니다.</li>
						<li>취소/교환/반품 및 배송시간/배송지 변경을 원하시는 고객님은 주문상세조회에서 확인해 주시기 바랍니다.</li>
					</ul>
					
				

					<!-- 배송단계 안내// -->
					<div class="info-step">
						<strong class="tit">배송단계 안내</strong>
						<ol class="step">
							<li>
								<strong>입금대기</strong>
								<p>
									입금이 아직 이뤄지지<br>
									않은 단계입니다.<br>
									1일 이내 미 입금시<br>
									주문 취소 됩니다.
								</p>
								<ul class="txt">
									<li>・ 배송지변경 가능</li>
									<li>・ 주문취소 가능</li>
								</ul>
							</li>
							<li>
								<strong>결제완료</strong>
								<p>
									결제가 완료<br>
									되었습니다.
								</p>
								<small>* 정기배송은 [배송대기]로<br>표기됩니다.</small>
								<ul class="txt">
									<li>・ 배송지변경 가능</li>
									<li>・ 주문취소 가능</li>
								</ul>
							</li>
							<li>
								<strong>상품준비 중</strong>
								<p>
									판매자가 발송할<br>
									상품을 준비중입니다.
								</p>
							</li>
							<li>
								<strong>배송 중</strong>
								<p>
									상품이 고객님께
									배송중입니다.
								</p>
								<ul class="txt">
									<li>・ 배송추적</li>
								</ul>
							</li>
							<li>
								<strong>배송완료</strong>
								<p>
									상품이 주문자에게<br>
									전달 완료되었습니다.
								</p>
								<ul class="txt">
									<li>・ 교환신청 가능</li>
									<li>・ 반품신청 가능</li>
									<li>・ 구매확정 가능</li>
								</ul>
							</li>
						</ol>
					</div>
					<!-- //배송단계 안내 -->
				</div>
			</div>
		</div>
</main>
	<!-- //contents -->
	
	<!-- popup// -->	
	<div id="popShippingModify" class="popup popshippingadd">
	</div>
	
	<!-- popup// -->
	<!-- 배송조회// -->
	<div id="popOrderInquiry" class="popup poporderinquiry">
		<div class="popinner">
			<header class="header">
				<h2 class="tit">배송조회</h2>

				<button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>
			</header>

			<div class="contents">
				<div class="orderinquiry scrollbar-macosx">
				
				</div>

				<div class="btn-area">
					<button type="button" class="btn-black" onclick="fn.popupClose();">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //배송조회 -->
	<!-- //popup -->

	
	<form name="claimForm" id="claimForm" method="post">
		<input type="hidden" name="orderNo" value=""/>
		<input type="hidden" name="claimType" value=""/>
	</form>
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
		<img src="/w/images/w/common/footer_secure1.jpg" alt="모나미 공식사이트">
		<img src="/w/images/w/common/footer_secure2.jpg" alt="">
		<img src="/w/images/w/common/footer_secure3.jpg" alt="">
		<img src="/w/images/w/common/footer_secure4.jpg" alt="">
		<img src="/w/images/w/common/footer_secure5.jpg" alt="">
		<img src="/w/images/w/common/footer_secure6.jpg" alt="">
		<img src="/w/images/w/common/footer_secure7.jpg" alt="">
		<img src="/w/images/w/common/footer_secure8.jpg" alt="">
		<img src="/w/images/w/common/footer_secure9.jpg" alt="">
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
			localStorage.setItem("monamiSessionId","E275164175FCC28BEEA70A0CB95AB597");
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