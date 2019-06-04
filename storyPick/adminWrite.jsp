<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 	
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>물품등록</title>
<jsp:include page="/monnami/content/monnamiTop.jsp" /><!-- 상단 설화꺼 불러오기-->


<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="format-detection" content="telephone=no, email=no, address=no">
<meta name="keywords" content="" />
<meta name="description" content="문구, 모나미펫, 크래프트&하비, 모나르떼를 통합한 라이프스타일 편집샵" />


<script type="text/javascript">

function sendIt() {
		
	
	var f = document.storyWrite;
	
	/* str=f.story_subject.value;

	str=str.trim();
	
	if(!f.story_subject.value){ //값이 없으면 
		alert("\n제목을 입력하세요!");
		f.story_subject.focus();
		return;
		
	}
	
	f.story_subject.value=str;
	
	str=f.story_content.value;
	str=str.trim();
	
	if(!str){ //값이 없으면 
		alert("\n이름을 입력하세요!");
		f.story_content.focus();
		return;
		
	}
	f.story_content=str;
	 */
	
	f.action = "<%=cp %>/monnami/story/adminWrite_ok.do";
	f.submit();
	
	
}


</script>



<!-- //삭제안하기 -->
<body class="home" onload="radioDisabled();">	
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
<!-- //삭제안하기 -->

<!-- //중앙시작 -->
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
	<main id="contents" class="member join">
		<h2>StoryPick 글쓰기</h2>

		<div class="join-step2">
			
			
			<form action="" method="post" name="storyWrite" enctype="multipart/form-data">
				<input type="hidden" name="joinFlag" value="N">
				<input type="hidden" name="targetCode" id="targetCode" value="">
				<input type="hidden" name="rteDevice" id="rteDevice" value="">
				<input type="hidden" name="joinType" value="I">
				<input type="hidden" name="memberIdChkFlag" id="memberIdChkFlag" value="N"/>
				<input type="hidden" name="memberIdChk" id="memberIdChk" value="">
				<input type="hidden" name="memberEmailChkFlag" id="memberEmailChkFlag" value="N"/>
				<input type="hidden" name="memberEmailChk" id="memberEmailChk" value="">
				<input type="hidden" name="mailYn" id="mailYn" value="">
				<input type="hidden" name="smsYn" id="smsYn" value="">
			
					
				<fieldset class="joinform-field">		
					<legend class="hide">StoryPick 글 입력</legend>
					<h3>글쓰기</h3>
					<p class="txt-need"><em>*<span class="hide">필수</span></em> 표시는 반드시 입력하셔야 하는 항목 입니다.</p>
					
					<ul>						
						<li>
							<label>
								<strong>제목<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<input type="text" name="story_subject" id="story_subject" placeholder="제목 입력">
							</label>
						</li>
						
						<li>
							<label>
								<strong>내용<em class="bl-need">*<span class="hide">필수</span></em></strong>
								<textarea name="story_content" id="story_content" rows="20" cols="100"></textarea>							
							</label>						
						</li>
						
						<li>
							<label>
								<strong>첨부파일</strong>
								<input type="file" name="uploadFile"/>
							</label>						
						</li>
							
					
					</ul>
					<div class="btn-area">
						<button type="button" class="btn-black" onclick="sendIt();">확인</button>
						<button type="button" class="btn-white" 
						onclick="javascript:location.href='<%=cp %>/monnami/story/list.do'">취소</button>
						
					</div>
				
				</fieldset>
					</form>
			
		</div>
	</main>
<hr/>

<!-- //중앙끝 -->

<jsp:include page="/monnami/monnamiBottom.jsp"/>

</body>
</html>
