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
<title>Insert title here</title>
<link rel="stylesheet" href="/study/monnami/css/common.css">


</head>
<body>


<!-- 하단 -->

<div id="footer">
	<div class="util">
		<div class="inner">
			<div class="notice">
				<strong>공지사항</strong>
				<a href="/w/cscenter/notice/noticeList.do" class="btn-more"><img alt="" src="/study/monnami/images/common/plus.png" ></a>
				<ul>
					<li>
							<a href="/w/cscenter/notice/noticeView.do?noticeIdx=43">
								<span class="txt-subject">통합회원 전환 방법을 안내합니다. </span>
								<span class="txt-date">2019.03.06</span>
							</a>
						</li>
					<li>
							<a href="/w/cscenter/notice/noticeView.do?noticeIdx=23">
								<span class="txt-subject">3월 카드사 무이자 할부 안내</span>
								<span class="txt-date">2019.02.28</span>
							</a>
						</li>
					<li>
							<a href="/w/cscenter/notice/noticeView.do?noticeIdx=6">
								<span class="txt-subject">편리한 예치금 서비스! 소개합니다. </span>
								<span class="txt-date">2019.02.12</span>
							</a>
						</li>
					</ul>				
			</div>
			<div class="customer">
				<strong><a href="/w/cscenter/faq/faqList.do">고객지원센터  &gt;</a></strong>
				<div class="info">
					<em>1544-2884</em>
					평일 <strong>08:30~17:30</strong> (점심시간 <strong>12:00~13:00</strong>)<br>
					주말/공휴일: 휴무
				</div>
				<p class="btn-area">
					<a href="<%=cp %>/monnami/qna/sendqna.jsp" class="btn-whitegray small">1:1 상담 문의</a>
				</p>
			</div>
			<div class="helper">
				<strong><small>전화 한통으로 간편하게 주문</small> 컨시어지 서비스</strong>
				<p class="btn-area">
					<a href="/w/cscenter/notice/noticeView.do?noticeIdx=1" class="btn-whitegray small">컨시어지 서비스 문의</a>
				</p>
			</div>
			<div class="sns">
				<strong>모나미 공식 SNS</strong>
				<p class="btn-area">
					<a href="https://www.instagram.com/monami_pet/" target="_blank" class="btn-Instagram" title="인스타그램 새창 열림">인스타그램</a>
					<a href="https://www.facebook.com/monami1960" target="_blank" class="btn-facebook" title="페이스북 새창 열림">페이스북</a>
				</p>
			</div>	
		</div>
	</div>
	<div class="cont">			
		<div class="inner">	
					
 			<span>
 				<img alt="" src="<%=cp%>/monnami/images/common/monamimall.png" class="logo">
 			</span>

			<nav>				
				<ul>
					<li><a href="http://www.monami.com/about/ceo.php" target="_blank" title="회사소개 새창 열림">회사소개</a></li>
					<li><a href="/w/etc/terms.do">이용약관</a></li>
					<li><a href="/w/etc/privacy.do"><strong>개인정보처리방침</strong></a></li>
					<li><a href="javascript:void(0);" onclick="owScrollYesCenter('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1208108227&amp;apv_perm_no=', '_ftcpopup', '900', '800')">사업자 정보확인</a></li>
					<li><a href="/w/etc/proposal.do">제휴/입점 안내</a></li>
				</ul>
			</nav> 
			<div class="familysite">
				<select>
					<option value="">패밀리 사이트</option>
					<option value="http://www.monami.com/">몬나미공식사이트</option>
					<option value="http://www.mon-arte.com">몬나르떼</option>
					<option value="http://www.monamistation.com">몬나미스테이션</option>
					<option value="http://monamiconcept.com/">몬나미컨셉스토어</option>
					<option value="http://www.monami.co.kr/art_contest/contest/introduction.asp">몬나미환경사랑미술대회</option>
				</select><div class="dropdown " tabindex="0"><span class="current">패밀리 사이트</span><div class="list"><ul><li class="option selected" data-value="" data-display-text="">패밀리 사이트</li><li class="option " data-value="http://www.monami.com/" data-display-text="">몬나미공식사이트</li><li class="option " data-value="http://www.mon-arte.com" data-display-text="">모나르떼</li><li class="option " data-value="http://www.monamistation.com" data-display-text="">모나미스테이션</li><li class="option " data-value="http://monamiconcept.com/" data-display-text="">몬나미컨셉스토어</li><li class="option " data-value="http://www.monami.co.kr/art_contest/contest/introduction.asp" data-display-text="">몬나미환경사랑미술대회</li></ul></div></div>
			</div>
			<div class="copyright">
				<address>
					(주)몬나미 | 대표 : 황병열 | 주소 : 서울 강남구 테헤란로 123 | 사업자등록번호 : 120-81-08227<br>
					고객센터 : 1544-2884 | 개인정보관리책임자 : 최설화(monamihelp@monami.com)  | 통신판매업신고 : 제2008-용인수지-0117
				</address>
				<p>
					본 사이트의 모든 저작물의 저작권은 (주)몬나미에 있습니다.<br>
					무단 복제나 도용은 저작권법 제 97조 5항에 의해 법으로 금지되어 있습니다.<br>
					<small>Copyright(c) (주)몬나미 All rights Reserved.</small>
				</p>

			</div>
			<div class="escrow">
				<strong>이니시스(에스크로) 서비스</strong>
				<p>고객님은 안전거래를 위해 모든 거래 결제 시 <br>저희 쇼핑몰에서 가입한 전자 결제의 <br>매매보호(에스크로) 서비스를 이용하실 수 <br>있습니다.</p>
				<!-- <a href="#" onclick="owScrollYesCenter('https://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=ws_monami', '_upluspopup', '460', '520')">서비스 가입사실 확인 ></a> -->
			</div>	
		</div>		
	</div>
	<div class="secure">
		<img alt="" src="/study/monnami/images/common/secureList.png">
	</div>

</body>
</html>