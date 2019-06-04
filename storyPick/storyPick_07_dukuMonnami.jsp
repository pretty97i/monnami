<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<html lang="ko"><head>
<title>모나미 공식 쇼핑몰 모나미몰</title>
<meta charset="UTF-8">
<meta http-equiv="p3p" content="CP=&quot;CAO PSA CONi OTR OUR DEM ONL&quot; ">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="format-detection" content="telephone=no, email=no, address=no">
<meta name="keywords" content="">
<meta name="description" content="문구, 모나미펫, 크래프트&amp;하비, 모나르떼를 통합한 라이프스타일 편집샵">

<script>

$(document).ready(function(){
	var schCheck = "";
	
	if(schCheck == "Y"){
		$('html, body').animate({
			scrollTop: $('#reply_box').offset().top
		}, 'fast');
	}
	
	// 댓글 내용 focus 이벤트		
	$("#replyDesc").click(function(){
		 
		if(confirm("로그인이 필요합니다.") == true){
			location.href="/w/login/loginPage.do?refererYn=Y";
		}
		
	});
	
	// 댓글 내용 입력 글자 수 제한
     $("#replyDesc").bind("change keyup input",function (e){
    	 var replyDesc = $(this).val();
         
         if(replyDesc.length > 200){
			alert("댓글은 200자 이내로 작성해 주세요.");
			$("#replyDesc").val($("#replyDesc").val().substring(0, 200));
			$("#counter").html($("#replyDesc").val().length + "/200");
     		$("#replyDesc").focus();
     		return false;
         }else{
        	 $("#counter").html(replyDesc.length + "/200");
         }
     });
});

// SNS 공유
function snsShare(snsType){
	// F : 페이스북, K : 카카오스토리
	var nowPage = document.location.href;
	var title = "포인트를 주고 싶을 때, 형광펜";
 	var size = 'width=550 height=550';
	var url = "";
	
	if(snsType == "F"){
		url = '//www.facebook.com/sharer/sharer.php?u='+nowPage+'&t='+title;
	}else if(snsType == "K"){
		url = 'https://story.kakao.com/share?url='+encodeURIComponent(nowPage);
	}
	window.open(url,'_blank', size);  
}

// URL 공유
function urlShare(){
	var nowPage = document.location.href;
	var isIe = !!document.documentMode;
	if(isIe) {
		window.clipboardData.setData('Text', nowPage);
	    alert('클립보드에 복사가 되었습니다. \n\n\'Ctrl+V를 눌러 붙여넣기 해주세요.');
	} else {
		prompt('아래 주소를 복사 해주세요', nowPage);
	}
}


// 댓글 저장
function replySave(){
	if($.trim($("#replyDesc").val()) ==""){ // 내용
		alert("댓글 내용을 입력 해 주세요."); 
		$("#replyDesc").focus(); 
		return false;
	}
	if($.trim($("#replyDesc").val().length) < 10){ // 내용 길이
		alert("댓글은 10자 이상 작성해 주세요."); 
		$("#replyDesc").focus(); 
		return false;
	}
	if($.trim($("#replyDesc").val().length) > 200){ // 내용 길이
		alert("댓글은 200자 이내로 작성해 주세요."); 
		$("#replyDesc").focus(); 
		return false;
	}
	
	if(confirm("등록 하시겠습니까?") == true){
		$.ajax({			
			url: "/w/ajax/storypick/replySaveAjax.do",
			data: {
						"storyIdx"			:	$("#storyIdx").val(),
						"replyDupYn"		:	$("#replyDupYn").val(),
						"replyDesc" 		:	$("#replyDesc").val()
					 },
			type: "POST",	
			async: false,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			error: function(request, status, error){
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(flag){
				if(Number(flag) > 0){ 
					alert("등록 되었습니다.");
				}else if(Number(flag)==-1){
					alert("이미 등록 하셨습니다.");
				}else if(Number(flag) == -100) {
					alert("로그인이 필요합니다.");
					location.href="/w/login/loginPage.do?refererYn=Y";
				}else{
					alert("오류가 발생 하였습니다.");
				}
				document.location.reload();
			}
		});
	}
}

// 댓글 삭제
function replyDelete(idx){
	if(confirm("삭제 하시겠습니까?") == true){
		$.ajax({			
			url: "/w/ajax/storypick/replyDeleteAjax.do",
			data: {
						"storyReplyIdx"			:	idx
					 },
			type: "POST",	
			async: false,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			error: function(request, status, error){
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(flag){
				if(Number(flag) > 0){
					alert("삭제 되었습니다.");
					document.location.reload();
				}else{
					alert("오류가 발생 하였습니다.");
				}
			}
		});
	}
}

// 댓글 페이지 이동
function goPage(page){
	$("#pageNo").val(page);
	$("#schCheck").val("Y");
	
	var frm = document.storypickForm;
	frm.action = "/w/storypick/storypickView.do";
	frm.submit();
}

// 목록 (카테고리 유지)
function goList(){
	var frm = document.storypickForm;
	frm.action = "/w/storypick/storypickCateList.do";
	frm.submit();
}

</script>
</head>
<body class="storypick">

<!-- 상단 -->
<jsp:include page="/monnami/content/monnamiTop.jsp"/>

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
	


<!-- 중앙 -->
	
<main id="contents" class="storypick detail">
		
<form name="storypickForm" id="storypickForm" method="post" onsubmit="return false;">
				<input type="hidden" name="storyIdx" id="storyIdx" value="46"/>
				<input type="hidden" name="schCheck" id="schCheck" value=""/>
				<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
				<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
				<input type="hidden" name="pageNo" id="pageNo" value="1"/>
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>[Inside the case] </small> 나에게 필기구란 ‘모나미’다</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="46">찜</a>
							<span class="ico-view">282</span>
						</div>
					</div>
		
					<div class="detail-cont">
						
						
							<div class="cont editor-area">
								<center>
<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}

.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
.t_medium_1 {font-size:1.8em; line-height:1.3em; font-weight:bold; padding-bottom:50px;}
.t_medium_2 {font-size:4em; line-height:1.3em; font-weight:bold; padding-bottom:15px; color:lightgray;}
.t_normal {font-size:1.1em; line-height:1.8em; color:#666666; padding-bottom:60px;}
.t_normal_2 {font-size:1.1em; line-height:1.8em; color:#ce1439; padding-bottom:20px;}

.img_big {display:inline-block; padding-bottom:60px;}

.clear {clear:both;}
</style>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList7.jpg" />
<div class="t_tit">모나미덕후의 필통까기</div>

<div class="t_normal">평소 그림 그리기와 필기, 사진 찍기를 좋아하는 인스타그래머 jelly***씨는<br />
자신의 SNS 계정에 게시물을 업로드하며 사용자들과 소통하는 것이 취미다.<br />
<br />
자신을 #모나미덕후라고 소개하는 그는<br />
인스타그램 속 손그림과 필기작품의 대부분을 모나미 제품으로 제작해<br />
간단한 리뷰 형식의 게시물로 업로드하고 있다.<br />
실제 모나미 전용 필통을 소지하고 다닐 정도로 모나미 제품을 애정한다는<br />
인스타그래머 jelly***씨의 필통 속을 들여다봤다.</div>
<br />
<br />
<br />
&nbsp; <img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList7_1.jpg" />
<div class="t_medium_1">첫 번째 필통 들여다보기</div>

<div class="t_normal">첫 번째 필통은 평소에 자주 사용하는 제품들로 구성 된 메인 필통입니다.<br />
민트색을 좋아해서 민트 계열 위주로 들고 다니는데 16개 제품 중 12개가 모나미 제품입니다.<br />
즉 필통 속 펜 중 75%가 모나미 제품인 셈이죠.</div>

<div class="t_normal_2"><b>첫 번째 필통 속 모나미</b></div>

<div class="t_normal">모나미 153펄, 모나미 153ID샤프, 모나미 153 블라썸, 모나미 153 블랙,<br />
모나미 153 NEO 민트, 모나미 올리카 만년필, 모나미 컴퓨터 사인펜,<br />
모나미 네임펜, 모나미 라이브컬러 민트형광펜, 모나미 그리픽스 지우개</div>
<br />
<br />
<br />
<br />
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList7_2.jpg" />
<div class="t_medium_1">두 번째 필통 들여다보기 (Feat. 모나미 전용 필통)</div>

<div class="t_normal">그림을 그리고 필기를 하다 보니 가지고 있는 펜만 수 십 가지인데,<br />
한 필통에 다 가지고 다닐 수 없어서 모나미 전용 필통을 만들었습니다.<br />
총 12자루의 모나미 펜으로 구성되어 있습니다.</div>
&nbsp;

<div class="t_normal_2"><b>두 번째 필통 속 모나미</b></div>

<div class="t_normal">12자루의 모나미 153 DIY 펜, 오리지널 모나미 153, 모나미 153 카툰,<br />
모나미 워크룸키트에 있던 흰색153, 모나미 라이브컬러 핑크형광펜,<br />
모나미 라이브컬러 DIY 볼펜/형광펜</div>
<br />
<br />
<br />
<br />
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList7_3.jpg" />
<div class="t_medium_1">ETC. 구매 예정 제품</div>

<div class="t_normal">모나미 제품은 신제품이 출시되면 거의 구매하는 편입니다.<br />
조만간 구매 예정인 제품은 총 2개인데요.<br />
지난 11월 30일 발매된 모나미 153 YUMMY와(사진 ①)<br />
12월 10일 발매한 따끈따끈한 신제품, 모나미 153 NEO의 3번째 모델<br />
모나미 153 NEO 샤프까지(사진 ②) 필통 속에 추가될 예정입니다.</div>
<br />
<br />
&nbsp;</center>

							</div>
							
							
								
									
									
<div class="cont editor-area"><center>
<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}

.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
.t_medium_1 {font-size:1.8em; line-height:1.3em; font-weight:bold; padding-bottom:50px;}
.t_medium_2 {font-size:4em; line-height:1.3em; font-weight:bold; padding-bottom:15px; color:lightgray;}
.t_normal {font-size:1.1em; line-height:1.8em;}

.img_big {display:inline-block; padding-bottom:60px;}

.clear {clear:both;}
</style>
<div class="t_tit">이 포스트에 등장하는 펜</div>
</center>
</div>
								
								
								
								
								
								
								
								
								
								
								
								
								
								<div class="product-list "> 
									<ul>
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000007">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000007" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000007/main/MG000000007_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">153 네오 </strong>
														
														<span class="txt-price">
															
															<em>10,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000022">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000022" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000022/main/MG000000022_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">153 카툰 12종 세트</strong>
														
														<span class="txt-price">
															
															<em>6,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000001">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000001" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000001/main/MG000000001_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">BP 153 0.7mm</strong>
														
														<span class="txt-price">
															
															<em>300</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000008">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000008" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000008/main/MG000000008_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">153 네오 만년필 세트 패키지</strong>
														
														<span class="txt-price">
															
															<em>25,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
									</ul>
								</div>
								
							
						
						
						
						
						
						
		
						
						
							
								<div class="detail-tag">
									
										<a href="javascript:void(0);" onclick="goTopSearch('#153카툰');">#153카툰</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#153DIY');">#153DIY</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#153블라썸');">#153블라썸</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#153펄');">#153펄</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#라이브컬러');">#라이브컬러</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#모나미153NEO');">#모나미153NEO</a> 
									
								</div>
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=45">이제는 누구를 사랑하더라도 - 정호승</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=47">Happy new year! 2019</a></p>								
							
						
					</div>
					
					<div class="btn-area">
						<a href="javascript:void(0);" class="btn-black" onclick="goList();">목록</a>
					</div>
					
						
					
					
					</div>
				</form>
			
		
	</main>

</body>



<!-- 하단 -->
<jsp:include page="/monnami/monnamiBottom.jsp"/>

</html>