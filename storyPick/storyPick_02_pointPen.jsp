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
	
	
		
		
	
	<main id="contents" class="storypick detail">
		
			
			
			<form name="storypickForm" id="storypickForm" method="post" onsubmit="return false;">
				<input type="hidden" name="storyIdx" id="storyIdx" value="97">
				<input type="hidden" name="schCheck" id="schCheck" value="">
				<input type="hidden" name="level2Idx" id="level2Idx" value="30">
				<input type="hidden" name="level3Idx" id="level3Idx" value="35">
				<input type="hidden" name="pageNo" id="pageNo" value="1">
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>[필기의 신]</small> 포인트를 주고 싶을 때, 형광펜</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="97">찜</a>
							<span class="ico-view">57</span>
						</div>
					</div>
		
					<div class="detail-cont">
						
						
							<div class="cont editor-area">
							<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}
					.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
					.t_medium {font-size:1.8em; line-height:1.3em; font-weight:bold; padding-bottom:50px;}
					.t_normal {font-size:1.1em; line-height:1.8em; color:#666666; text-align:center;}
					.mark {display:block; margin:auto; padding:30px 0;}
					.img_big {display:inline-block; padding-bottom:60px;}
					.clear {clear:both;}
				</style>
<div class="wrap_storypick" style="margin-bottom: 60px;"><img alt="img" class="img_big loading" src="/study/monnami/images/storypick/storyPickList02.jpg" data-was-processed="true">
<div class="t_tit">필기에도 강, 약이 필요하다!</div>

<div class="t_normal" style="margin-bottom: 100px;">필기에 포인트를 주고 싶을 때,<br>
중요한 부분을 한 눈에 체크하고 싶을 때!<br>
필요한 부분만 빠르게 암기하고 싶을 때!<br>
<br>
필기의 신이 전하는 ‘형광펜’ 사용 꿀팁을 정독해보자.</div>

<div class="t_tit" style="margin-bottom: 30px;">Q&amp;A</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList02_1.jpg">
<div class="t_tit">Q1. 형광펜, 어떻게 활용하시나요?</div>

<div class="t_normal" style="margin-bottom: 80px;"><img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg"> 
시험 기간에 중요한 단어를 형광펜으로 체크하고 공부하다 보니 평소보다 암기가 잘 되더라구요.<br>
그때부터 형광펜을 효율적으로 활용하는 노하우가 생겼어요.<br>
<br>
책을 읽을 땐, 마음에 드는 구절을 체크하기도 하고<br>
회의할 때도 일반 펜과 형광펜을 각 1자루씩 꼭 챙겨서, 중요한 업무를 표시할 때 사용하고 있어요. <img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg"></div>

<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList02_2.jpg">
<div class="t_tit">Q2. 중요한 부분이 너무 많을 때는요?</div>

<div class="t_normal" style="margin-bottom: 80px;">
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg"> 
중요도에 따라 색이나 굵기를 다르게 체크해보세요.<br>
더 중요한 내용은 하늘색, 덜 중요한 내용은 보라색 등으로 규칙을 정해서 마킹하는 거예요.<br>
그럼 시험 전, 급하게 검토할 때 한 눈에 보기도 편하답니다. 
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg"></div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList02_3.jpg">
<div class="t_tit">Q3. 글씨가 번지지 않는 형광펜이 있나요?</div>

<div class="t_normal"><img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg"> 고체 타입의 형광펜을 추천해요.<br>
고체 타입이다 보니 잉크가 번질 일이 없고, 뚜껑을 닫아 놓지 않아도 잉크가 마를 걱정이 없죠.<br>
<br>
<br>
특히, 모나미의 ‘에센티 스틱&nbsp;형광펜’을 좋아하는데요.<br>
타사 제품보다 부드럽고 색이 선명해 손이 자주 가는 것 같아요. 
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg"></div>
</div>

							</div>
							
							
								
									
									
								
								<div class="cont editor-area"><!-- 상품1 소스 시작  -->
<div class="wrap_storypick">
<div class="t_tit">이 포스트에 등장한 펜</div>
</div>
</div>
								
								
								
								
								
								
								
								
								
								<div class="product-list type2"> 
									<ul>
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000151">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000151">
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000151/main/MG000000151_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">에센티스틱 브라이트 고체타입</strong>
														
														<span class="txt-price">
															
															<em>700</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000144">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000144">
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000144/main/MG000000144_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">에딩슈퍼 형광펜 600</strong>
														
														<span class="txt-price">
															
															<em>300</em>원
														</span>
													</span>
												</a>
											</li>
										
										
									</ul>
								</div>
								
							
								
									
									
								
								<div class="cont editor-area"></div>
								
								
								
								
								
								
								
								
								
							
						
						
						
						
						
						
		
						
						
							
								<div class="detail-tag">
									
										<a href="javascript:void(0);" onclick="goTopSearch('#에딩슈퍼 형광펜 600');">#에딩슈퍼 형광펜 600</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#에센티스틱 브라이트 고체타입');">#에센티스틱 브라이트 고체타입</a> 
									
								</div>
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=96">감성을 더하고 싶을 때, 프러스펜</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=98">노즈워크에 좋은 독트릿 추천!</a></p>								
							
						
					</div>
					
					<div class="btn-area">
						<a href="javascript:void(0);" class="btn-black" onclick="goList();">목록</a>
					</div>
					
						
					
					
					</div>
				</form>
			
		
	</main>
	
	
<hr>



</body>
</html>