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
				<input type="hidden" name="storyIdx" id="storyIdx" value="79"/>
				<input type="hidden" name="schCheck" id="schCheck" value=""/>
				<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
				<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
				<input type="hidden" name="pageNo" id="pageNo" value="1"/>
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>M storyteller - 모나미의 6대 대표 제품</small> 6 SIGNATURES 과거와 현재를 잇다</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="79">찜</a>
							<span class="ico-view">207</span>
						</div>
					</div>
		
					<div class="detail-cont">
						
						
							<div class="cont editor-area">
								<style>
.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}
.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
.t_medium {font-size:1.8em; line-height:1.5em; font-weight:bold; padding-bottom:20px; letter-spacing:-1px; text-align:left;}
.t_normal {font-size:1.1em; line-height:1.8em; color:#666666;}
.t_normal_2 {font-size:1.1em; line-height:1.8em; color:#666666; letter-spacing:-1px; text-align:left;}
.img_big {display:inline-block; padding-bottom:60px;}
.prd_list {width:100%; text-align:center;}
.prd_list ul {list-style:none;}
.prd_list li {width:50%; float:left; margin-bottom:12px;}
.prd_list li img {display:block; border:0;}
.clear {clear:both;}

</style>

<div class="wrap_storypick">
    <div class="t_tit">Since 1963 과거와 현재를 잇다</div>
    <div class="t_normal" style="margin-bottom:50px;">
        6대 제품으로 불리는 모나미 대표 제품은 대한민국 필기구 역사의 과거와 현재를 관통하는 한국 필기구의 아이콘입니다.<br>
        과거부터 지금까지 오랜 시간 많은 사랑을 받아온 6대 제품과<br>
        시간이 흐르며 사람들의 생활에 맞게 변화해 온 제품을 함께 소개합니다. 
    </div>
    <img src="/study/monnami/images/storypick/storyPickList05.jpg" alt="img" class="img_big" style="margin-bottom:80px;"/>


    <div class="t_tit">37억 자루 이상 판매된 모나미 대표 스테디셀러<br>153 볼펜 - 메탈 소재의 153 블랙&화이트</div>
    <img src="/study/monnami/images/storypick/storyPickList05_1.jpg" alt="img"/>
    <div class="prd_list">
        <ul>
            <li>
                <a href="http://www.naver.com" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_2.jpg" alt="img"/></a>
                <div class="t_medium">153 볼펜</div>
                <div class="t_normal_2">
                    153 볼펜은 1963년 개발한 대한민국 최초의 유성 볼펜으로<br>
                    현재까지 전 세계에 37억 자루 이상 판매된 모나미의 대표 스테디셀러입니다.<br>
                    선명하고 깨끗한 0.7mm 볼과 부드러운 1.0mm 볼의 필기감,<br>
                    심플한 육각 형태의 몸통 등<br>
                    50년 동안 한결같은 디자인을 유지해온 국내 볼펜의 대명사입니다.
                </div>
            </li>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_3.jpg" alt="img"/></a>
                <div class="t_medium">153 Black&White</div>
                <div class="t_normal_2">
                    2016년, 153 볼펜 탄생의 53년을 맞아 탄생한 153 블랙&화이트는<br>
                    153 볼펜의 상징인 블랙과 화이트가 돋보이는 고급 볼펜입니다.<br>
                    메탈 소재의 바디와와 국제 규격 금속심을 장착하여 기존 볼펜의 변화를 선보이면서도<br> 
                    153 볼펜 디자인의 명맥을 유지하고 있습니다.
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear" style="margin-bottom:130px;"></div>

    <div class="t_tit">어떤 재질에도 마법처럼 쓸 수 있는 마카<br>병매직 - 휴대성을 강화한 매직캡</div>
    <img src="/study/monnami/images/storypick/storyPickList05_1.jpg" alt="img"/>
    <div class="prd_list">
        <ul>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_4.jpg" alt="img"/></a>
                <div class="t_medium">매직 잉크</div>
                <div class="t_normal_2">
                    대자보를 쓰거나 각종 사인이나 차트를 꾸밀 때 꺼내 드는 펜이 바로 모나미 매직펜,<br> 
                    일명 병매직입니다. 4mm부터 8mm까지 다양한 글씨 두께를 표현할 수 있는<br>
                    사각 닙은 매직펜의 아이덴티티입니다. 꾸밈 글씨부터 산업 현장의 거칠거나<br>
                    다양한 재질에까지 모나미 매직펜 하나면 해결할 수 있습니다.
                </div>
            </li>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_5.jpg" alt="img"/></a>
                <div class="t_medium">매직 캡</div>
                <div class="t_normal_2">
                    플라스틱으로 제작되어 가볍고, 클립을 적용하여 휴대하기 쉬운 매직 캡은<br>
                    기존 병매직의 장점을 그대로 유지하면서도 휴대성을 강화한 제품입니다.<br>
                    병매직 대비 냄새가 순한 매직 캡은 대자보, 사인 등은 물론<br>
                    산업 현장에서까지 널리 쓰이면서 많은 사랑을 받고 있습니다.
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear" style="margin-bottom:130px;"></div>

    <div class="t_tit">한국 수성펜의 아이콘<br>프러스펜 3000 - 고급스러운 프러스펜 S</div>
    <img src="/study/monnami/images/storypick/storyPickList05_1.jpg" alt="img"/>
    <div class="prd_list">
        <ul>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_6.jpg" alt="img"/></a>
                <div class="t_medium">프러스펜 3000</div>
                <div class="t_normal_2">
                    어떤 사람은 이 펜으로 메모를 하고 어떤 사람은 그림을 그리기도 합니다.<br> 
                    대한민국 대표 수성펜인 모나미 프러스펜 3000은 쉽게 뭉개지지 않는 견고한 닙과<br>
                    세밀한 표현이 가능한 필기선과 부드러운 필기감으로<br>
                    다양한 필기 목적을 충족시킵니다. 군더더기없는 담백한 디자인과<br>
                    부담없는 가격 역시 프러스펜에 손이 가는 이유입니다.
                </div>
            </li>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_7.jpg" alt="img"/></a>
                <div class="t_medium">프러스펜 S</div>
                <div class="t_normal_2">
                    프러스펜 3000의 고급 버전인  프러스펜S는 캡에 클립을 적용해<br>
                    휴대하기에 간편하며 필압 조절이 가능한 캘리그래피용 펜입니다.<br>
                    카트리지형 리필 방식이라 편리하고 경제적입니다.
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear" style="margin-bottom:130px;"></div>


    <div class="t_tit">모나미 판매 1위<br>네임펜 - 진하고 선명한 불투명 네임펜</div>
    <img src="/study/monnami/images/storypick/storyPickList05_1.jpg" alt="img"/>
    <div class="prd_list">
        <ul>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_8.jpg" alt="img"/></a>
                <div class="t_medium">네임펜 F</div>
                <div class="t_normal_2">
                    선명한 글씨와 잘 지워지지 않는 유성 펜의 덕목을 충실히 갖춘 모나미 네임펜.<br>
                    잉크의 접착력이 강해 유리, 플라스틱, 금속, 나무 등 다양한 재료에 사용하며<br>
                    닙의 굵기는 0.4mm, 1mm, 2mm 등으로  다양해<br>
                    가는 선부터 넓은 표면까지 모두 표현이 가능합니다.
                </div>
            </li>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_9.jpg" alt="img"/></a>
                <div class="t_medium">불투명 네임펜 132</div>
                <div class="t_normal_2">
                    금속과 나무, 플라스틱, 유리, 고무 등 다양한 표면 및 어두운 곳에서도 사용 가능한<br>
                    불투명 네임펜입니다.모든 곳에서 진하고 선명하게 써지는 것이 특장점으로,<br>
                    외부환경의 자극에 잘 지워지지 않으며 물기에도 강합니다.<br>
                    1.5mm 얇은 닙으로 세밀한 필기가 가능합니다.
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear" style="margin-bottom:130px;"></div>

    <div class="t_tit">전 세계 생산량 2위<br>보드마카 - 끝까지 선명한  생잉크 보드마카</div>
    <img src="/study/monnami/images/storypick/storyPickList05_1.jpg" alt="img"/>
    <div class="prd_list">
        <ul>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_10.jpg" alt="img"/></a>
                <div class="t_medium">보드마카</div>
                <div class="t_normal_2">
                    새하얀 화이트보드가 분필 가루 날리는 초록 칠판 자리를 대신했을 때,<br>
                    화이트보드 위를 매끄럽게 흘러가는 보드마카 시대가 도래했습니다.<br>
                    적은 힘으로도 쉽고 깨끗하게 지워지는 건 물론 장시간 펜 뚜껑을 열어놓아도<br>
                    잘 마르지 않고 냄새가 순한 게 특징입니다.<br>
                    전 세계 생산량 2위로 세계인이 사용하는 마카입니다.
                </div>
            </li>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_11.jpg" alt="img"/></a>
                <div class="t_medium">생잉크 보드마카</div>
                <div class="t_normal_2">
                    세계 최초로 출시한 출시한 생잉크 보드마카는 뚜껑을 열어놓아도 쉽게 마르지 않아<br>
                    사용하기 편리하며, 생잉크 타입으로 기존 필터 타입보다 더 오래 사용할 수 있습니다.<br>
                    둥근 닙, 사각 닙 중 선택이 가능하여 실용도가 높습니다.<br>
                    학원 선생님들이 추천하는 대한민국 NO.1 보드마카입니다.
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear" style="margin-bottom:130px;"></div>


    <div class="t_tit">한국 마카의 대명사<br>유성매직 - 진하고 선명한 생잉크 유성매직</div>
    <img src="/study/monnami/images/storypick/storyPickList05_1.jpg" alt="img"/>
    <div class="prd_list">
        <ul>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_12.jpg" alt="img"/></a>
                <div class="t_medium">유성매직</div>
                <div class="t_normal_2">
                    모나미 매직펜의 둥근 닙 버전으로 누구나 부담 없이 사용 가능한 유성매직의 대명사.<br>
                    다양한 표면에 사용할 수 있는 다용도 유성매직으로 알록달록한 12색으로<br>
                    구성돼 글씨뿐 아니라 그림을 그리기에도 안성맞춤입니다.<br>
                    알코올계 잉크를 사용해 냄새가 순한 것도 장점입니다.
                </div>
            </li>
            <li>
                <a href="#" target="_blank">
                <img src="/study/monnami/images/storypick/storyPickList05_13.jpg" alt="img"/></a>
                <div class="t_medium">생잉크 유성매직</div>
                <div class="t_normal_2">
                    유리, 플라스틱, 금속, 나무 등 다양한 표면에 사용 가능한 유성매직입니다.<br>
                    처음부터 마지막 잉크까지 진하고 선명한 잉크 색상을 유지하는 것이 특징이며,<br>
                    생잉크 타입으로 필터 타입에 비해 더 오래 사용할 수 있습니다.
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear"></div>

</div>



							</div>
							
							
								
									
									
								
								<div class="cont editor-area"></div>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								<div class="product-list "> 
									<ul>
										
										
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
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000015">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000015" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000015/main/MG000000015_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">153 블랙&화이트</strong>
														
														<span class="txt-price">
															
															<em>18,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000107">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000107" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000107/main/MG000000107_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">병매직</strong>
														
														<span class="txt-price">
															
															<em>1,500</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000072">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000072" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000072/main/MG000000072_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">매직캡</strong>
														
														<span class="txt-price">
															
															<em>1,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000184">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000184" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000184/main/MG000000184_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">프러스펜 3000</strong>
														
														<span class="txt-price">
															
															<em>300</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000186">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000186" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000186/main/MG000000186_REP_THUMB_285X285_20190308114626.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">프러스펜 S</strong>
														
														<span class="txt-price">
															
															<em>1,000</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000110">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000110" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000110/main/MG000000110_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">불투명 네임펜 132</strong>
														
														<span class="txt-price">
															
															<em>1,500</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000175">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000175" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000175/main/MG000000175_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">중간글씨용 네임펜(FINE)</strong>
														
														<span class="txt-price">
															
															<em>800</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000108">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000108" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000108/main/MG000000108_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">보드마카 B(둥근닙)</strong>
														
														<span class="txt-price">
															
															<em>800</em>원
														</span>
													</span>
												</a>
											</li>
										
										
										
											<li>
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000121">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000121" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000121/main/MG000000121_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">생잉크 보드마카 220(둥근닙)</strong>
														
														<span class="txt-price">
															
															<em>1,200</em>원
														</span>
													</span>
												</a>
											</li>
										
										
									</ul>
								</div>
								
							
						
						
						
						
						
						
		
						
						
							
								<div class="detail-tag">
									
										<a href="javascript:void(0);" onclick="goTopSearch('#모나미153');">#모나미153</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#프러스펜');">#프러스펜</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#네임펜');">#네임펜</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#모나미네임펜');">#모나미네임펜</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#보드마카');">#보드마카</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#유성매직');">#유성매직</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#불투명네임펜132');">#불투명네임펜132</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#생잉크 유성매직');">#생잉크 유성매직</a> 
									
								</div>
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=78">내 소품에 나만의 감성을 입히고 싶을 땐? 패브릭마카</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=80">생강차와 티코스터</a></p>								
							
						
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