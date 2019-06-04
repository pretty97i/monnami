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
				<input type="hidden" name="storyIdx" id="storyIdx" value="96"/>
				<input type="hidden" name="schCheck" id="schCheck" value=""/>
				<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
				<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
				<input type="hidden" name="pageNo" id="pageNo" value="1"/>
				
	
				<div class="inner">
					<h2>Story Pick</h2>
					<div class="detail-ti">
						<h3><small>[필기의 신]</small> 감성을 더하고 싶을 때, 프러스펜</h3>
						<ul class="share">
							<li><a href="javascript:void(0);" class="btn-facebook" onclick="snsShare('F');">facebook</a></li>
							<li><a href="javascript:void(0);" class="btn-kakaostory" onclick="snsShare('K');">카카오스토리</a></li>
							<li><a href="javascript:void(0);" class="btn-url" onclick="urlShare();">URL</a></li>
						</ul>
						<div class="ico-ls">
							<a href="javascript:void(0);" class="btn-like" data-storyidx="96">찜</a>
							<span class="ico-view">56</span>
						</div>
					</div>
		
					<div class="detail-cont">
						
						
							<div class="cont editor-area">
								<style type="text/css">.wrap_storypick {padding:0; margin:0; line-height:1.0em; font-size:1.0em; text-align:center;}
.t_tit {font-size:2.5em; line-height:1.3em; font-weight:bold; letter-spacing:-2px; padding-bottom:50px;}
.t_normal {font-size:1.1em; line-height:1.8em; color:#666666; text-align:center;}
.img_big {display:inline-block; padding-bottom:60px;}
.space {display:inline-block; padding-left:200px;}
.clear {clear:both;}
</style>
<div class="wrap_storypick" style="margin-bottom: 60px;"><img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList03.jpg" />
<div class="t_tit">필기구의 진짜 매력은<br />
내 손에 길들여진 후부터 시작된다</div>

<div class="t_normal" style="margin-bottom: 100px;">쓰면 쓸수록 길들여지는 필기구들을 좋아한다.<br />
내 손과 나의 글씨가 어디쯤으로 흘러갈지 안다는 듯 펜이 움직여 줄 때,<br />
혹은 이 펜이 어느 각도에서 더 좋은 필감을 보여주는지 내가 파악했을 때<br />
비로소 정말 나의 펜이 된 것 같은 느낌이 들며 애정이 생긴다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList03_1.jpg" />
<div class="t_normal" style="margin-bottom: 100px;">그런 이유로 만년필에 푹 빠지게 됐지만,<br />
그보다 더 오래 애정하며 사용하고 있는 것이 있으니 바로 모나미 &lsquo;프러스펜&rsquo;.<br />
<br />
처음엔 갓 깎은 연필처럼 뾰족하고 단단하다가 쓰면 쓸수록 조금씩 무뎌지고 부드러워진다.<br />
그런 변화를 느끼며 손글씨를 써내려가는 재미가 꽤나 쏠쏠하다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList03_2.jpg" />
<div class="t_normal" style="margin-bottom: 100px;">주변에서 정말 흔하게 볼 수 있는 프러스 펜.<br />
<br />
검정, 파랑, 빨강의 아주 기본적인 색 외에도총 36가지의 다채로운 색으로 만날 수 있다.<br />
단지 색이 더해진 것뿐인데 특별하고 새롭게 느껴진다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList03_3.jpg" />
<div class="t_normal" style="margin-bottom: 100px;">그림도 그려보고, 책을 읽으며 밑줄을 그을 때 책 표지색깔에 맞춰<br />
골라쓰기도 하고 필기를 할 때도 기분전환 겸 잘 쓰지 않았던 색을 써보기도 하니<br />
어느새 펜 끝이 나의 필기 스타일에 맞춰 변해있었다.<br />
<br />
나에게 길들여진 프러스펜으로 감성을 담은 시들을 적어봤다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList03_4.jpg" />
<div class="t_normal" style="margin-bottom: 100px;">가을비 내리는 길을 걸으면<br />
<span class="space">용혜원</span><br />
<br />
가을비가 내리면<br />
단풍으로 물든 이야기들이 가득한 거리에서<br />
사랑하는 사람을 만나야 한다.<br />
<br />
가을 빗속을 걸어 들어가며<br />
사랑하는 이와 다정하게<br />
팔짱 끼고 걸으면<br />
아픈 자국을 남겨놓고 떠나는<br />
가을도 쓸쓸하지만은 않다.</div>
<img alt="img" class="img_big" src="/study/monnami/images/storypick/storyPickList03_5.jpg" />
<div class="t_normal">이제는 누구를 사랑하더라도<br />
<span class="space">정호승</span><br />
<br />
이제는 누구를 사랑하더라도<br />
한 잎 낙엽으로 떨어져<br />
썩을 수 있는 사람을 사랑하라.<br />
<br />
한 잎 낙엽으로 썩어<br />
다시 봄을 기다리는 사람을 사랑하라.</div>
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
												<a href="javascript:void(0);" class="btn-like" data-goodsno="MG000000185">찜</a>
												<a href="/w/product/productDetail.do?goodsNo=MG000000185" >
													<span class="thumb-img">
														<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000000185/main/MG000000185_REP_THUMB_285X285.blob" onerror="this.src='/w/images/285x285.jpg'" alt="">
													</span>
													<span class="info">
														
															<span class="txt-brand"></span>
														
														
															<strong class="txt-ti">프러스펜 3000 세트</strong>
														
														<span class="txt-price">
															
															<em>7,200</em>원
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
										
										
									</ul>
								</div>
								
							
						
						
						
						
						
						
		
						
						
							
								<div class="detail-tag">
									
										<a href="javascript:void(0);" onclick="goTopSearch('#프러스S');">#프러스S</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#프러스펜S');">#프러스펜S</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#모나미프러스펜');">#모나미프러스펜</a> 
									
										<a href="javascript:void(0);" onclick="goTopSearch('#프러스펜');">#프러스펜</a> 
									
								</div>
							
						
						
					</div>
					
					
					
					<div class="prevnext">
						
							
							
								<p><strong>이전</strong><a href="/w/storypick/storypickView.do?storyIdx=95">추억을 담은 한귀퉁이</a></p>								
							
						
						
						
							
							
								<p><strong>다음</strong><a href="/w/storypick/storypickView.do?storyIdx=97">포인트를 주고 싶을 때, 형광펜</a></p>								
							
						
					</div>
					
					<div class="btn-area">
						<a href="javascript:void(0);" class="btn-black" onclick="goList();">목록</a>
					</div>
					
						
					
					
					</div>
				</form>
			
		
	</main>
	
	
	
<jsp:include page="/monnami/monnamiBottom.jsp"/>
	
</html>