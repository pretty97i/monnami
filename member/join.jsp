<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

<jsp:include page="../monnamiTop.jsp" /><!-- 상단 설화꺼 불러오기-->

<div style="display: flex; border: 1px solid black;">
	
	<main id="contents" class="member join">
	<h2>회원가입</h2>
		<form name="joinStep01Form" id="joinStep01Form" method="post" onsubmit="return false;">
			<input type="hidden" name="joinFlag" id="joinFlag" value=""/>
			 

			<div class="join-step0 type2">
				<p align="center">모나미몰에 오신것을 환영합니다.</p>
				<div class="join-box">
					<div class="total-join" style="border: 1px;">
						<h3><b style="font-size: 25px;">모나미몰 신규회원가입</b></h3>
						<p>만 14세 이상, 본인인증 없이 간편하게<br>회원으로 가입할 수 있습니다. </p>

							<a href="javascript:" class="btn-black"  onclick="memberJoin();">신규회원가입</a> 

					</div>
				</div>
			</div>
		</form>
	</main>
</div>

<jsp:include page="/monnami/monnamiBottom.jsp"></jsp:include>

</body>
</html>