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
<form name="storypickForm" id="storypickForm" method="post" onsubmit="return false;">
	<input type="hidden" name="pageNo" id="pageNo" value="1"/>
	<input type="hidden" name="level2Idx" id="level2Idx" value="30"/>
	<input type="hidden" name="level3Idx" id="level3Idx" value="35"/>
	


<main id="contents" class="goods category">
	<div class="inner">
		<div class="category-area">
			<h2 class="depth2">
				<a href="/w/storypick/storypickCateList.do">Story Pick</a>
			</h2>

<!-- 선택한 위치 : ul.depth3 > li ul > li 클래스 active	-->
			<ul class="depth3">
			
			</ul>
		</div>		
	
		
		<div class="product-list storypick">
			<ul>
			
			
		<c:forEach var="dto" items="${lists }">
				<li>
					
					<a href="${articleUrl }&story_id=${dto.story_id }">
						
						<span class="info">
							
							<span class="txt-info">
							 <img src="${imagePath}/${dto.photo_saveFileName}" width="285px" height="285px" />						
							 <br/>
							 <strong class="txt-ti">${dto.story_subject}</strong>
							</span>
						</span>
					</a>
				</li>
			
			</c:forEach>	
				
								
<!-- 				<li id="li97">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="97">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=97&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList02.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[필기의 신]</span>
							<strong class="txt-ti">포인트를 주고 싶을 때, 형광펜</strong>
							<span class="txt-info">필기에도 강, 약이 필요하다!</span>
						</span>
					</a>
				</li>
								
				<li id="li96">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="96">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=96&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList03.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[필기의 신]</span>
							<strong class="txt-ti">감성을 더하고 싶을 때, 프러스펜</strong>
							<span class="txt-info">필기구의 진짜 매력은 내 손에 길들여진 후부터 시작된다 </span>
						</span>
					</a>
				</li>
								
				<li id="li88">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="88">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=88&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList04.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[필기의 신]</span>
							<strong class="txt-ti">암기가 필요할 땐 파란색으로 쓰세요</strong>
							<span class="txt-info">법학과 학생 서현씨만의 암기 노하우</span>
						</span>
					</a>
				</li>
								
				<li id="li79">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="79">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=79&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList05.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">M storyteller - 모나미의 6대 대표 제품</span>
							<strong class="txt-ti">6 SIGNATURES 과거와 현재를 잇다</strong>
							<span class="txt-info">Since 1963 과거와 현재</span>
						</span>
					</a>
				</li>
								
				<li id="li76">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="76">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=76&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList06.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[필기의 신]</span>
							<strong class="txt-ti">내가 모나미로 필기하는 이유</strong>
							<span class="txt-info">#모나미153골드실버 #모나미153펄</span>
						</span>
					</a>
				</li>
							
				<li id="li75">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="75">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=75&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList07.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[필기의 신]</span>
							<strong class="txt-ti">캘리그라피로 새해 카드 만들기</strong>
							<span class="txt-info">#모나미붓펜 #네임펜 #유성매직</span>
						</span>
					</a>
				</li>
								
				<li id="li74">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="74">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=74&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList08.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[필기의 신]</span>
							<strong class="txt-ti">플래너를 깔끔하게 정리하고 싶을 때!</strong>
							<span class="txt-info">#ESSENTI소프트형광펜 #올리카EF블랙</span>
						</span>
					</a>
				</li>
								
				<li id="li73">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="73">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=73&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList09.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[필기의 신]</span>
							<strong class="txt-ti">모나미로 기록하는 하루</strong>
							<span class="txt-info">#모나미153 #모나미올리카만년필EF </span>
						</span>
					</a>
				</li>
								
				<li id="li72">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="72">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=72&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList10.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[M storyteller]</span>
							<strong class="txt-ti">펜, 필기구 그 이상의 가치, Fisherman</strong>
							<span class="txt-info">153 Fisherman은 그물로 물고기를 잡는 어부의 모습과 성당의 스테인드글라스에서 영감을 받아  디자인된 펜입니다.</span>
						</span>
					</a>
				</li>
								
				<li id="li62">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="62">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=62&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList11.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[Inside the case]</span>
							<strong class="txt-ti">수집본능 일으키는 모나미펜!</strong>
							<span class="txt-info">#모나미덕후 #모나미전용필통 #네오밀키</span>
						</span>
					</a>
				</li>
								
				<li id="li61">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="61">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=61&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList12.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[Inside the case]</span>
							<strong class="txt-ti">모나미+그리픽스=♡</strong>
							<span class="txt-info">#모나미 #그리픽스</span>
						</span>
					</a>
				</li>
								
				<li id="li60">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="60">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=60&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList13.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[Inside the case]</span>
							<strong class="txt-ti">필통 속 모나미 제품을 소개합니다</strong>
							<span class="txt-info"># 153ID #153블랙 #모나미컴퓨터싸인펜</span>
						</span>
					</a>
				</li>
								
				<li id="li59">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="59">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=59&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList14.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[Inside the case]</span>
							<strong class="txt-ti">모나미 모르는사람 없게해주세요!</strong>
							<span class="txt-info">#모나미153 #펜스타그램</span>
						</span>
					</a>
				</li>
								
				<li id="li58">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="58">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=58&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList15.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[Inside the case]</span>
							<strong class="txt-ti">내 손에 제일 잘 맞는 펜!</strong>
							<span class="txt-info">#모나미1531.0 #모나미153아이스크림</span>
						</span>
					</a>
				</li>
								
				<li id="li50">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="50">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=50&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList16.jpg" alt="">
						</span>
							<span class="info">
								<span class="txt-brand">[Inside the case]</span>
								<strong class="txt-ti">모나미 덕후 필통 엿보기</strong>
								<span class="txt-info">#필통스타그램 #모나미덕후</span>
							</span>
					</a>
				</li>
								
				<li id="li46">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="46">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=46&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList17.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[Inside the case] </span>
							<strong class="txt-ti">나에게 필기구란 ‘모나미’다</strong>
							<span class="txt-info">모나미 제품을 애정하는 인스타그래머 jelly***씨의 필통 엿보기</span>
						</span>
					</a>
				</li>
								
				<li id="li39">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="39">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=39&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList18.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[마음을 전달하는 방법]</span>
							<strong class="txt-ti">졸업 선물</strong>
							<span class="txt-info">졸업을 앞둔 선,후배를 위한 특별한 선물!</span>
						</span>
					</a>
				</li>
								
				<li id="li38">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="38">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=38&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList19.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[마음을 전달하는 방법]</span>
							<strong class="txt-ti">신년 선물 세트</strong>
							<span class="txt-info">모나미가 추천하는 2019년 새해 선물 세트!</span>
						</span>
					</a>
				</li>
								
				<li id="li28">
					<a href="javascript:void(0);" class="btn-like" data-storyidx="28">찜</a>
					<a href="/w/storypick/storypickView.do?storyIdx=28&level2Idx=30&level3Idx=35&pageNo=1">
						<span class="thumb-img">
							<img src="/study/monnami/images/storypick/storyPickList20.jpg" alt="">
						</span>
						<span class="info">
							<span class="txt-brand">[Inside the case] </span>
							<strong class="txt-ti">나에게 필기구란 '소통의 수단'이다</strong>
							<span class="txt-info">모나미 덕분에 사춘기 아이와 친해질 수 있었어요</span>
						</span>
					</a>
				</li>
						 -->		
			</ul>
			
		<div class="paging">
			<a href='javascript:' class='btn-allprev' onclick='goPage(1);'>처음</a><a href='javascript:' class='btn-prev' onclick='goPage(1);' >이전</a><a href='javascript:' class='active'>1</a><a href='javascript:' onclick='goPage(2);'>2</a><a href='javascript:' class='btn-next' onclick='goPage(2);'>다음</a><a href='javascript:' class='btn-allnext' onclick='goPage(2);'>끝</a>
		</div>
						
		</div>
	</div>
</main>
</form>

<!-- 하단 -->
<jsp:include page="/monnami/monnamiBottom.jsp"/>
</body>
</html>