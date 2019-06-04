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
<main id="contents" class="event index">
			<div class="inner">
				<h2>
					<a href="javascript:void(0);"><strong>EVENT</strong></a>
				</h2>

				<div class="event-tabs">
	
					
				</div>
	
				<div class="event-list">

							<ul>
								
								<li>
									<a href="<%=cp%>/monnami/event/event_concierge.jsp">
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/75/2019030617235355989.jpg" class="loading" data-was-processed="true">
										</span>
										<span class="info">
											<span class="txt-date">2019.03.06~2019.12.31</span>
											<strong class="txt-ti ellipsis">전화 한통으로 간편하게! 쇼핑 컨시어지 서비스</strong>
										</span>
									</a>
								</li>
								
								<li>
									<a href="<%=cp%>/monnami/event/event_monartte.jsp">
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/73/2019030513483950377.jpg" class="loading" data-was-processed="true">
										</span>
										<span class="info">
											<span class="txt-date">2019.03.05~2019.03.31</span>
											<strong class="txt-ti ellipsis">모나르떼 단권  10% 할인 + 에코백 증정</strong>
										</span>
									</a>
								</li>
								
								<li>
									<a href="<%=cp%>/monnami/event/event_march.jsp">
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/72/2019030511201717938.jpg" class="loading" data-was-processed="true">
										</span>
										<span class="info">
											<span class="txt-date">2019.03.05~2019.03.31</span>
											<strong class="txt-ti ellipsis">3월의 구매사은품</strong>
										</span>
									</a>
								</li>
								
								<li>
									<a href="<%=cp%>/monnami/event/event_lifestyle.jsp">
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/70/2019030508285190900.jpg" class="loading" data-was-processed="true">
										</span>
										<span class="info">
											<span class="txt-date">2019.03.05~2019.04.02</span>
											<strong class="txt-ti ellipsis">모나미몰 라이프스타일 컨설팅</strong>
										</span>
									</a>
								</li>
								
								<li>
									<a href="<%=cp%>/monnami/event/event_maxhill.jsp">
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/35/2019022216425172844.jpg" class="loading" data-was-processed="true">
										</span>
										<span class="info">
											<span class="txt-date">2019.03.05~2019.03.31</span>
											<strong class="txt-ti ellipsis">맥스힐 프로바이오틱스 체험단 모집</strong>
										</span>
									</a>
								</li>
								
								<li>
									<a href="<%=cp%>/monnami/event/event_coloring.jsp">
										<span class="thumb-img">
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/promotion/36/2019030516423756828.jpg" class="loading" data-was-processed="true">
										</span>
										<span class="info">
											<span class="txt-date">2019.03.01~2019.04.31</span>
											<strong class="txt-ti ellipsis">색채 도구 세트 구매 시 컬러링 페이퍼 증정</strong>
										</span>
									</a>
								</li>
								
							</ul>
			
							<div class="paging">
								<a href="javascript:" class="btn-allprev" onclick="goPage(1);">처음</a><a href="javascript:" class="btn-prev" onclick="goPage(1);">이전</a><a href="javascript:" class="active">1</a><a href="javascript:" class="btn-next" onclick="goPage(1);">다음</a><a href="javascript:" class="btn-allnext" onclick="goPage(1);">끝</a>
							</div>

				</div>
			</div>
		</main>

<jsp:include page="/monnami/monnamiBottom.jsp"/>
</body>
</html>