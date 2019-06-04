<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 	
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>모나미 공식 쇼핑몰 모나미몰</title>
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


<meta name="decorator" content="mypage.main"/>

<script type="text/javascript">

	var authType = "";					
	var orderGoodsNo = "";			
	var orderOptionItemIdx = "";	

	
	var didSubmit = false;
	
	window.onpageshow = function (event) {
		didSubmit = false;
	}
	

	
	function checkRealName(){
		if(!$("#checkRealName").is(":checked")){
			didSubmit = false;	
			alert("본인인증 동의해 주세요.");
			$("#checkRealName").focus();
			return false;
		}

		fn.popupClose();
		authTypeCheck(authType);
	}

	
	$(document).on("click","#chkWishAll,#chkWishAll2",function(){
		$("input:checkbox[name='wishIdx']:not([disabled])").prop("checked",$(this).is(":checked"));
		if($(this).attr("id") == "chkWishAll") $("#chkWishAll2").prop("checked",$(this).is(":checked"));
		if($(this).attr("id") == "chkWishAll2") $("#chkWishAll").prop("checked",$(this).is(":checked"));
	});
	
	
	$(document).on("click","input:checkbox[name='wishIdx']",function(){
		if($("input:checkbox[name='wishIdx']:not([disabled])").length > $("input:checkbox[name='wishIdx']:not([disabled]):checked").length){
			$("#chkWishAll,#chkWishAll2").prop("checked",false);
		}else{
			$("#chkWishAll,#chkWishAll2").prop("checked",true);
		}
	});

	
	function goPage(page){
		$("#pageNo").val(page);
		var frm = document.wishForm;
		frm.action = "/w/mypage/wish/wishList.do";
		frm.submit();
	}

	
	function removeWish(wishIdx){
		if(!confirm("선택한 상품을 찜리스트에서 삭제하시겠습니까?")){
			return false;
		}

		var frm = document.wishForm;
		$("#wishIdxes").val(wishIdx);
		frm.action="/w/mypage/wish/deleteWish.do";
		frm.submit();
	}

	 
	function removeSelected(){
		var cnt = $("input:checkbox[name='wishIdx']:not([disabled]):checked").length;
		if(cnt == 0){
			alert("삭제할 상품을 선택하세요!");
			return false;
		}
		
		var wishIdxes = "";
		$("input:checkbox[name='wishIdx']:not([disabled]):checked").each(function(){
			if(wishIdxes != ""){
				wishIdxes += ",";
			}
			
			wishIdxes += $(this).val();
		});
		
		if(!confirm("선택한 "+cnt+"개의 상품을 찜리스트에서 삭제하시겠습니까?")){
			return false;
		}

		var frm = document.wishForm;
		$("#wishIdxes").val(wishIdxes);
		frm.action="/w/mypage/wish/deleteWish.do";
		frm.submit();
	}

	
	function popOptionChange(wishIdx, orderYn){
		var childYn = 'N';
		
		if (orderYn == "Y" && childYn == "Y")
		{
			//바로구매는 14세 미만일경우 바로구매 못함.
			alert("14세 이상 회원만 이용가능합니다.");
			return false;
		}	
			
		$.ajax({			
			url: getContextPath()+"/wish/optionChangeLayer.do",
			data: {
				"wishIdx" 	: wishIdx,
				"orderYn"	: orderYn	
			},
		 	type: "post",
		 	async: false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(data){
				if(data != null){
					$("#popCartOption").html(data);
					fn.popupOpen('#popCartOption');
				}
			 }
		});		
	}

	
	function orderNoOptionCheck(goodsNo, optionItemIdx){
		
		
		orderGoodsNo = goodsNo;
		orderOptionItemIdx = optionItemIdx;
		
		var di = "";

		
		

		
		if(di == ""){
			didSubmit = false;	
			authType = "orderWishNoOption";
			$("#checkRealName").prop("checked",false);
			fn.popupOpen('#popCartRealname');
		}else{
			orderWishNoOption();
		}
	}

	
	function orderWishNoOption(){
		var childYn = 'N';

		if ( childYn == "Y")
		{
			//바로구매는 14세 미만일경우 바로구매 못함.
			alert("14세 이상 회원만 이용가능합니다.");
			return false;
		}
		
		var goodsNo = orderGoodsNo;
		var optionItemIdx = orderOptionItemIdx;

		
		if(didSubmit == true){
			return false;
		}
		
		didSubmit = true;
		

		
		var arrCart = new Array();
		var goodsObj = new Object();
		goodsObj.goodsNo = goodsNo;
		goodsObj.goodsCnt = 1;
//		goodsObj.couponIdx = $(this).data("couponidx");
		goodsObj.optionItemIdx = optionItemIdx;
		arrCart.push(goodsObj);
		$("#orderGoodsInfoListStr").val(JSON.stringify(arrCart));

		$.ajax({			
			url: getContextPath()+"/ajax/cart/cartOrderAjax.do",
			data : {
				"sessionId" : getSessionId(),
				"orderGoodsInfoListStr" : $("#orderGoodsInfoListStr").val()
			},
		 	type: "post",
		 	async: false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){
		 		didSubmit = false;	
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(data){
				if(data.result == true){
					var frm = document.orderForm;
					$("#sessionId").val(getSessionId());
					frm.action="/w/order/cartOrderProc.do";
					frm.submit();
				}else{
					if(data.msg != ""){
						didSubmit = false;	
						alert(data.msg);
					}
				}
			 }
		});
	}

	
	function cart(optionItemIdx){
		var arr = new Array();
		var obj = new Object();
		obj.optionItemIdx = optionItemIdx;
		obj.goodsCnt = 1;
		obj.sessionId = getSessionId();
		obj.regularYn = "N";
		obj.clubMasterIdx = null;
		obj.addServiceYn = "N";
		obj.addServiceContent = null;			
		arr.push(obj);
		
		
		addCartObject(arr);
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
			<li>
						<a href="javascript:void(0);" class="btn-person" onclick="personClick();">
							<strong>장성길</strong>님
								</a>
					</li>
					<li><a href="/w/cart.do" class="btn-cart">장바구니 <em class="cartCnt">0</em></a></li>
					<li><a href="/w/mypage/order/main.do" class="btn-mypage">마이페이지</a></li>
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
	<script>
	function personClick() {
		
		personalAlarmList(); //알림목록
		
		personalPetInfoAjax(); //펫정보불러오기
		personalGoodsListAjax('R'); //R최근본상품 ... , N:이상품어때요, E : 지금이이기회 
	}

	function personalAlarmList() {
		$.ajaxSetup({cache:false});
		$.ajax({			
			url: getContextPath()+"/ajax/common/personalAlarmList.do",
		 	type: "post",
		 	async:  false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
		 	beforeSend: function() {
		    },
			success: function(data){
				$("#personalAlarmDiv").html(data);
				if ( $(".swiper-container.hswipershop .swiper-slide").length > 1 ){
					var hSwipershop = new Swiper(".swiper-container.hswipershop", {
						slidesPerView: 1,
						loop: true,
						direction: 'vertical',
						observer: true,
						observeParents: true,
						speed: 400,
						autoplay: {
							delay: 5000,
							disableOnInteraction: false,
						},
					});
				}
			}
		});
		
	}
	function personalPetInfoAjax() {
		$.ajaxSetup({cache:false});
		$.ajax({			
			url: getContextPath()+"/ajax/common/personalPetInfo.do",
		 	type: "post",
		 	async:  false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
		 	beforeSend: function() {
		    },
			success: function(data){
				$("#mypetNoticeDiv ").html(data);
			}
		});
		
	}
	

	function personalGoodsListAjax(gbn, t) {
		if (t != null) {
			$('.pro-notice .tab-menu a').removeClass('active');$(t).addClass('active');
		}
		$.ajaxSetup({cache:false});
		$.ajax({			
			url: getContextPath()+"/ajax/common/personalGoodsList.do",
		 	type: "post",
		 	data: {"gbn":gbn}, 
		 	async:  false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
		 	beforeSend: function() {
		    },
			success: function(data){
				$("#hPorNoticeListDiv ").html(data);
				//찜버튼 활성화
				likebtnBindandDisplay('#hPorNoticeListDiv ');			

				//header util 개인화 최근 본 상품
				if ( $(".swiper-container.hswipernewpro .swiper-slide").length > 5 ){
					var hSwipershop = new Swiper(".swiper-container.hswipernewpro", {
						slidesPerView: 5,
						spaceBetween: 20,
						observer: true,
						observeParents: true,
						loop: false,
						speed: 400,
						navigation: {
							nextEl: ".swiper-button-next-newpro",
							prevEl: ".swiper-button-prev-newpro",
						},
					});
				}else{
					$("#header .hperson .pro-notice .prolist .ls .swiper-button-next-newpro").fadeOut(0);
					$("#header .hperson .pro-notice .prolist .ls .swiper-button-prev-newpro").fadeOut(0);
				}
			}
		});
		
	}
	
	function personalChangePet(idx, t) {
		if (t != null) {
			$('.petls .tab-menu a').removeClass('active');$(t).addClass('active');
		}
		$.ajaxSetup({cache:false});
		$.ajax({			
			url: getContextPath()+"/ajax/common/personalPetDetailInfo.do",
		 	type: "post",
		 	data: {"petIdx":idx}, 
		 	async:  false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
		 	beforeSend: function() {
		    },
			success: function(data){
				$("#hPetDetailInfo").html(data);
				//찜버튼 활성화
				likebtnBindandDisplay('#hPetDetailInfo ');		
				
				//말줄임표
				fn.myPetNotice();
				
				if ( $(".petlist1 .swiper-container.hswiperrecompro .swiper-slide").length > 3 ){
					var hSwipershop = new Swiper(".petlist1 .swiper-container.hswiperrecompro", {
						slidesPerView: 3,
						spaceBetween: 30,
						observer: true,
						observeParents: true,
						loop: false,
						speed: 400,
						navigation: {
							nextEl: ".petlist1 .swiper-button-next-recompro",
							prevEl: ".petlist1 .swiper-button-prev-recompro",
						},
					});
				}else{
					$(".petlist1 .swiper-button-next-recompro").fadeOut(0);
					$(".petlist1 .swiper-button-prev-recompro").fadeOut(0);
				}
			}
		});
	}
	</script>
	
	<div id="popHperson" class="hperson">
		<div class="person-area">
			<button type="button" class="btn-close">닫기</button>
			<div class="inner scrollbar-macosx">
				<div class="inner-cont">
					<!-- 맞춤알림// -->
					<div class="fit-notice">
						<div class="fit">
							<!-- 회원등급 : green, yellow, red, black -->
							<h3>
								<span class="profile green">현재 등급 : 그린</span>
								장성길님 맞춤알림
									</h3>
							<div class="btn-area">							
								<a href="/w/mypage/order/main.do" class="btn-white small btn-mypage">마이페이지</a>	
								<a href="/w/logout.do" class="btn-gray small btn-logout">로그아웃</a>
							</div>
						</div>
						<div class="shopping">
							<h4>쇼핑알림</h4>
							<div class="swiper-container hswipershop">
								<div class="swiper-wrapper" id="personalAlarmDiv"> 
								
								</div>
							</div>
						</div>
						</div>
					<!-- //맞춤알림 -->

					<!-- 마이펫 알림// -->
					<div class="mypet-notice" id="mypetNoticeDiv" >
						
					</div>
					<!-- //마이펫 알림 -->

					<!-- 상품// -->
					<div class="pro-notice">
						<div class="tab-area">
							<!-- 최근본 상품이 있을때// -->
							<div class="tab-menu">
								<a href="javascript:void(0);"  onclick="personalGoodsListAjax('R', this);" class="active">최근 본 상품</a>
								<a href="javascript:void(0);"  onclick="personalGoodsListAjax('N', this);">이 상품은 어떠세요?</a>
								<a href="javascript:void(0);"  onclick="personalGoodsListAjax('E', this);">지금이 바로 기회!</a>
							</div>
							
							<div id="hPorNoticeListDiv" class="prolist tab-contents on">
							
							</div>
							<!-- //최근 본 상품 -->

						</div>
					</div>
					<!-- //상품 -->
				</div>
			</div>
		</div>
	</div>
	<!-- //개인화 -->
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

	<!-- contents// -->
	<main id="contents" class="mypage active" data-index="0">
		<div class="inner">
			<h2 class="tit">마이페이지</h2>
			















 




<div class="info">
	
	
		
		
		
		
		
		
		
	
	<div class="profile green">
		<span><strong>장성길</strong>님</span>
		
		
		<p>
			현재 등급은	<b>그린(GREEN)</b> 입니다.
			
			
			
			
		</p>
		
		<div class="btn-area">
			<button type="button" class="btn-black small" onclick="location.href='/w/logout.do';">로그아웃</button>
			<button type="button" class="btn-whitegray small" onclick="location.href='/w/cscenter/benefit/benefitInfo.do';">등급별혜택안내 +</button>
		</div>
		
	</div>
	<ul class="info-number">
		<li>
			<a href="/w/mypage/benefit/coupon/couponList.do">
				<span>쿠폰</span>
				<span>
					<strong>
						1
					</strong>장
				</span>
			</a>
		</li>
		<li>
			<a href="/w/mypage/order/myOrderList.do">
				<span>배송중</span>
				<span>
					<strong>
						0
					</strong>건
				</span>
			</a>
		</li>
		<li>
			<a href="/w/mypage/benefit/deposit/depositList.do">
				<span>예치금</span>
				<span><strong>0</strong>원</span>
			</a>
		</li>
		<li>
			<a href="/w/mypage/benefit/reserve/reserveList.do">
				<span>적립금</span>
				<span><strong>0</strong>원</span>
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
						<ul class="lnb-depth2">
							<li ><a href="/w/mypage/order/myOrderList.do">주문목록/배송</a></li>
							<li ><a href="/w/mypage/order/myClaimList.do">취소/교환/반품조회</a></li>
							<li ><a href="/w/mypage/order/regularOrder.do">정기배송설정</a></li>
							<li ><a href="/w/mypage/order/billkeyList.do">결제관리</a></li>
							<li ><a href="/w/mypage/order/restockAlarm.do">재입고알림내역</a></li>
						</ul>
					</li>
					<li class="lnb-depth1 " data-page="benefit">
						<a href="javascript:">쇼핑혜택</a>
						<ul class="lnb-depth2">
							<li ><a href="/w/mypage/benefit/coupon/couponList.do">쿠폰정보</a></li>
							<li ><a href="/w/mypage/benefit/deposit/depositList.do">예치금</a></li>
							<li ><a href="/w/mypage/benefit/reserve/reserveList.do">적립금</a></li>
						</ul>
					</li>
				
			
				<li class="lnb-depth1 active" data-page="active">
					<a href="javascript:">활동관리</a>
					<ul class="lnb-depth2">
						<li class="active"><a href="/w/mypage/wish/wishList.do">찜리스트</a></li>
						<li ><a href="/w/mypage/activity/storywish/storyWishList.do">스토리픽보관함</a></li>
						
							<li ><a href="/w/mypage/activity/inquiry/inquiryList.do">1:1 문의</a></li>
							<li ><a href="/w/mypage/activity/review/reviewList.do">상품리뷰</a></li>
						
					</ul>
				</li>
				
					<li class="lnb-depth1 " data-page="pet">
						<a href="javascript:">마이펫수첩</a>
						<ul class="lnb-depth2">
							<li ><a href="/w/mypage/mypet/mypetInfo.do">마이펫정보</a></li>
							<li ><a href="/w/mypage/mypet/petinquiry/petInquiryList.do">펫닥터 QnA</a></li>
						</ul>
					</li>
				
				<li class="lnb-depth1 " data-page="club">
					<a href="javascript:">클럽관리</a>
					<ul class="lnb-depth2">
						<li ><a href="/w/mypage/club/clubMain.do">클럽관리</a></li>
						
							<li ><a href="/w/mypage/club/clubDepositList.do">클럽예치금내역</a></li>
							<li ><a href="/w/mypage/club/clubDisableList.do">클럽운영/해지</a></li>
						
					</ul>
				</li>
				<li class="lnb-depth1 " data-page="gift">
					<a href="javascript:">선물함</a>
					<ul class="lnb-depth2">
						<li ><a href="/w/mypage/gift/giftReceiveList.do">선물내역</a></li>
					</ul>
				</li>
				
					<li class="lnb-depth1 " data-page="members">
						<a href="javascript:">회원정보관리</a>
						<ul class="lnb-depth2">
							<li ><a href="/w/mypage/member/memberInfo.do">개인정보관리</a></li>
							<li ><a href="/w/mypage/member/childrenList.do">자녀정보관리</a></li>
							<li ><a href="/w/mypage/member/shippingList.do">배송지관리</a></li>
							<li ><a href="/w/mypage/member/memberWithdraw.do">회원탈퇴</a></li>
						</ul>
					</li>
				
			
		
	</ul>
</div>


				<div class="cont-area pick">
					<h3 class="tit">찜리스트</h3>
					<form name="wishForm" id="wishForm" method="post" onsubmit="return false;">
						<input type="hidden" name="pageNo" id="pageNo" value="1"/>
						<input type="hidden" name="wishIdxes" id="wishIdxes" value=""/>
						<fieldset>
							<legend class="hide">찜리스트</legend>
							<h4 class="tit">찜 한 상품&nbsp;&nbsp;<b>0</b>건</h4>
					
						
							<!-- nodata// -->
							<div class="nodata">
								<p>찜 한 상품 정보가 없습니다.</p>
							</div>
							<!-- //nodata -->
						
						
				
				
						</fieldset>
					</form>

				
				</div>
			</div>
		</div>
	</main>
	<!-- //contents -->

	















 










<script type="text/javascript">

    // 인증창 종료 후 인증데이터 리턴 함수
    function auth_data(frm)
    {
        var auth_form = document.form_auth;
        var nField = frm.elements.length;
        var response_data = "";

        // up_hash 검증 
        if( frm.up_hash.value != auth_form.veri_up_hash.value ){
            alert("up_hash 변조 위험있음");
        }              

		$("#certNo").val(frm.elements.cert_no.value);
		$("#encCertData").val(frm.elements.enc_cert_data.value);
		$("#authFlag").val(frm.elements.param_opt_2.value);
		
		var submitFlag = "";
		var params = $("form[name=formData]").serialize();
		var pageFlag = frm.elements.param_opt_1.value;					// 호출 파라미터 값
		
		if(pageFlag !="hpChange"){
			$.ajax({
			 	url : "/w/ajax/member/authorizationSaveAjax.do", 
				data :	params,	
				 type : "POST",	
				 async : false,
				 cache : false,	 		
				 contentType : "application/x-www-form-urlencoded; charset=UTF-8",  
				 error : function(request, status, error){ 
				 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				 },
				 success: function(map){ 
				 	if(map.flag == 1){
		 				submitFlag = "N";
						 
					 	var memberId = map.info.memberId;
	 					var str="";
				 			
				 		for(var i=0; i<memberId.length-3; i++){
				 			str +="*";
				 		}
				 		
				 		$("#authMemberId").val(memberId.substr(0,3)+str);
						var frm = document.formData;
						frm.action = "/w/member/authMemberAlert.do";
						frm.submit();
					 }else{
						 submitFlag = "Y";
					 }
				 }
			});
		}else{
			hpChangeCallback();				// 마이페이지 > 회원정보관리 > 휴대폰변경 
    		return;
		}
		
		if(submitFlag == "Y"){
			if(pageFlag == "integratedMember"){
				var frm = document.formData;
				frm.action = "/w/member/joinIntegrated02.do";
				frm.submit();
			}else{
		    	if(pageFlag == "childMember"){									// 마이페이지 > 회원정보관리 > 자녀정보관리 > 자녀등록
		    		childrenWriteCallback();
		    		return;
		    	}else if(pageFlag == "addClub"){											// 마이페이지 > 클럽관리 > 클럽생성
		    		addClubCallback();
					return;
		    	}else if(pageFlag == "depositSave"){									// 마이페이지 > 쇼핑혜택 > 예치금
		    		depositSaveCallback();
					return;
		    	}else if(pageFlag == "orderWishNoOption"){							// 마이페이지 > 찜리스트 바로주문 (옵션 없는 상품)
		    		orderWishNoOption();
					return;
		    	}else if(pageFlag == "orderWishOption"){								// 마이페이지 > 찜리스트 바로주문 (옵션 있는 상품)
		    		orderWishOption();
					return;
		    	}else if(pageFlag == "orderNow"){										// 장바구니 바로주문
		    		order();
					return;
		    	}else if(pageFlag == "orderProc"){										// 장바구니 선택상품주문/전체상품주문
		    		orderProc();
					return;
		    	}else if(pageFlag == "regularOrder"){									// 장바구니 정기배송신청
		    		addRegularOrder();
					return;
		    	}else if(pageFlag == "gift"){												// 클럽장바구니 바로선물하기
		    		gift();
					return;
		    	}else if(pageFlag == "giftProc"){											// 클럽장바구니 선택상품 선물하기
	    			giftProc();
					return;
		    	}else if(pageFlag == "orderGoods"){											// 상품상세 -> 바로 주문하기
		    		_orderGoodsProcess();
					return;
		    	}else if(pageFlag == "orderBom"){										// BOM 바로주문
		    		orderBom();
		    		return;
		    	}
			}
		}
    }
    
    // 인증창 호출 함수
    function authTypeCheck(pageFlag){
    	var auth_form = document.form_auth;
        
        document.getElementById("pageFlag").value = pageFlag;		
        
        if(pageFlag == "integratedMember"){
        	document.getElementById("pageAuthFlag").value = "Y";		
        }else{
        	document.getElementById("pageAuthFlag").value = "N";		        	
        }
        
        if( auth_form.ordr_idxx.value == ""){
            alert( "요청번호는 필수 입니다." );
            return false;
        }else{
        	// 스마트폰이 아닌경우
            if((navigator.userAgent.indexOf("Android") > - 1 || navigator.userAgent.indexOf("iPhone") > - 1 ) == false){
                var return_gubun;
                var width  = 410;
                var height = 600;
                var leftpos = (screen.width - width) / 2;
                var toppos =(screen.height - height) / 2;
                var winopts  = "width=" + width   + ", height=" + height + ", toolbar=no,status=no,statusbar=no,menubar=no,scrollbars=no,resizable=no";
                var position = ",left=" + leftpos + ", top="    + toppos;
                var AUTH_POP = window.open('','auth_popup', winopts + position);
            }
            
            auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
            auth_form.action = "/w/member/kcpcert/kcpcertProcReq.do"; // 인증창 호출 및 결과값 리턴 페이지 주소
            auth_form.submit();
        }
    }
</script>
    
<form name="form_auth" method="post">
	<!-- 요청종류 -->
	<input type="hidden" name="req_tx" value="cert"/>
	<!-- 요청구분 -->
	<input type="hidden" name="cert_method"  value="01"/>
	<!-- 웹사이트아이디 -->
	<input type="hidden" name="web_siteid"   value=""/> 
	<!-- 노출 통신사 default 처리시 아래의 주석을 해제하고 사용하십시요 
	     SKT통신사 : SKT , KT통신사 : KTF , LGU+통신사 : LGT
	<input type="hidden" name="fix_commid"      value="KTF"/>
	-->
	<!-- 사이트코드 -->
	<input type="hidden" name="site_cd"      value="A8948" />
	<!-- Ret_URL : 인증결과 리턴 페이지 ( 가맹점 URL 로 설정해 주셔야 합니다. ) -->
	<input type="hidden" name="Ret_URL"      value="https://www.monamimall.com/w/member/kcpcert/kcpcertProcReq.do" />
	<!-- cert_otp_use 필수 ( 메뉴얼 참고)
	     Y : 실명 확인 + OTP 점유 확인 , N : 실명 확인 only
	-->
	<input type="hidden" name="cert_otp_use" value="Y"/>
	<!-- cert_enc_use 필수 (고정값 : 메뉴얼 참고) -->
	<input type="hidden" name="cert_enc_use" value="Y"/>
	
	<input type="hidden" name="res_cd"       value=""/>
	<input type="hidden" name="res_msg"      value=""/>
	
	<!-- up_hash 검증 을 위한 필드 -->
	<input type="hidden" name="veri_up_hash" value=""/>
	
	<!-- 본인확인 input 비활성화 -->
	<input type="hidden" name="cert_able_yn" value=""/>
	
	<!-- web_siteid 검증 을 위한 필드 -->
	<input type="hidden" name="web_siteid_hashYN" value=""/>
	
	<input type="hidden" name="ordr_idxx" value="TEST201903121458200000086"/>
	
	<input type="hidden" name="year"/>
	
	<input type="hidden" name="month" />
	
	<input type="hidden" name="day" />
	
	<!-- 가맹점 사용 필드 (인증완료시 리턴)-->
	<input type="hidden" name="param_opt_1" id="pageFlag" value=""/> 
	<input type="hidden" name="param_opt_2" id="pageAuthFlag" value=""/> 
	<input type="hidden" name="param_opt_3"  value="opt3"/> 
</form>

<form name="formData" method="post">
	<input type="hidden" name="siteCode" id="siteCode" value="A8948"/>
	<input type="hidden" name="certNo" id="certNo" value=""/>
	<input type="hidden" name="encCertData" id="encCertData" value=""/>
	<input type="hidden" name="authFlag" id="authFlag" value=""/>
	<input type="hidden" name="memberId" id="authMemberId" value=""/>
	<input type="hidden" name="authAlertFlag" id="authAlertFlag" value="Y"/>
</form>




	<!-- popup// -->
	<div id="popCartOption" class="popup popcartoption">

	</div>
	<!-- //popup -->


<!-- 2018.09.13// -->
	<script>
	$(document).ready(function(){
//		fn.popupOpen('#popCartRealname');
	});
	</script>
	<!-- 실명인증// -->
	<div id="popCartRealname" class="popup popcartrealname">
		<div class="popinner">
			<header class="header">
				<h2 class="tit">실명인증</h2>

				<button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>
			</header>

			<div class="contents">
				<p>
					전자상거래법상, 주문시 휴대폰 실명인증을 받고 있으며,<br>인증은 최초 주문1회에 한합니다.
					<small>회원정보 저장에 동의해 주신 후, 본인확인을 진행해 주세요</small>
				</p>

				<label><input type="checkbox" id="checkRealName" value="Y" class="small"><span>인증 후, 고객님의 정보(이름, 생년월일, 성별, 휴대폰번호)가 회원정보에 저장됩니다.</span></label>

				<div class="btn-area">
					<button type="button" class="btn-white" onclick="fn.popupClose();">취소</button>
					<button type="button" class="btn-black" onclick="checkRealName();">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //실명인증 -->
<!-- //2018.09.13 -->



 <form name="orderForm" id="orderForm" method="post" onsubmit="return false;">
	<input type="hidden" name="sessionId" id="sessionId" value=""/>
	<input type="hidden" name="orderGoodsInfoListStr" id="orderGoodsInfoListStr" value=""/>
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
			localStorage.setItem("monamiSessionId","337F207599236CDA7622F32719B741E9");
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