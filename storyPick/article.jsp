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
	<input type="hidden" name="storyIdx" id="storyIdx" value="189">
	<input type="hidden" name="schCheck" id="schCheck" value="">
	<input type="hidden" name="level2Idx" id="level2Idx" value="30">
	<input type="hidden" name="level3Idx" id="level3Idx" value="35">
	<input type="hidden" name="pageNo" id="pageNo" value="1">

	<div class="inner">
		<h2>Story Pick</h2>
			<div class="detail-ti">			
				<h3><input type="hidden" name="story_subject">${dto.story_subject} </h3>				
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
				<div class="wrap_storypick" style="margin-bottom: 10px;">
					<img alt="img" class="img_big loading" src="${imagePath}/${dto.photo_saveFileName}" >
					
					
					<div class="t_normal" style="margin-bottom: 160px;">
						<input type="hidden" name="story_content">
						${dto.story_content } 
					
					
					</div>
				
				</div>
			</div>
		
		<div class="btn-area">
			<button type="button" class="btn-white" 
			onclick="javascript:location.href='<%=cp %>/monnami/story/update.do?pageNum=${pageNum }&story_id=${story_id }'">수정</button>
			
			<button type="button" class="btn-white" 
			onclick="javascript:location.href='<%=cp %>/monnami/story/delete.do'">삭제</button>
			
			<button type="button" class="btn-white" 
			onclick="javascript:location.href='<%=cp %>/monnami/story/list.do'">취소</button>
		</div>
	</div>
</form>
			
</main>
</div>
</body>

<jsp:include page="/monnami/monnamiBottom.jsp"/>
	
</html>