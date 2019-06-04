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
				<input type="hidden" name="storyIdx" id="storyIdx" value="76"/>
				<input type="hidden" name="schCheck" id="schCheck" value=""/>
				<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
				<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
				<input type="hidden" name="pageNo" id="pageNo" value="1"/>
				
					<input type="hidden" name="replyDupYn" id="replyDupYn" value="N"/>	
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>[필기의 신]</small> 내가 모나미로 필기하는 이유</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="76">찜</a>
							<span class="ico-view">37</span>
						</div>
					</div>
		
					<div class="detail-cont">
						
						
						
						
						
						
						<div class="sns-cont">
							<div class="swiper-container snsswiper">
								<div class="swiper-wrapper">
									
									
										<div class="swiper-slide">
											<a href="javascript:void(0);"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/76/2019012416305201357.jpg"></a>
										</div>
									
									
										<div class="swiper-slide">
											<a href="javascript:void(0);"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/76/2019012416305306383.jpg"></a>
										</div>
									
									
										<div class="swiper-slide">
											<a href="javascript:void(0);"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/76/2019012416305518226.jpg"></a>
										</div>
									
									
										<div class="swiper-slide">
											<a href="javascript:void(0);"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/76/2019012416305679239.jpg"></a>
										</div>
									
									
										<div class="swiper-slide">
											<a href="javascript:void(0);"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/76/2019012416305726659.jpg"></a>
										</div>
									
									
										<div class="swiper-slide">
											<a href="javascript:void(0);"><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/storypick/76/2019012416305841965.jpg"></a>
										</div>
									
									
								</div>
								
									<div class="swiper-button-next-sns">next</div>
									<div class="swiper-button-prev-sns">prev</div>
								
								<div class="swiper-pagination-sns"></div>
								<a href="#commentWrite" class="btn-comment">댓글입력 바로가기</a>
								<a href="javascript:void(0);" class="btn-like" data-storyidx="76">찜</a>
							</div>
		
							<div class="rcont">
								<div class="cont editor-area">
									<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center; padding-bottom:50px;}

.t_tit {font-size:1.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:5px;}
.t_medium_1 {font-size:1em; line-height:1.8em; color:#333333; padding:10px 0;}
.t_normal {font-size:1em; line-height:1.8em; color:#666666;padding:0px 0;}	
.clear {clear:both;}

.process {width:91%; margin:auto;}
.process ul,
.process li {list-style:none !important;}
.process li {width:500px; float:left; border-left:1px solid #f0f0f0; padding-bottom:40px;}
.process li.border_none {border-left:none;}
.process li img {display:block;}
</style>
<div class="t_tit">go***gh9</div>

<div class="t_normal" style="padding-bottom:20px;">나의 필기 노트 대공개<br />
보기만 해도 힐링 되는 모나미펜 때문에<br />
지겨운 필기도 즐겁게 할 수 있다♡<br />
<br />
* 내가 모나미로만 필기하는 이유*<br />
1. 저렴한데 잘 닳지 않는다<br />
2. 부드럽다<br />
3. 예뻐서 필기할 맛이 난다<br />
<br />
특히나 모나미DIY는 내 맘대로 꾸미는 것도 너무 재밌고<br />
그 뿌듯함에 필기도 더하고 싶다!<br />
시험기간때 세상 우울했던 나와 동거동락한 #모나미</div>

<div class="clear">&nbsp;</div>

								</div>
								
									<div class="tag">
										
											<a href="javascript:void(0);" onclick="goTopSearch('#필기의신');">#필기의신</a>
										
											<a href="javascript:void(0);" onclick="goTopSearch('#필기노트');">#필기노트</a>
										
											<a href="javascript:void(0);" onclick="goTopSearch('#모나미덕후');">#모나미덕후</a>
										
											<a href="javascript:void(0);" onclick="goTopSearch('#모나미DIY');">#모나미DIY</a>
										
											<a href="javascript:void(0);" onclick="goTopSearch('#모나미153골드실버');">#모나미153골드실버</a>
										
											<a href="javascript:void(0);" onclick="goTopSearch('#모나미153펄');">#모나미153펄</a>
										
									</div>
								
							</div>
						</div>
						<div  id="reply_box"></div>
						<div class="detail-comment">
							<h4>댓글</h4>
							
		
							<div id="commentWrite" class="comment-write">
								<textarea placeholder="댓글을 입력해주세요." name="replyDesc" id="replyDesc"></textarea>
								<span class="counter" id="counter">0/200</span>
								<a href="javascript:void(0);" class="btn-black btn-insert" onclick="replySave();">등록</a>
							</div>
						</div>
						
						
						<div class="product-list">
							<ul>
								
								<li>
									<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000006">찜</a>
									<a href="/w/product/productDetail.do?goodsNo=MG000000006" >
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000006/main/MG000000006_REP_THUMB_285X285.blob" onerror="this.src='/w/images/240x240.jpg'" alt="">
										</span>
										<span class="info">
											
												<span class="txt-brand"></span>
											
											
												<strong class="txt-ti">153 골드 </strong>
											
											<span class="txt-price">
												
												<em>50,000</em>원
											</span>
										</span>
										<span class="tag">
											
											
											
											
										</span>
									</a>
								</li>
								
								<li>
									<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000002">찜</a>
									<a href="/w/product/productDetail.do?goodsNo=MG000000002" >
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000002/main/MG000000002_REP_THUMB_285X285.blob" onerror="this.src='/w/images/240x240.jpg'" alt="">
										</span>
										<span class="info">
											
												<span class="txt-brand"></span>
											
											
												<strong class="txt-ti">153 DIY PEN KIT</strong>
											
											<span class="txt-price">
												
												<em>6,000</em>원
											</span>
										</span>
										<span class="tag">
											
											
											
											
										</span>
									</a>
								</li>
								
							</ul>
						</div>
						
		
						<div class="detail-plan">
							<div class="cont editor-area">
								
							</div>
						</div>
						
						
		
						
						
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=75">캘리그라피로 새해 카드 만들기</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=77">우리 집에 메신저가 필요할 땐? Chocho1101님의 보드마카!</a></p>								
							
						
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