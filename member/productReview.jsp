<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
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


<main id="contents" class="mypage active">
	<div class="inner">
		<h2 class="tit">마이페이지</h2>
			<div class="info">
				<div class="profile green">
					<span><strong>간현진</strong>님</span>
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
						<li class="lnb-depth1 " data-page="payment">
							<a href="javascript:">주문관리</a>
								<ul class="lnb-depth2" style="height: 0px; margin-top: 6px;">
									<li><a href="/w/mypage/order/myOrderList.do">주문목록/배송</a></li>
									<li><a href="/w/mypage/order/myClaimList.do">취소/교환/반품조회</a></li>									
								</ul>
						</li>
				
						<li class="lnb-depth1 active" data-page="active">
							<a href="javascript:">활동관리</a>
								<ul class="lnb-depth2" style="height: 120px; margin-top: 10px;">
									<li><a href="/w/mypage/wish/wishList.do">찜리스트</a></li>
									<li class="active"><a href="/w/mypage/activity/review/reviewList.do">상품리뷰</a></li>
						
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
				
				<form name="reviewListForm" id="reviewListForm" method="get" onsubmit="return false;"></form>
				<form name="reviewForm" id="reviewForm" method="post" onsubmit="return false;">
				<input type="hidden" id="goodsNo" name="goodsNo" value="">
				<input type="hidden" id="optionItemIdx" name="optionItemIdx" value="">
				<input type="hidden" id="purchaseDt" name="purchaseDt" value="">
				<input type="hidden" id="petType" name="petType" value="">
				<input type="hidden" id="reviewIdx" name="reviewIdx" value="">
				<input type="hidden" id="orderNo" name="orderNo" value="">
				<input type="hidden" id="statusFlag" name="statusFlag" value="">
				<input type="hidden" id="todoCPage" name="todoCPage" value="1">
				<input type="hidden" id="doneCPage" name="doneCPage" value="1">
				<input type="hidden" id="type" name="type" value="TODO">
				
					<div class="cont-area review-list">
					<h3 class="tit">상품리뷰</h3>
					<ul class="infotxt">
						<li>모나미몰은 일반 상품리뷰 100원/ 포토리뷰 500원/ SNS게시글 연동 시 추가 500원을 적립하여 드리고 있습니다.</li>
						<li>상품 문의, 확인되지 않은 사항, 미풍양속을 해치는 글은 관리자가 임의로 삭제할 수 있으니 양해 바랍니다.</li>
						<li>미작성 상품리뷰는 배송완료 일로부터 14일간 확인하실 수 있습니다.</li>
						<li>상품리뷰는 작성시 즉시 지급됩니다.</li>
					</ul>

					<div class="tab-menu">
						<a href="#menu1" id="menuTitle1" name="menuTitle" data-value="menu1" class="active">작성가능 상품리뷰</a>
						<a href="#menu2" id="menuTitle2" name="menuTitle" data-value="menu2">나의 상품리뷰</a>
					</div>

					<!-- 작성가능 상품리뷰// -->
					<div id="menu1" class="tab-contents active">
						<table id="goodsReviewTodoListTable" style="display: none;">
							<caption>작성가능 상품리뷰</caption>
							<colgroup>
								<col width="140px">
								<col>
								<col width="120px">
								<col width="140px">
							</colgroup>
							<thead>
								<tr>
									<th colspan="2">상품명</th>
									<th>구매확정일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody id="goodsReviewTodoList"></tbody>
						</table>
					<div id="nodata" class="nodata"><p>작성가능 상품리뷰 정보가 없습니다.</p></div></div>
					<!-- //작성가능 상품리뷰 -->

					<!-- 나의 상품리뷰//-->
					<div id="menu2" class="tab-contents">
						<table id="goodsReviewDoneListTable" style="display: none;">
							<caption>나의 상품리뷰</caption>
							<colgroup>
								<col width="140px">
								<col>
								<col width="240px">
								<col width="120px">
								<col width="120px">
							</colgroup>
							<thead>
								<tr>
									<th colspan="2">상품명</th>
									<th>제목</th>
									<th>평점</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="goodsReviewDoneList"></tbody>
						</table>
					</div>
					<!-- //나의 상품리뷰-->

					<div class="paging" id="paging"></div>
				</div>
					
				</form>
			</div>
		</div>
	</main>
<hr>



<!-- 하단 -->
<jsp:include page="/monnami/monnamiBottom.jsp" />
</body>
</html>