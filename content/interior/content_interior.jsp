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
<title>Insert title here</title>
<jsp:include page="/monnami/content/monnamiTop.jsp"/>

<script>

var didSubmit = false;

window.onpageshow = function (event) {
	didSubmit = false;
}


$(document).ready(function(){
	var schCateIdx2 = "234";
	var schBomCateIdx = "0";
	if(schCateIdx2 == "242" || schCateIdx2 == "243" || schCateIdx2 == "244"){
		$.ajaxSetup({cache:false});
		$.ajax({			
			url: getContextPath()+"/ajax/product/bomListAjax.do",
			data: {
				"upperCateCode"	:	schBomCateIdx
		 	},
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
				$("#bomHtmlDiv").html(data);
				
				if ( $(".bom .swiper-container.swiperdiv .swiper-slide").length > 6 ){
					var snsSwiper = new Swiper(".swiper-container.swiperdiv", {
						slidesPerView: 6,
						spaceBetween: 65,
						navigation: {
							nextEl: $(this).find('.swiper-button-next-div'),
							prevEl: $(this).find('.swiper-button-prev-div')
						},
						lazy: {
							loadPrevNext:true,
							loadPrevNextAmount:1
						}
					});
				}else{
					$(".bom .swiper-button-next-div, .bom .swiper-button-prev-div").fadeOut(0);
					$(".bom .bom-div .swiperdiv .swiper-slide").css({"margin-left":"65px"});
					$(".bom .bom-div .swiperdiv .swiper-slide").eq(0).css({"margin-left":"3px"});
				}
				setTimeout(function(){
					$(".bom .bom-div").animate({"opacity":"1"}, 400);
				}, 500);
			}
		});
	}
});

// BOM 1Depth Change
function bom1DepthChange(bomCateIdx, pmCateImg, cateNm, cateTitle){
	// 2Depth 영역에 1Depth 이미지, 제목 세팅
	var imgUrl = "https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/"+pmCateImg;
	$("#pmCateImg").attr("src", imgUrl);
	$("#cateNm").text(cateNm);
	$("#cateTitle").text(cateTitle);
	
	// 2Depth Ajax 호출
	$.ajaxSetup({cache:false});
	$.ajax({			
		url: getContextPath()+"/ajax/product/bomList2Ajax.do",
	 	type: "post",
	 	data: {"bomCateIdx":bomCateIdx}, 
	 	async:  false,
	 	cache: false,
	 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
	 	error: function(request, status, error){ 
	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		},
	 	beforeSend: function() {
	    },
		success: function(data){
			$("#bomdepth2").empty();
			$("#bomdepth3").empty();
			$("#bomproduct").empty();
			$("#bomdepth2").html(data);
		}
	});
}

// BOM 2Depth Change
var upperCateCode = "";
function bom2DepthChange(bomCateIdx){
	// 2뎁스 cateIdx 저장
	upperCateCode = bomCateIdx;
	// 3Depth Ajax 호출
	$.ajaxSetup({cache:false});
	$.ajax({			
		url: getContextPath()+"/ajax/product/bomList3Ajax.do",
	 	type: "post",
	 	data: {"bomCateIdx":bomCateIdx}, 
	 	async:  false,
	 	cache: false,
	 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
	 	error: function(request, status, error){ 
	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		},
	 	beforeSend: function() {
	    },
		success: function(data){
			$("#bomdepth3").empty();
			$("#bomproduct").empty();
			$("#bomdepth3").html(data);
		}
	});
}

// BOM ProductList
function getBomProductList(bomCateIdx){
	// BOM 상품 Ajax 호출
	$.ajaxSetup({cache:false});
	$.ajax({			
		url: getContextPath()+"/ajax/product/getBomProductList.do",
	 	type: "post",
	 	data: {
	 				"upperCateCode"	:	upperCateCode,
	 				"bomCateIdx"			:	bomCateIdx
	 			}, 
	 	async:  false,
	 	cache: false,
	 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
	 	error: function(request, status, error){ 
	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		},
	 	beforeSend: function() {
	    },
		success: function(data){
			$("#bomproduct").empty();
			$("#bomproduct").html(data);
			
			setSelButton(); // BOM 상품 선택 버튼 세팅
			likebtnBindandDisplay('#bomproduct '); // 찜버튼 활성화
		}
	});
}

// 상품 선택 버튼 세팅
function setSelButton(){
	$(".bomListCnt").each( function (index) {
		var listIdx = $(this).attr("data-optionItemIdx");
		
		$(".selYn").each( function (index) {
			var selIdx = $(this).attr("data-optionItemIdx");
			
			if(listIdx == selIdx){
				$("#selYn"+selIdx).val("Y");
				$(".bomSelBtn"+selIdx).removeClass("btn-gray btn-select");
				$(".bomSelBtn"+selIdx).addClass("btn-whitegray btn-cancel");
				$(".bomSelBtn"+selIdx).text("선택취소");
			}
		});
	});
}

// BOM 상품 선택 버튼
function selProduct(optionItemIdx){
	// 버튼 상태 변경	
	var selYn = $("#selYn"+optionItemIdx).val();
	// 상품정보
	var goodsNo = $("#selYn"+optionItemIdx).attr("data-goodsNo");
	var goodsNm = $("#selYn"+optionItemIdx).attr("data-goodsNm");
	var optionNm = $("#selYn"+optionItemIdx).attr("data-optionNm");
	var price = $("#selYn"+optionItemIdx).attr("data-price");
	var stockCnt = $("#selYn"+optionItemIdx).attr("data-stockCnt");
	
	if(selYn == "N"){ // 선택취소로 변경
		$("#selYn"+optionItemIdx).val("Y");
		$(".bomSelBtn"+optionItemIdx).removeClass("btn-gray btn-select");
		$(".bomSelBtn"+optionItemIdx).addClass("btn-whitegray btn-cancel");
		$(".bomSelBtn"+optionItemIdx).text("선택취소");
		
		// 선택상품 정보 추가
		var html = "";
		html += "<div class='bomProductDiv' id='bomProductDiv"+optionItemIdx+"'> ";
		html += "	<strong>"+goodsNm+" ";
		if(optionNm != "" && optionNm != null){
			html += "("+optionNm+")";
		}
		html += " </strong> ";
		html += "	<em id='bomListPrice"+optionItemIdx+"'>"+comma(price)+"</em> ";
		html += "	<div class='ea-area'> ";
		html += "		<input type='number' class='bomListCnt' id='bomListCnt"+optionItemIdx+"' title='수량 입력' value='1' data-optionItemIdx='"+optionItemIdx+"' data-goodsNo='"+goodsNo+"' data-price='"+price+"' data-stockCnt='"+stockCnt+"' readonly/> ";
		html += "		<button type='button' class='btn-down' onclick=\"bomEaChange('"+optionItemIdx+"', 'D');\">수량 낮추기</button> ";
		html += "		<button type='button' class='btn-up' onclick=\"bomEaChange('"+optionItemIdx+"', 'U');\">수량 올리기</button> ";
		html += "	</div> ";
		html += "	<a href='javascript:void(0);' class='btn-del' onclick=\"bomProductDel('"+optionItemIdx+"');\">삭제</a> ";
		html += "</div> ";
		
		$("#bomls").append(html);
		
		calcBom(); // BOM 상품 수량,금액 계산
	}else if(selYn == "Y"){
		bomProductDel(optionItemIdx); // 선택상품 정보 삭제
	}
}

// BOM 상품 삭제
function bomProductDel(optionItemIdx){
	$("#selYn"+optionItemIdx).val("N");
	$(".bomSelBtn"+optionItemIdx).addClass("btn-gray btn-select");
	$(".bomSelBtn"+optionItemIdx).removeClass("btn-whitegray btn-cancel");
	$(".bomSelBtn"+optionItemIdx).text("선택");
	
	$("#bomProductDiv"+optionItemIdx).remove();
	calcBom(); // BOM 상품 수량,금액 계산
}

// BOM 상품 수량 변경
function bomEaChange(optionItemIdx, flag){
	var currCnt = Number($("#bomListCnt"+optionItemIdx).val());
	var stockCnt = Number($("#selYn"+optionItemIdx).attr("data-stockCnt"));
	
	if(flag == "U"){ // 증가
		if(currCnt == stockCnt){
			alert("해당 제품의 잔여 재고는 "+comma(stockCnt)+"개입니다.");
		}else{
			currCnt += 1;
		}
	}else if(flag == "D"){ // 감소
		if(currCnt == 1){
			currCnt = 1;
		}else{
			currCnt -= 1;
		}
	}
	
	$("#bomListCnt"+optionItemIdx).val(currCnt);
	calcBom();
}

// BOM 상품 수량,금액 계산
function calcBom(){
	// 선택상품 수량 계산
	var bomProductCnt = 0;
	$(".bomListCnt").each( function (index) {
		bomProductCnt += 1;
	});
	
	$("#bomProductCnt").text(bomProductCnt); // 선택상품 수량
	
	// 총 상품금액 / 장바구니 / 바로구매 버튼 영역
	/* if(bomProductCnt > 0){
		$(".bomTotalArea").css("display", "block");
	}else{
		$(".bomTotalArea").css("display", "none");
	} */
	
	// 상품 nodata 세팅
	if(bomProductCnt > 0){
		$("#bomnodata").css("display", "none");
	}else{
		$("#bomnodata").css("display", "block");
	}
	
	// 총 상품금액 계산
	var totalPrice = 0;
	$(".bomListCnt").each( function (index) {
		var optionItemIdx = $(this).attr("data-optionItemIdx");
		var stockCnt = Number($(this).val());
		var price = Number($(this).attr("data-price"));
		
		$("#bomListPrice"+optionItemIdx).text(comma(stockCnt*price));
		
		totalPrice += price*stockCnt;
	});
	
	$("#bomTotalPrice").text(comma(totalPrice));
}

// BOM 장바구니
function bomCart(){
	
	if(didSubmit == true){
		return false;
	}
	
	didSubmit = true;
	
	
	didSubmit = false;	
	
	var arr = new Array();
	var arrCnt = 0;
	$(".bomListCnt").each( function (index) {
		var obj = new Object();
		
		obj.optionItemIdx = $(this).attr("data-optionItemIdx");
		obj.goodsCnt = $(this).val();
		obj.sessionId = getSessionId();
		obj.regularYn = "N";
		obj.clubMasterIdx = null;
		obj.addServiceYn = "N";
		obj.addServiceType = null;
		obj.addServiceContent = null;
		
		arr.push(obj);
		arrCnt += 1;
	});
	
	
	//addCartObject(arr);
	
	if(arrCnt > 0){
		var arrObjStr = JSON.stringify(arr);
		
		$.ajax({			
			url: getContextPath()+"/ajax/cart/addCartAjax.do",
		 	data: arrObjStr,
		 	type: "post",
		 	async: false,
		 	cache: false,
	        dataType : 'json',
	        contentType: "application/json", 
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(data){
				if(data.result == true){
					if(data.msg != ""){
						var cartCnt = Number(uncomma($(".cartCnt:eq(0)").text()));
						$(".cartCnt").text(comma(cartCnt+1));
						
						$("#cartTitle").text("장바구니담기");
						$("#cartText").text(data.msg);
						fn.popupOpen('#popCartAdd');
					}
					return true;
				}else{
					if(data.msg != ""){
						alert(data.msg);
					}
					return false;
				}
			 }
		});
	}else{
		alert("상품을 선택해 주세요.");
	}
}

// 장바구니 이동
function goCart(){
	location.href=getContextPath()+"/cart.do";
}

// BOM 바로구매 CHECK
function bomOrderCheck(){
	
	
	var di = "";
	
	
	
		di = "비회원";
	
	
	
	if(di == ""){
		didSubmit = false;	
		authType = "orderBom";
		$("#checkRealName").prop("checked",false);
		fn.popupOpen('#popCartRealname');
	}else{
		orderBom();
	}
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

// BOM 바로구매
function orderBom(){
	
	if(didSubmit == true){
		return false;
	}
	
	didSubmit = true;
	
	
	didSubmit = false;	
	
	
	var arrCart = new Array();
	var arrCnt = 0;
	$(".bomListCnt").each( function (index) {
		var goodsObj = new Object();
		
		goodsObj.goodsNo = $(this).attr("data-goodsNo");
		goodsObj.goodsCnt = $(this).val();
		goodsObj.optionItemIdx = $(this).attr("data-optionItemIdx");
		goodsObj.addServiceYn = "N";
		goodsObj.addServiceType = null;
		goodsObj.addServiceContent = null;
		
		arrCart.push(goodsObj);
		arrCnt += 1;
	});
	
	if(arrCnt > 0){
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
			success: function(data2){
				if(data2.result == true){
					var frm = document.orderForm;
					$("#sessionId").val(getSessionId());
					frm.action="/w/order/cartOrderProc.do";
					frm.submit();
				}else{
					if(data2.msg != ""){
						didSubmit = false;	
						alert(data2.msg);
					}
				}
			 }
		});
	}else{
		alert("상품을 선택해 주세요.");
	}
}

//페이지 이동
function goPage(page){
	$("#pageNo").val(page);
	$("#contents").waitMe({effect:'timer',text:'잠시만 기다려 주세요...',bg: 'rgba(255,255,255,0.7)',color: '#000',maxSize: '',waitTime: -1,textPos: 'vertical',fontSize: ''});	
	//상세검색 펼치기 저장
	if ($('.inner-sort .btn-search').hasClass("active")) {
		$("#schSearchActive").val("true");
	}
	else {
		$("#schSearchActive").val("false");
	}
	var frm = document.schForm;
	frm.action = "/w/product/productList.do";
	frm.submit();
}

//페이지 보기 개수 변경
function goChangePage(){
	$("#pageNo").val(1);
	$("#contents").waitMe({effect:'timer',text:'잠시만 기다려 주세요...',bg: 'rgba(255,255,255,0.7)',color: '#000',maxSize: '',waitTime: -1,textPos: 'vertical',fontSize: ''});	
	//상세검색 펼치기 저장
	if ($('.inner-sort .btn-search').hasClass("active")) {
		$("#schSearchActive").val("true");
	}
	else {
		$("#schSearchActive").val("false");
	}
	var frm = document.schForm;
	frm.action = "/w/product/productList.do";
	frm.submit();
}

//정렬순서 변경
function goChangeOrder(){
	$("#pageNo").val(1);
	$("#contents").waitMe({effect:'timer',text:'잠시만 기다려 주세요...',bg: 'rgba(255,255,255,0.7)',color: '#000',maxSize: '',waitTime: -1,textPos: 'vertical',fontSize: ''});	
	//상세검색 펼치기 저장
	if ($('.inner-sort .btn-search').hasClass("active")) {
		$("#schSearchActive").val("true");
	}
	else {
		$("#schSearchActive").val("false");
	}
	var frm = document.schForm;
	frm.action = "/w/product/productList.do";
	frm.submit();
}

function gosearch() {
	
	//상세검색 펼치기 저장
	if ($('.inner-sort .btn-search').hasClass("active")) {
		$("#schSearchActive").val("true");
	}
	else {
		$("#schSearchActive").val("false");
	}
	$("#contents").waitMe({effect:'timer',text:'잠시만 기다려 주세요...',bg: 'rgba(255,255,255,0.7)',color: '#000',maxSize: '',waitTime: -1,textPos: 'vertical',fontSize: ''});	
	$("#pageNo").val(1);
	var frm = document.schForm;
	frm.action = "/w/product/productList.do";
	frm.submit();
}

//초기화시 초기화후 바로 검색
function goInitSearch() {
	
	$('.sort-filter label input[type=checkbox]').each(function(){
		$(this).prop('checked',false);
	});
	$('.filter-list').empty();
	if ( !$('.inner-sort .btn-search').hasClass("active") ){
		$(".filter-area").slideUp('fast');
	}
	
	gosearch() ;
}

//상세검색펼치기
$(document).ready(function(){
	if ('false' == 'true') {
		$('.inner-sort .btn-search').trigger("click");
	} 
	/* 초기화 버튼 */
	/* $('.btn-init').click(function(){
		goInitSearch();
	}); */

	 
	/* 선택한 필터 삭제 */
	$('.filter-list').on('click',"a",function(){
		filterRemove($(this));
	});
});


function filterRemove(obj){
	
	var idx = obj.attr('data-idx');
	$('.sort-filter label input').each(function(){
		if(idx == $(this).prop("id")){
			$(this).closest('label').find('input[type=checkbox]').prop('checked',false);
			obj.closest('span').remove();
		}
	});
	gosearch() ;
}

</script>
</head>
<body class="stationery">	
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

<form name="schForm" id="schForm" method="post" action="/w/product/productList.do">
	<input type="hidden" name="schCateIdx1" id="schCateIdx1" value="184"/>
	<input type="hidden" name="schCateIdx2" id="schCateIdx2" value="234"/>
	<input type="hidden" name="schCateIdx3" id="schCateIdx3" value="235"/>
	<input type="hidden" name="schCateIdx4" id="schCateIdx4" value=""/>
	<input type="hidden" name="schCateIdx5" id="schCateIdx5" value=""/>
	<input type="hidden" name="pageNo" id="pageNo" value="1"/>	
	<input type="hidden" name="schSearchActive" id="schSearchActive" value="false"/>

	<main id="contents" class="goods category">
		<div class="inner">
			<div class="category-area">		
			
				<a href="/w/product/productList.do?schCateIdx1=1&schCateIdx2=2"><h2 class="ezwel-logo">monamimall</h2></a>
				
				<ul class="depth2">

							<li class="active" >
								<a href="<%=cp %>/monnami/content/content_main.jsp">Stationery</a>
							</li>		

				</ul>
			
				<!--
					선택한 위치 : ul.depth3 > li ul > li 클래스 active
				-->

							<ul class="depth3">

								<li>
									<a href="<%=cp %>/monnami/content/note/content_mainNote.jsp" class="depth3-tit">기록의 시작</a>
									<ul>

										<li ><a href="<%=cp %>/monnami/content/note/content_notes.jsp">필기용</a></li>
	
										<li ><a href="<%=cp %>/monnami/content/note/content_memo.jsp">메모용</a></li>

										<li ><a href="<%=cp %>/monnami/content/note/content_highlight.jsp">글자강조(Highlighting)</a></li>

										<li ><a href="<%=cp %>/monnami/content/note/content_exclusive.jsp">고급필기류</a></li>

										

									</ul>								
								</li>			

								<li>
									<a href="<%=cp %>/monnami/content/interior/content_mainInterior.jsp" class="depth3-tit">일상 꾸미기</a>
									<ul>

										<li class="active" ><a href="<%=cp %>/monnami/content/interior/content_interior.jsp">인테리어/소품 꾸미기</a></li>
								
										<li ><a href="<%=cp %>/monnami/content/interior/content_fabric.jsp">패브릭 꾸미기</a></li>
								
										<li ><a href="<%=cp %>/monnami/content/interior/content_diary.jsp">다이어리 꾸미기</a></li>
								
										<li ><a href="<%=cp %>/monnami/content/interior/content_drawing.jsp">그림그리기</a></li>
								
										

									</ul>								
								</li>			

								<li>
									<a href="<%=cp %>/monnami/content/child/content_mainChild.jsp" class="depth3-tit">상상과 표현</a>
									<ul>

										<li ><a href="<%=cp %>/monnami/content/child/content_child.jsp">유아~어린이</a></li>

									</ul>								
								</li>					
				
								<li>
									<a href="<%=cp %>/monnami/content/design/content_mainDesign.jsp" class="depth3-tit">생활 속 문구 </a>
									<ul>

										<li ><a href="<%=cp %>/monnami/content/design/content_design.jsp">디자인 문구</a></li>

									</ul>								
								</li>							
								
							</ul>
	
			</div>
			
			<!-- 5Depth 목록 -->

			<div class="category-sort">
				<div class="inner-sort">
					<h3>인테리어/소품 꾸미기</h3><span>등록상품 : <b> 28</b> 개</span>

				</div>
			</div>
				<!-- 사료 카테고리-->

				
				
				
<!-- 2018.09.13 의류카테고리 주석삭제// -->
<!-- //2018.09.13 의류카테고리 주석삭제 -->
			
			<div class="product-list">
<!-- 2018.10.10// -->
				<!-- nodata// 
				<div class="nodata">
					상품이 없습니다.
				</div>
				<!-- //nodata -->
				<!-- list// -->
				
				<ul>
				
					<li>
						<a href="#" class="btn-like" data-goodsno="MG000003585" >찜</a>
						<a href="/w/product/productDetail.do?goodsNo=MG000003585" >
							<span class="thumb-img"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003585/main/MG000003585_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'"  alt=""></span>
							<span class="info">
							
								<span class="txt-brand"></span>
						
								<strong class="txt-ti">유성매직 트윈 109</strong>
									
								<span class="txt-price">
								
								<em>1,300</em>원</span>
							</span>
							<span class="tag">
						
							</span>
						</a>
					</li>
					
					
				</ul>
				
				<!-- //list -->
<!-- //2018.10.10 -->

				<div class="paging">
					<a href='javascript:' class='btn-allprev' onclick='goPage(1);'>처음</a><a href='javascript:' class='btn-prev' onclick='goPage(1);' >이전</a><a href='javascript:' class='active'>1</a><a href='javascript:' class='btn-next' onclick='goPage(1);'>다음</a><a href='javascript:' class='btn-allnext' onclick='goPage(1);'>끝</a>					
				</div>
			</div>
		</div>
	</main>
</form>

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
	
	<input type="hidden" name="ordr_idxx" value="TEST201903110958190000467"/>
	
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






 <form name="orderForm" id="orderForm" method="post" onsubmit="return false;">
	<input type="hidden" name="sessionId" id="sessionId" value=""/>
	<input type="hidden" name="orderGoodsInfoListStr" id="orderGoodsInfoListStr" value=""/>
 </form>
 
 <!-- 장바구니 담기 -->
 <div id="popCartAdd" class="popup popcartadd">
	<div class="popinner">
		<header class="header">
			<h2 class="tit" id="cartTitle"></h2>
			<button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>
			<input type="hidden" id="cartType" name="cartType" value=""/>
		</header>

		<div class="contents">
			<p id="cartText"><p>

			<div class="btn-area">
				<button type="button" class="btn-white" onclick="fn.popupClose();">계속쇼핑</button>
				<button type="button" class="btn-black" onclick="goCart();">장바구니</button>
			</div>
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

<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html>