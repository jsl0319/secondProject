<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/customer/activity/group/study/index.js"></script>
<script src="/js/customer/activity/group/chat-client.js"></script>
<link href="/css/reset.css" type="text/css" rel="stylesheet" />
<link href="/css/customer/activity/group/index.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div class="container" style="width: 1500px; height: 900px; border: 1px solid black; display: flex;">
		<div class="box1" style="width: 500px; hegiht: 900px; border: 1px solid black;">
			<div class="info-div" style="display: flex; flex-direction: column; align-items: center;">
				<input hidden value="${sv.id}" /> 
				<Button class="info-Btn">Information</Button>
			</div>

			<div style="display: flex; flex-direction: column; align-items: center;">
				<div class="main-img">
					<c:if test="${sv.image != 'img1.jpg'}">
						<img src="/images/studyImg/${sv.id}/${sv.image}"></img>
					</c:if>
					<c:if test="${sv.image == 'img1.jpg'}">
						<img src="/images/studyImg/${sv.image}"></img>
					</c:if>
				</div>
				<button class="snip1535">팀원 정보</button>
				<div class="team-info">
					<div class="member-info">
						<div style="width: 250px; text-align: center;">팀장 : ${sv.leaderName} 
						<input type="button" class="btn-two mini purple" onclick="window.open('/customer/profile/${sv.leaderId}','win','width=900,height=500')" value="프로필 보기"/></div>
					</div>
					<c:forEach var="sav" items="${sav}">
						<div class="member-info">
							<div style="width: 250px; text-align: center;">팀원 : ${sav.memberNickname} 
							<input type="button" class="btn-two mini purple" onclick="window.open('/customer/profile/${sav.memberId}','win','width=900,height=500')" value="프로필 보기"/></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<input hidden class="pageStatus" value="${pageStatus}" />
			<c:if test="${sessionScope.id == sv.leaderId}">
				<div style="display: flex; flex-direction: column; align-items: center;">
					<div class="apply-btn-div">
						<input type="button" value="지원 관리" class="apply-Btn btn-two small yellow"/>
					</div>
					<form action="approve" method="post">
						<div>
						  <table class="apply-table">
						  	<tbody class="tbody">
						  		<c:forEach var="swv" items="${swv}">
							  		<tr class="tr">
								  		<td>
								  			<p class="apply-p">${swv.memberNickname}님이 지원하였습니다. 
								  				<span class="date-fmt"><fmt:formatDate value="${swv.regDate}" pattern="yyyy-MM-dd a hh:mm:ss" /></span>
								  			</p>
								  			<div>
									  			<li style="display:none;">${swv.comment}
									  			<input type="button" class="btn-two mini purple" onclick="window.open('/customer/profile/${swv.memberId}','win','width=900,height=500')" value="프로필 보기"/>
									  			</li>
								  			</div>
								  			<input hidden class="commentValue" value="0" />
								  		</td>
								  		<td>
								  			<input hidden name="studyId" value="${swv.studyId}" />
								  			<input hidden name="memberId" value="${swv.memberId}" />
								  			<input type="submit" name="action" class="btn-two mini cyan" value="승인"/>
								  		</td>
								  		<td>
								  			<input hidden name="studyId" value="${swv.studyId}" />
								  			<input hidden name="memberId" value="${swv.memberId}" />
								  			<input type="submit" name="action" class="btn-two mini red" value="거절"/>
								  		</td>
									</tr>
								</c:forEach>
						  	</tbody>
						  </table>
						</div>
					</form>
				</div>
			</c:if>

		</div>

		<input type="hidden" class="memberId" value="${id}">
		<div class="box2"
			style="width: 500px; hegiht: 900px; border: 1px solid black;">
			<div class="table"
				style="display: flex; flex-direction: column; align-items: center;">
				<div>
					<h1 style="display: inline-block; margin-left: 50px;">게시판</h1>
					<input class="board-reg" type="button" value="등록" style="margin-left: 30px;" />
				</div>
				<div class="bodrd">
					<table>
						<thead>
						<tr>
						
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
						</thead>
						<tbody class="boardTbody">
						</tbody>
					</table>

				</div>
				<input class="board-plus-btn" type="button" value="+" />
			</div>
		</div>

		<div class="box3"
			style="width: 500px; hegiht: 900px; border: 1px solid black;">
			<div
				style="display: flex; flex-direction: column; align-items: center;">
				<h1>일정 공유</h1>
				<div style="width: 300px; height: 300px; border: 1px solid black;"></div>
			</div>

			<div class="chat" style="display: flex; flex-direction: column; align-items: center; justify-content: space-around;width:300px;height:300px;border: 1px solid black">
				<h1>팀 채팅</h1>
				<input class="type" type="hidden" value="1" >
				<input class="nickname" type="hidden" value="${nickname}" >
		  		<input class="chat-id" type="hidden" value="${sv.id}" >
		   		<input class="chat-input" autofocus="autofocus" type = "text" id = "message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
				<button class = "send-btn" id = "send">전송</button>
				<!-- <input type="button" value="채팅" /> -->
			</div>
		</div>
	</div>
</body>
</html>