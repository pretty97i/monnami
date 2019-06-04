<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/monnami/content/monnamiTop.jsp"/>
</head>
<body>

<body class="home">	
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

	<main id="contents" class="event detail">
		
			
				<form name="eventForm" id="eventForm" method="post" onsubmit="return false;">
					<input type="hidden" name="pageNo" id="pageNo" value="1">
					<input type="hidden" name="promotionIdx" id="promotionIdx" value="70">
					<input type="hidden" name="gubun" id="gubun" value="E">
					
					
					
					<input type="hidden" name="replyYn" id="replyYn" value="Y">	
					<input type="hidden" name="replyDupYn" id="replyDupYn" value="Y">	
					<input type="hidden" name="nomemberYn" id="nomemberYn" value="N">	
					<input type="hidden" name="schCheck" id="schCheck" value="">
					
		
					<div class="inner">
						<h2>
							<a href="javascript:void(0);"><strong>EVENT</strong></a>
						</h2>
			
						<div class="detail-ti">
							<h3>
								<small>2019.03.05 ~ 2019.04.02</small>
								모나미몰 라이프스타일 컨설팅
							</h3>

						</div>
			
						<div class="detail-cont editor-area">
							<img alt="" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/editor/2019030608363195825.jpg" style="width: 1200px; height: 2000px;" class="loaded" data-was-processed="true">
						</div>
						
						<div id="reply_box"></div>
						<div class="detail-comment">
							
							
							
							<div class="comment-write">
								<textarea placeholder="댓글을 입력해주세요." name="replyDesc" id="replyDesc"></textarea>
								<span class="counter" id="counter">0/200</span>
								<a href="javascript:void(0);" class="btn-black btn-insert" onclick="replySave();">등록</a>
							</div>
			
							<div class="comment-list">
								<ul>
									
										
									
								</ul>
			
								<div class="paging">
									<a href="javascript:" class="btn-allprev" onclick="goPage(1);">처음</a><a href="javascript:" class="btn-prev" onclick="goPage(1);">이전</a><a href="javascript:" class="active">1</a><a href="javascript:" onclick="goPage(2);">2</a><a href="javascript:" onclick="goPage(3);">3</a><a href="javascript:" onclick="goPage(4);">4</a><a href="javascript:" onclick="goPage(5);">5</a><a href="javascript:" class="btn-next" onclick="goPage(5);">다음</a><a href="javascript:" class="btn-allnext" onclick="goPage(5);">끝</a>
								</div>
							</div>
						</div>
						
						
						
						<div class="detail-pro type1">
							<div class="product-list">
								<ul>
									
								</ul>
							</div>
						</div>
						
						
						
			
						<div class="btn-area">
							<a href="<%=cp %>/monnami/event/event_main.jsp" class="btn-black">목록</a>
						</div>
					</div>
				</form>
			
			
		
	</main>
	
<jsp:include page="/monnami/monnamiBottom.jsp"/>
	
</body>
</html>