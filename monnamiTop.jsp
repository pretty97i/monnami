<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.getParameter("UTF-8");

String cp = request.getContextPath();	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/jquery.scrollbar.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/normalize.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/lib/swiper.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/common.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/contents.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/main.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/monnami/css/w/pruducts.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/monnami/js/cart.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/commonScript.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/function.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery.countdown.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery.ez-plus.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/jquery.scrollbar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/lazyload.min.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/monamimall.js"></script>
<script type="text/javascript" src="<%=cp%>/monnami/js/swiper.min.js"></script>



</head>
<body>
<header id="header" class="" style="display: block;" >

	
	<a href="#" class="btn-allmenu "><span class="menu-trigger"><span></span><span></span><span></span><small class="hide">메뉴</small></span></a>

	<div class="allmenu out"><!-- 햄버거메뉴 -->
		
		<div class="inner">
			<div class="scroll-wrapper cont scrollbar-macosx" style="position: relative; height: 447px;"><div class="cont scrollbar-macosx scroll-content scroll-scrollx_visible scroll-scrolly_visible" style="height: 447px; margin-bottom: 0px; margin-right: 0px; max-height: 447px;">
				<ul>
					<li class="stationery">
						<a href="<%=cp%>/monnami/content/content_main.jsp"><span>Stationery</span></a>
						<div class="subnav" style="top: 100px;">
							<ul>
								<li>
										<a href="<%=cp %>/monnami/content/note/content_mainNote.jsp"><span>기록의 시작</span></a>
										<ul>
											<li><a href="<%=cp %>/monnami/content/note/content_notes.jsp"><span>필기용</span></a></li>
												<li><a href="<%=cp %>/monnami/content/note/content_memo.jsp"><span>메모용</span></a></li>
												<li><a href="<%=cp %>/monnami/content/note/content_highlight.jsp"><span>글자강조(Highlighting)</span></a></li>
												<li><a href="<%=cp %>/monnami/content/note/content_exclusive.jsp"><span>고급필기류</span></a></li>
												
												</ul>	
									</li>						
								<li>
										<a href="<%=cp %>/monnami/content/interior/content_mainInterior.jsp"><span>일상 꾸미기</span></a>
										<ul>
											<li><a href="<%=cp %>/monnami/content/interior/content_interior.jsp"><span>인테리어/소품 꾸미기</span></a></li>
												<li><a href="<%=cp %>/monnami/content/interior/content_fabric.jsp"><span>패브릭 꾸미기</span></a></li>
												<li><a href="<%=cp %>/monnami/content/interior/content_diary.jsp"><span>다이어리 꾸미기</span></a></li>
												<li><a href="<%=cp %>/monnami/content/interior/content_drawing.jsp"><span>그림그리기</span></a></li>
												
												</ul>	
									</li>								
								<li>
										<a href="<%=cp %>/monnami/content/child/content_mainChild.jsp"><span>상상과 표현</span></a>
										<ul>
											<li><a href="<%=cp %>/monnami/content/child/content_child.jsp"><span>유아~어린이</span></a></li>
												</ul>	
									</li>														
								<li>
										<a href="<%=cp %>/monnami/content/design/content_mainDesign.jsp"><span>생활 속 문구 </span></a>
										<ul>
											<li><a href="<%=cp %>/monnami/content/design/content_design.jsp"><span>디자인 문구</span></a></li>
												</ul>	
									</li>
								</ul>
						</div>
					</li>

					<li class="best"><!-- 기존 hobby -->
						<a href="/w/bestMain.do"><span>BEST</span></a>
						<div class="subnav" style="top: 100px;">
							<ul>
								<li>
										<a href="/w/product/productList.do?schCateIdx1=241&amp;schCateIdx2=242"><span>필기류</span></a>
											<ul></ul></li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=241&amp;schCateIdx2=243"><span>인테리어</span></a>
											<ul></ul></li>							
								<li>
										<a href="/w/product/productList.do?schCateIdx1=241&amp;schCateIdx2=244"><span>다이어리</span></a>
											<ul></ul></li>							
								</ul>
						</div>
					</li>
					
					<li class="storypick">
						<a href="<%=cp%>/monnami/storyPick/storyPick.jsp"><span>Story Pick</span></a>
						<div class="subnav" style="top: 100px;">
							<ul>
								<li>
										<a href="<%=cp%>/monnami/storyPick/storyPick.jsp"><span>Stationery</span></a>
										<ul>
											<li><a href="<%=cp%>/monnami/storyPick/storyPick.jsp"><span>필기</span></a></li>

												</ul>
									</li>
							
								</ul>
						</div>
					</li>
					<li class="event">
						<a href="<%=cp%>/monnami/event/event_main.jsp"><span>Event</span></a>
						<div class="subnav" style="top: 100px;">
							<ul>
								<li><a href="<%=cp%>/monnami/event/event_main.jsp"><span>이벤트</span></a></li>

							</ul>
						</div>
					</li>
					
					<li class="qna">
						<a href="<%=cp%>/monnami/qna/notice.jsp"><span>Q&amp;A</span></a>
						<div class="subnav" style="top: 100px;">
							<ul>
								<li><a href="<%=cp%>/monnami/qna/sendqna.jsp"><span>1:1 문의하기</span></a></li>
								<li><a href="<%=cp%>/monnami/qna/notice.jsp"><span>공지사항</span></a></li>
				
								
							</ul>
						</div>
					</li>
					
					
				</ul>
			</div><div class="scroll-element scroll-x scroll-scrollx_visible scroll-scrolly_visible" style="display: none;"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="width: 0px; left: 0px;"></div></div></div><div class="scroll-element scroll-y scroll-scrollx_visible scroll-scrolly_visible"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="height: 276px; top: 0px;"></div></div></div></div>
		</div>
	</div>

	<h1 class="logo"><a href="<%=cp%>/monnami/monnamiMain.jsp"><img alt="" src="<%=cp%>/monnami/images/common/monnami.png"> Monami Mall</a></h1>
	<nav>
		<ul>
			<li class="stationery">
				<a href="<%=cp%>/monnami/content/content_main.jsp"><span><small>문구</small>Stationery</span></a>
				<div class="subnav" style="top: 100px; display: none; height: 204px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
					<ul>
						<li>
								<a href="<%=cp %>/monnami/content/note/content_mainNote.jsp"><span>기록의 시작</span></a>
								<ul>
									<li><a href="<%=cp %>/monnami/content/note/content_notes.jsp"><span>필기용</span></a></li>
										<li><a href="<%=cp %>/monnami/content/note/content_memo.jsp"><span>메모용</span></a></li>
										<li><a href="<%=cp %>/monnami/content/note/content_highlight.jsp"><span>글자강조(Highlighting)</span></a></li>
										<li><a href="<%=cp %>/monnami/content/note/content_exclusive.jsp"><span>고급필기류</span></a></li>
										
										</ul>	
							</li>							
						<li>
								<a href="<%=cp %>/monnami/content/interior/content_mainInterior.jsp"><span>일상 꾸미기</span></a>
								<ul>
									<li><a href="<%=cp %>/monnami/content/interior/content_interior.jsp"><span>인테리어/소품 꾸미기</span></a></li>
										<li><a href="<%=cp %>/monnami/content/interior/content_fabric.jsp"><span>패브릭 꾸미기</span></a></li>
										<li><a href="<%=cp %>/monnami/content/interior/content_diary.jsp"><span>다이어리 꾸미기</span></a></li>
										<li><a href="<%=cp %>/monnami/content/interior/content_drawing.jsp"><span>그림그리기</span></a></li>
										
										</ul>	
							</li>							
						<li>
								<a href="<%=cp %>/monnami/content/child/content_mainChild.jsp"><span>상상과 표현</span></a>
								<ul>
									<li><a href="<%=cp %>/monnami/content/child/content_child.jsp"><span>유아~어린이</span></a></li>
										</ul>	
							</li>							
														
						<li>
								<a href="<%=cp %>/monnami/content/design/content_mainDesign.jsp"><span>생활 속 문구 </span></a>
								<ul>
									<li><a href="<%=cp %>/monnami/content/design/content_design.jsp"><span>디자인 문구</span></a></li>
										</ul>	
							</li>					
						</ul>
				</div>
			</li>

			<li class="best">
				<a href="/w/monarteMain.do"><span><small>베스트</small>BEST</span></a>
				<div class="subnav" style="top: 100px; display: none; height: 84px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
					<ul>
						<li>
								<a href="/w/product/productList.do?schCateIdx1=237&amp;schCateIdx2=238"><span>필기류</span></a>
									<ul></ul></li>							
						<li>
								<a href="/w/product/productList.do?schCateIdx1=237&amp;schCateIdx2=240"><span>인테리어</span></a>
									<ul></ul></li>			
						<li>
								<a href="/w/product/productList.do?schCateIdx1=237&amp;schCateIdx2=238"><span>다이어리</span></a>
									<ul></ul></li>					
						</ul>
				</div>
			</li>
			
			
			
			<li class="storypick">
				<a href="<%=cp%>/monnami/storyPick/storyPick.jsp"><span><small>스토리픽</small>Story Pick</span></a>
				<div class="subnav" style="top: 100px; display: none; height: 180px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
					<ul>
						<li>
							<a href="<%=cp%>/monnami/storyPick/storyPick.jsp"><span>Stationery</span></a>
							<ul>
								<li><a href="<%=cp%>/monnami/storyPick/storyPick.jsp"><span>필기</span></a></li>

									</ul>
						</li>

						</ul>
				</div>
			</li>
			<li class="event">
				<a href="<%=cp%>/monnami/event/event_main.jsp"><span><small>이벤트</small>Event</span></a>
				<div class="subnav" style="top: 100px; display: none; height: 84px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
					<ul>
						<li><a href="<%=cp%>/monnami/event/event_main.jsp"><span>이벤트</span></a></li>
				
					</ul>
				</div>
			</li>

				
			<li class="qna">
				<a href="<%=cp %>/monnami/qna/notice.jsp"><span><small>고객센터</small>Q&amp;A</span></a>
				<div class="subnav" style="top: 100px; display: none; height: 84px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
					<ul>
						<li><a href="<%=cp %>/monnami/qna/notice.jsp"><span>공지사항</span></a></li>
						<li><a href="<%=cp %>/monnami/qna/sendqna.jsp"><span>1:1문의하기</span></a></li>
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
							<!-- <a href="/w/login/loginPage.do?memberFlag=N">비회원로그인</a> -->
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
			html += "<img  src=\""+imgpath+img+"\" alt=\"\" onerror=\"this.src='/study/monnami/images/240x240.jpg'\">";
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
	
/* 	function topsearchAjax(query) {				있으면 검색어쓸때 에러생김
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

	}; */
	
</script>

	<div id="popHSearch" class="hsearch">
	
		<button type="button" class="btn-close">닫기</button>
		<form action="/w/product/searchResult.do" id="topSearchFrm" method="post" onsubmit="return topsearch();">
		<input type="hidden" name="searchGbn" value="top">
			<fieldset class="search-field">
				<legend class="hide">검색</legend>
				<!-- 검색어 따라 fn.removeClass('.sdefault');fn.addClass('.slist');fn.addClass('.snodata'); 이용하시면 됩니다. -->
				<input type="text" placeholder="검색어를 입력하세요." name="keyword" id="top_search_keyword" title="검색어 입력" onkeyup="topSearchKeyup(event);" autocomplete="off">
				<button type="submit" class="btn-search">검색</button>
			</fieldset>
		</form>

		<!-- 초기화면// -->
		<div class="sdefault active">
			<div class="sword">
			 <!-- 추천 검색어//
				<div class="recom">
					<h3>추천 검색어</h3>
					<div class="scroll-wrapper ls scrollbar-macosx" style="position: relative;"><div class="ls scrollbar-macosx scroll-content" style="height: 382px; margin-bottom: 0px; margin-right: 0px; max-height: none;">
						<ul>
				
						<li><a href="javascript:goTopSearch('쉬바');">쉬바</a></li>
						<li><a href="javascript:goTopSearch('내추럴키티');">내추럴키티</a></li>
						<li><a href="javascript:goTopSearch('그르르');">그르르</a></li>
						<li><a href="javascript:goTopSearch('북커버');">북커버</a></li>
						<li><a href="javascript:goTopSearch('홀로그램파우치');">홀로그램파우치</a></li>
						</ul>
					</div><div class="scroll-element scroll-x" style="display: none;"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar"></div></div></div><div class="scroll-element scroll-y"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar"></div></div></div></div>
				</div>
				//추천 검색어
 			-->
				<!-- 최근 검색어// -->
				<div class="latest">
					<h3>최근 검색어</h3>
					<div class="scroll-wrapper ls scrollbar-macosx" style="position: relative;"><div class="ls scrollbar-macosx scroll-content" id="recentSearchList" style="height: 382px; margin-bottom: 0px; margin-right: 0px; max-height: none;"><div class="nodata">최근 검색한 내역이 없습니다.</div></div><div class="scroll-element scroll-x" style="display: none;"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar"></div></div></div><div class="scroll-element scroll-y"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar"></div></div></div></div>
					<div class="btn-area">
						<button type="button" class="btn-whitegray small btn-alldelete" onclick="recentSearchClear();">전체삭제</button>
					</div>
				</div>
				<!-- //최근 검색어 -->
			</div>

			
		</div>
		<!-- //초기화면 -->

		<!-- 검색입력시 데이타있을때// -->
		<div class="slist" id="searchHelperInner">
			
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


</body>
</html>