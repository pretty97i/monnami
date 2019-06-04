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
				<a href="${listUrl }">Story Pick</a>
			</h2>

<!-- 선택한 위치 : ul.depth3 > li ul > li 클래스 active	-->
			<ul class="depth3">
				<li>
					<a href="${listUrl }" class="depth3-tit"><span>Stationery</span></a>
					<ul>
						<li class="active">
							<a href="${listUrl }"><span>필기</span></a>
						</li>
					</ul>
				</li>
			</ul>
		</div>		
		<div class="category-sort">
			<div class="inner-sort">
		
				<h3>필기</h3><span>등록스토리 : <b>0</b> 개</span>
	
					<div class="sort-area">
						<select name="pageSize" id="pageSize" onchange="goChangePage();">
							<option value="20" selected>20개씩</option>
							<option value="40" >40개씩</option>
							<option value="80" >80개씩</option>
							<option value="100" >100개씩</option>
						</select>		
						
					</div>					
			</div>
		</div>
		
		<div class="product-list storypick">
			<ul>
			
			
		<c:forEach var="dto" items="${lists }">
				<li>
					
					<a href="<%=cp %>/monnami/story/article?pageNum=${pageNum }&story_id=${dto.story_id }">
						
						<span class="info">
							<strong class="txt-ti">${dto.story_subject}</strong>
							<span class="txt-info">
							 <img src="${imagePath}/${dto.photo_saveFileName}" width="285px" height="285px" />						
							 
							</span>
						</span>
					</a>
				</li>
			
			</c:forEach>	
				
					
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