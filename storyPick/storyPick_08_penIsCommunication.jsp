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
<title>Insert title here</title>
</head>


<!-- 상단 -->
<jsp:include page="/monnami/content/monnamiTop.jsp"/>


<!-- 중앙 -->
<body class="storypick">	
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
				<input type="hidden" name="storyIdx" id="storyIdx" value="28"/>
				<input type="hidden" name="schCheck" id="schCheck" value=""/>
				<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
				<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
				<input type="hidden" name="pageNo" id="pageNo" value="1"/>
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>[Inside the case] </small> 나에게 필기구란 '소통의 수단'이다</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="28">찜</a>
							<span class="ico-view">47</span>
						</div>
					</div>
		
					<div class="detail-cont">
						
						
							<div class="cont editor-area">
								<center>
<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}

.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
.t_medium_1 {font-size:1.8em; line-height:1.3em; font-weight:bold; padding-bottom:50px;}
.t_medium_2 {font-size:4em; line-height:1.3em; font-weight:bold; padding-bottom:15px; color:lightgray;}
.t_normal {font-size:1.1em; line-height:1.8em; color:#666666;}

.img_big {display:inline-block; padding-bottom:60px;}

.clear {clear:both;}
</style>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList8.jpg" />
<div class="t_tit">&ldquo;모나미 덕분에 아이와 더 친해졌어요&rdquo;</div>

<div class="t_normal">두 딸 아이를 키우는 주부 미화씨는<br />
모나미란 사춘기 아이와 친해질 수 있게 만들어 준 &lsquo;소통의 수단 &rsquo; 이라고 말한다.<br />
예쁜 펜을 좋아하는 두 딸 덕분에 자연스럽게 펜을 수집하게 된 미화씨는<br />
아이가 사춘기에 접어든 시기에도 모나미 펜을 선물하며 아이와 대화의 물꼬를 틀 수 있었고,<br />
조금 더 다정하게 다가갈 수 있었었다고 한다.</div>
<br />
<br />
<br />
&nbsp;
<div class="t_tit">Q&amp;A</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList8_1.jpg" />
<div class="t_medium_1">Q1.미화씨에게 모나미란 어떤 의미인가요?</div>

<div class="t_medium_2">&ldquo;</div>

<div class="t_normal">두 가지 의미를 말씀드릴 수 있는데요.<br />
<br />
첫 번째는 &lsquo; 친구 &rsquo; 입니다. 중, 고, 대학교를 지방에서 졸업했는데 가장 쉽게 접할 수 있는 볼펜이 모나미 제품이었어요.<br />
평소 펜을 좋아해서 모나미 펜을 많이 구입했고, 항상 모나미 제품을 소지하고 다녀서<br />
저에게 있어 모나미는 늘 가까이 있는 친구 같은 존재였어요.</div>
&nbsp;

<div class="t_medium_2">&rdquo;</div>
<br />
<br />
<br />
<br />
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList8_2.jpg" />
<div class="t_medium_2">&ldquo;</div>

<div class="t_normal">두 번째는 아이와 친해질 수 있었던 &lsquo;소통의 수단 &rsquo; 이에요.<br />
아이가 사춘기에 접어들면서 대화의 시간이 많이 줄었는데 평소 펜을 좋아하는 아이를 위해 모나미 펜을 선물해줬고,<br />
그것을 계기로 아이와 자연스럽게 대화할 수 있는 시간을 마련할 수 있었어요.<br />
모나미 덕분에 아이의 사춘기 시기를 잘 이겨낼 수 있었네요.</div>

<div class="t_medium_2">&rdquo;</div>
<br />
<br />
<br />
<br />
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList8_3.jpg" />
<div class="t_medium_1">Q2. 자주 쓰는 펜을 소개해 주세요.</div>

<div class="t_medium_2">&ldquo;</div>

<div class="t_normal">모나미 Respect입니다.<br />
처음 이 제품을 사용해보고 촉감과 그립감, 그리고 글을 쓸 때의 사각거림이 정말 매력적으로 다가왔어요.<br />
글을 좀 더 잘 쓰기 위해서 제가 쓴 글을 읽어보며 문맥이 이상하지 않은지<br />
확인도 해보는데, 요즘은 더 정확하고 명확한 글쓰기를 해보려고 어휘를 따라서 적어보면서 글 연습도 하고 있답니다.<br />
이럴 때 Respect를 사용하면 글이 부드럽게 써져서 더 열심히 글에 몰입하게 돼요.</div>
&nbsp;

<div class="t_medium_2">&rdquo;</div>
<br />
<br />
<br />
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList8_4.jpg" />
<div class="t_medium_2">&ldquo;</div>

<div class="t_normal">모나미 프러스펜S도 자주 쓰는 제품 중 하나예요.<br />
노트에 필기할 일이 많진 않지만, 손글씨는 꾸준하게 연습하고 있는데요.<br />
프러스펜S로 손글씨를 따라 써보거나 캘리그라피 모양을 잡는 연습을 합니다.</div>
&nbsp;

<div class="t_medium_2">&rdquo;</div>
<br />
<br />
<br />
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList8_5.jpg" />
<div class="t_medium_1">Q3. 모나미 제품 중 사용해보고 싶은 제품이 있나요?</div>

<div class="t_medium_2">&ldquo;</div>

<div class="t_normal">올리카 EF를 사용해보고 싶어요. 만년필은 검은색 잉크만 생각했던 것 같은데요.<br />
대학교 시절에 만년필을 샀다가 제대로 활용하지 못하고 버렸던 기억이 있어요.<br />
이제는 좀 더 잘 써볼 수 있을 것 같다는 생각도 들고, 올리카 EF는 카트리지 색상도 다양한데다 가격도 저렴해서 놀라웠습니다.</div>
&nbsp;

<div class="t_medium_2">&rdquo;</div>
<br />
<br />
<br />
<br />
&nbsp;
<div class="t_tit">PRODUCT</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList8_6.jpg" />
<div style="text-align: left;"><b>1. 모나미 153 리스펙트 35,000원 : </b> 고급스러움을 강조하여 제작된 모나미 고급 필기구 라인 중 하나. 촉감과 그립감, 사각거리는 느낌이 좋아 글 연습할 때 자주 사용한다.<br />
<b>2. 모나미 프러스펜S 1,000원 : </b> 손글씨를 따라 쓰거나 캘리그라피 연습을 하는 용도로 사용한다.<br />
<b>3. 모나미 153 플라워(Flower) 5종세트 3,000원 : </b> 아이 선물용으로 구매한 153 플라워. 5개입 1세트를 구매해 딸아이와 나눠서 쓰고 있다.<br />
&nbsp;</div>
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
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000012">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000012" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000012/main/MG000000012_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">153 리스펙트</strong>
														
														<span class="txt-price">
															
															<em>35,000</em>원
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
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000026">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000026" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000026/main/MG000000026_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">153 플라워 </strong>
														
														<span class="txt-price">
															
															<em>3,000</em>원
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
								
							
								
									
									
								
								<div class="cont editor-area"><br />
<br />
&nbsp;</div>
								
								
								
								
								
								
								
								
								
								
								
								
								
							
						
						
						
						
						
						
		
						
						
							
								<div class="detail-tag">
									
										<a href="javascript:void(0);" onclick="goTopSearch('#프러스펜S');">#프러스펜S</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#153리스펙트');">#153리스펙트</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#모나미153플라워');">#모나미153플라워</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#올리카EF');">#올리카EF</a> 
									
								</div>
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=27">나에게 필기구란 ‘친구’다</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=29">고양이 화장실 쾌적한 환경 만들기</a></p>								
							
						
					</div>
					
					<div class="btn-area">
						<a href="javascript:void(0);" class="btn-black" onclick="goList();">목록</a>
					</div>
					
						
					
					
					</div>
				</form>
			
		
	</main>



</body>

<jsp:include page="/monnami/monnamiBottom.jsp"/>
	
</html>