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
				<input type="hidden" name="storyIdx" id="storyIdx" value="88"/>
				<input type="hidden" name="schCheck" id="schCheck" value=""/>
				<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
				<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
				<input type="hidden" name="pageNo" id="pageNo" value="1"/>
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>[필기의 신]</small> 암기가 필요할 땐 파란색으로 쓰세요</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="88">찜</a>
							<span class="ico-view">95</span>
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
<div class="wrap_storypick" style="margin-bottom: 100px;"><img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList04.jpg" />
<div class="t_tit">법학과 학생 서현씨만의 암기 노하우</div>

<div class="t_normal" style="margin-bottom: 100px;">셀 수 없이 많은 단어, 복잡한 문장들을 무작정 암기하는 것만큼<br />
효율이 떨어지고 재미없는 암기법은 없다.<br />
<br />
암기 시간을 단축해 주는 특별한 필기 법부터암기&amp;필기에 좋은 필기구 추천까지!<br />
법학과에 재학 중인 서현씨가 알려주는 암기 노하우로 암기의 신에 한 발짝 다가가 보자.</div>

<div class="t_tit" style="margin-bottom: 30px;">Q&amp;A</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList04_1.jpg" />
<div class="t_tit">Q1. 서현씨만의 암기 노하우가 있나요?</div>

<div class="t_normal" style="margin-bottom: 50px;"><img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg" /> 
예전에 파란색으로 필기를 하면 더 기억이 잘 난다는 글을 본 적이 있는데요.<br />
원래 중요한 부분들은 빨간색으로 필기를 했었는데 그 글을 보고 나서부터 파란색 위주로 필기를 해봤어요.<br />
직접 해보니까 확실히 빨간색보다 파란색이 더 눈에 잘 들어오더라구요.<br />
<br />
형광펜도 원래 노란색을 사용했는데, 파스텔 톤 파란색으로 바꾸고 나서<br />
암기나 공부 효율이 좋아져서 형광펜 역시 파스텔 톤 파란색으로 사용하고 있어요.
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg" /></div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList04_2.jpg" />
<div class="t_normal" style="margin-bottom: 50px;">
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg" /> 위 사진과 같이 강조하는 부분 또는 중요한 뼈대가 되는 것은<br />
파란색 볼펜으로 작성하고 파스텔 톤의 파란색 형광펜을 사용하여 더 중요한 부분에 표시를 해주면,<br />
더 눈에 잘 띄고 암기가 잘 된답니다.<br />
포인트 형광펜은 모나미 칼라풀데이 형광펜 10색 세트를 활용하고 있어요. 
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg" /></div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList04_3.jpg" />
<div class="t_tit">Q2. 파란색 포인트를 주는 것 외에, 다른 노하우는 없나요?</div>

<div class="t_normal" style="margin-bottom: 50px;">
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg" /> 법학과에 재학 중이다 보니, 암기과목이 많은 편인데 저는 보통 쓰면서 외우는 편이에요.<br />
그치만 볼펜으로 필기를 하다보니 볼펜 값이나 리필 심을 감당하기 힘들더라구요.<br />
그래서 필기량이 많을 때는 샤프나 연필을 사용해요.<br />
<br />
다양한 연필을 사용해봤지만 그 중 바우하우스 육각지우개 연필이 가장 손이 많이 가요.<br />
연필심도 날리지 않고, 연필심도 단단하고 너무 진하지도 않은 B라서 많은 양의 필기가 필요할 때 적합하거든요. 
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg" /></div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList04_4.jpg" />
<div class="t_tit">Q3. 필기를 좋아하신다고 하니, 펜도 굉장히 많으실 것 같은데요.<br />
자주 쓰는 필기구가 있다면 추천해주세요.</div>

<div class="t_normal" style="margin-bottom: 50px;">
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg" /> 위 사진과 같이 강조하는 부분 또는 중요한 뼈대가 되는 것은<br />
파란색 볼펜으로 작성하고 파스텔 톤의 파란색 형광펜을 사용하여 더 중요한 부분에 표시를 해주면,<br />
더 눈에 잘 띄고 암기가 잘 된답니다.<br />
포인트 형광펜은 모나미 칼라풀데이 형광펜 10색 세트를 활용하고 있어요. 
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg" /></div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList04_5.jpg" />
<div class="t_normal" style="margin-bottom: 50px;">
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic1.jpg" /> 위 사진과 같이 강조하는 부분 또는 중요한 뼈대가 되는 것은<br />
파란색 볼펜으로 작성하고 파스텔 톤의 파란색 형광펜을 사용하여 더 중요한 부분에 표시를 해주면,<br />
더 눈에 잘 띄고 암기가 잘 된답니다.<br />
포인트 형광펜은 모나미 칼라풀데이 형광펜 10색 세트를 활용하고 있어요. 
<img alt="img" class="mark" src="/study/monnami/images/storypick/storyPickListBasic2.jpg" /></div>
</div>

							</div>
							
							
								
									
									
								
								<div class="cont editor-area"><!-- 상품1 소스 시작  -->
<div class="wrap_storypick">
<div class="t_tit">이 포스트에 등장한 펜</div>
</div>
</div>
								
								
								
								
								
								
								
								
								
								
								
								<div class="product-list "> 
									<ul>
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000177">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000177" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000177/main/MG000000177_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">칼라풀데이(ColorfulDay)</strong>
														
														<span class="txt-price">
															
															<em>400</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000106">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000106" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000106/main/MG000000106_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">바우하우스 육각지우개연필</strong>
														
														<span class="txt-price">
															
															<em>1,800</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000162">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000162" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000162/main/MG000000162_REP_THUMB_285X285_20190308115939.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">올리카(OLIKA) EF</strong>
														
														<span class="txt-price">
															
															<em>3,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
									</ul>
								</div>
								
							
								
									
									
								
								<div class="cont editor-area"></div>
								
								
								
								
								
								
								
								
								
								
								
							
						
						
						
						
						
						
		
						
						
							
								<div class="detail-tag">
									
										<a href="javascript:void(0);" onclick="goTopSearch('#153야미');">#153야미</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#바우하우스 육각지우개 연필');">#바우하우스 육각지우개 연필</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#올리카 만년필');">#올리카 만년필</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#칼라풀데이 형광펜 10색 세트');">#칼라풀데이 형광펜 10색 세트</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#암기잘하는법');">#암기잘하는법</a> 
									
								</div>
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=87">욕실을 청결하게 만들고 싶을 땐, 타일틈새마카</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=89">세상에서 장난감이 제일 좋아♡</a></p>								
							
						
					</div>
					
					<div class="btn-area">
						<a href="javascript:void(0);" class="btn-black" onclick="goList();">목록</a>
					</div>
					
						
					
					
					</div>
				</form>
			
		
	</main>



<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html>