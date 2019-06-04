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
				<input type="hidden" name="storyIdx" id="storyIdx" value="72"/>
				<input type="hidden" name="schCheck" id="schCheck" value=""/>
				<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
				<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
				<input type="hidden" name="pageNo" id="pageNo" value="1"/>
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>[M storyteller]</small> 펜, 필기구 그 이상의 가치, Fisherman</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="72">찜</a>
							<span class="ico-view">111</span>
						</div>
					</div>
		
					<div class="detail-cont">
						
						
							<div class="cont editor-area">
								<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}
.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
.t_medium {font-size:1.5em; line-height:1.5em; padding-bottom:20px;}
.t_normal {font-size:1.1em; line-height:1.8em; color:#666666;}
.img_big {display:inline-block; padding-bottom:60px;}

.clear {clear:both;}
</style>
<div class="wrap_storypick" style="margin-bottom: 80px;">
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList6_1.jpg" />
<div class="t_medium">&ldquo;그물로 시몬 베드로가 올라가서 그물을 육지에 끌어올리니<br />
가득히 찬 큰 고기가 일백쉰 세 마리라 이같이 많으나 그물이 찢어지지 아니하였더라&rdquo;<br />
- 요한복음 21:11 -</div>

<div class="t_normal" style="margin-bottom: 150px;">&lsquo;153&rsquo;에 얽힌 이야기 중 한 가지는 바로 요한복음 21장에 나온 물고기 수에 관한 이야기입니다.<br />
이 이야기에 영감을 받아 만들어진 펜이 있는데요.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList6_2.jpg" />
<div class="t_tit">바로, 153 피셔맨(Fisherman)입니다.</div>

<div class="t_normal" style="margin-bottom: 150px;">153 Fisherman은 그물로 물고기를 잡는 어부의 모습과 성당의 스테인드글라스에서 영감을 받아 디자인된 펜입니다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList6_3.jpg" />
<div class="t_normal" style="margin-bottom: 150px;">은으로 수제 제작된 이 펜은 세라믹 상감 작업과 백금을 도금으로 마감 처리하여 보석과 같이 영롱하게 표현되었습니다.<br />
특히, 보석분야의 최고 명장인 손광수 명장이 아주 세밀한 부분까지 직접 제작해 가치를 더합니다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList6_4.jpg">
<div class="t_normal" style="margin-bottom: 150px;">이 펜에 가치를 더욱 더한다면, 이 펜이 만들어진 배경에 있습니다.<br />
153 Fisherman은 바로 지난 2014년, 프란치스코 교황이 방한했을 때 방한 기념으로 만들어진 펜이기 때문입니다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList6_5.jpg" />
<div class="t_normal" style="margin-bottom: 150px;">프란치스코 교황이 방문했던 2014년, 모나미는 프란치스코 방한 준비위원회를 꾸려 153 Fisherman을 제작합니다.<br />
그리고 방한일인 8월 11일, 프란치스코 교황에게 이를 헌정했죠.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList6_6.jpg" />
<div class="t_normal" style="margin-bottom: 150px;">&ldquo;가난한 자, 소외된 이들의 벗으로 불리는 프란치스코 교황님의 방한은 복잡한 어려움에 처한 한국 사회에 큰 희망과 위로가 되었다.<br />
이에 모나미에서 존경과 감사의 마음을 전한다.<br />
특히 대표제품 153 볼펜이 요한복음의 말씀을 전하고 있는 만큼, 이 메시지를 담은 특별한 펜을 제작하였다&rdquo;<br />
<br />
- 2014년, 모나미 송하경 대표 -</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList6_7.jpg" />
<div class="t_normal">단순히 필기 목적 이상의 가치를 담아,<br />
존경과 감사의 마음을 전달하고 있는 153 Fisherman.</div>
</div>

							</div>
							
							
								
									
									
								
								<div class="cont editor-area"></div>
								
								
								
								
								
								
								
								<div class="product-list type2"> 
									<ul>
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000027">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000027" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000027/main/MG000000027_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">153 피셔맨 (FISHERMAN)</strong>
														
														<span class="txt-price">
															
															<em>2,000,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
									</ul>
								</div>
								
							
						
						
						
						
						
						
		
						
						
							
								<div class="detail-tag">
									
										<a href="javascript:void(0);" onclick="goTopSearch('#Fisherman');">#Fisherman</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#피셔맨');">#피셔맨</a> 
									
								</div>
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=71">오랜만의 커피 타임</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=73">모나미로 기록하는 하루</a></p>								
							
						
					</div>
					
					<div class="btn-area">
						<a href="javascript:void(0);" class="btn-black" onclick="goList();">목록</a>
					</div>
					
						
					
					
					</div>
				</form>
			
		
	</main>






<!-- 하단 -->
<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html>