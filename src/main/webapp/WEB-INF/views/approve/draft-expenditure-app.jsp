<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="approveNo" value="${approveNo}"/>
<c:set var="approveState" value="${approveState}"/>
<c:set var="approveKind" value="${approveKind}"/>
<c:set var="oriFileName" value="${oriFileName}"/>
<c:set var="saveFileName" value="${saveFileName}"/>
<c:set var="name" value="${name}"/>
<c:set var="message" value="${message}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<link rel="stylesheet"
	href="${path}/resources/css/approve/drafting_app.css">
<section class="max1920px">
	<jsp:include page="/WEB-INF/views/common/side-nav.jsp" />

	<form action="#" id="appForm" method="post"
		enctype="multipart/form-data">

			<c:choose>
				<c:when test="${approveState eq '반려'}">
					<div class="approve-section4 section-shadow">
				</c:when>
	
				<c:otherwise>
					<div class="approve-section2 section-shadow">
				</c:otherwise>
			</c:choose>
				<c:if test="${name eq '기안문서함'}">
					<div id="approve_name">기안문서</div>
				</c:if>
				<c:if test="${name eq '참조문서함'}">
					<div id="approve_name">참조문서</div>
				</c:if>

			<div class="draft-section-margin">
				<div id="one-width">
					<div id="kind">지출결의서</div>
					<div id="app-line" class="answer">
						<c:if test="${approveState eq '완료'}">
							<p id="cStyle">${approveState}</p>
						</c:if>
						<c:if test="${approveState eq '반려'}">
							<p id="rStyle">${approveState}</p>
						</c:if>
						<c:if test="${approveState eq '결재처리중'}">
							<p id="pStyle">${approveState}</p>
						</c:if>
						<c:if test="${approveState eq '결재대기'}">
							<p id="wStyle">${approveState}</p>
						</c:if>
					</div>
					
				</div>
				
			<div id="one-width">
					<c:if test="${name eq '기안문서함'}">
						<div id="department" class="question">부서</div>
						<div id="department-answer" class="answer">${loginMember.dept.deptName}</div>
						<div id="writer" class="question">기안자</div>
						<div id="writer-answer" class="answer">${loginMember.memberName}</div>
						<div id="position" class="question">직책</div>
						<div id="position-answer" class="answer">${loginMember.job.jobName}</div>
					</c:if>
					<c:if test="${name eq '참조문서함'}">
						<div id="department" class="question">부서</div>
						<div id="department-answer" class="answer">${saveExtends[0].memberId.dept.deptName}</div>
						<div id="writer" class="question">기안자</div>
						<div id="writer-answer" class="answer">${saveExtends[0].memberId.memberName}</div>
						<div id="position" class="question">직책</div>
						<div id="position-answer" class="answer">${saveExtends[0].memberId.job.jobName}</div>
					</c:if>
			</div>

				<div id="one-width">
					<div id="extendWorkWriteDate" class="question">작성일</div>
					<div id="extendWorkWriteDate-answer" class="answer">${time}</div>
				</div>
				
				<div id="one-width">
					<div id="expenditureTimeTitle" class="question">제목</div>
					<div id="expenditureTitle-answer" class="answer">
							<input type="text" id="title-input" name="title" value="${saveExtends[0].approveTitle}">
					</div>
				</div>


				<input type="hidden" name="memberId" value="${loginMember.memberId}">
				<input type="hidden" name="approveKind" value="지출결의서">

				<div id="one-width">
					<div id="account" class="question">거래처</div>
					<div id="use-history" class="question">사용내역 및 용도</div>
					<div id="price" class="question">금액</div>
				</div>
				<div id="one-width">
					<input type="text" id="account0" name="account" class="answer" readonly>
					<input type="text" id="use-history0" name="useHistory" class="answer" readonly> 
					<input type="text" id="price0" name="price" class="answer" readonly>
				</div>
				<div id="one-width">
					<input type="text" id="account1" name="account" class="answer" readonly>
					<input type="text" id="use-history1" name="useHistory" class="answer" readonly> 
					<input type="text" id="price1" name="price" class="answer" readonly>
				</div>
				<div id="one-width">
					<input type="text" id="account2" name="account" class="answer" readonly>
					<input type="text" id="use-history2" name="useHistory" class="answer" readonly> 
					<input type="text" id="price2" name="price" class="answer" readonly>
				</div>
				<div id="one-width">
					<input type="text" id="account3" name="account" class="answer" readonly>
					<input type="text" id="use-history3" name="useHistory" class="answer" readonly> 
					<input type="text" id="price3" name="price" class="answer" readonly>
				</div>
				<div id="one-width">
					<input type="text" id="account4" name="account" class="answer" readonly>
					<input type="text" id="use-history4" name="useHistory" class="answer" readonly> 
					<input type="text" id="price4" name="price" class="answer" readonly>
				</div>
				<div id="one-width">
					<input type="text" id="account5" name="account" class="answer" readonly>
					<input type="text" id="use-history5" name="useHistory" class="answer" readonly> 
					<input type="text" id="price5" name="price" class="answer" readonly>
				</div>

				<div id="one-width">
					<div id="appAttachment" class="question">첨부파일</div>
					<div id="appAttachment-answer" class="answer">
					<input type="file" id="appAttachment-input" name="upFile" style="display:none;">
					<button type="button" id="fileClickId" onclick="fn_fileDownload('${oriFileName}','${saveFileName}')">파일을 선택하세요</button>
					</div>
				</div>

				<div id="one-width" class="btn-text-right">
					<c:if test="${name eq '기안문서함'}">
						<c:choose>
							<c:when test="${approveState eq '완료'}">
										<button type="button" onclick="backs();" id="draftBack">돌아가기</button>
							</c:when>
							<c:when test="${approveState eq '반려'}">
										<button type="button" onclick="backs();" id="draftBack">돌아가기</button>
										<button type="button" onclick="reWrite();" id="reWriteId">재작성</button>
							</c:when>
							<c:when test="${approveState eq '결재처리중'}">
										<button type="button" onclick="backs();" id="draftBack">돌아가기</button>
							</c:when>
							<c:when test="${approveState eq '결재대기'}">
										<button type="button" onclick="backs();" id="draftBack">돌아가기</button>
										<button type="button" onclick="changeStateSave();" id="changeSave">철회</button>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>
		</div>
		
		<c:if test="${approveState eq '반려'}">
			<div id="rejectDiv">
				<div class="draft-flex-row">
					<div id="rejectMessage">
							반려사유
					</div>
					<li class="postit">
							<span class="bold">
								${message}	
							</span>	
					</li>
				</div>	
			</div>
		</c:if>
<jsp:include page="/WEB-INF/views/approve/reject-view.jsp"/>

	</form>
	</html>

<script>
	function fn_fileDownload(oriName,reName){
		if(oriName==""){
			return false;
		}else{
			location.assign("${path}/approve/filedownload?oriname="+oriName+"&rename="+reName);			
		}
	};
	
	$(function() {	
		const approveLines=JSON.parse('${approveLines}'); // 자바스크립트에서 해당 JSON.parse 구문을통해 해당 값을 객체로 반환
		const referLines=JSON.parse('${referLines}'); 
		const expenditures=JSON.parse('${expenditures}'); 
	
		console.log(expenditures);
		
		for(let i=0; i<expenditures.length; i++){
			$("#account"+i).val(expenditures[i].account);
			$("#use-history"+i).val(expenditures[i].useHistory);
			$("#price"+i).val(expenditures[i].price);
		}

		if("${oriFileName}"==""){
			$("#fileClickId").text("파일을 선택하세요"); 
		}else{
			$("#fileClickId").text("${oriFileName}"); 
		}
		
		for(let i=0; i<approveLines.length; i++){
			const di = $("<div>").css("border", "1px solid black").height("98px").width("120px");
			$("#app-line").append(di);
			di.append($("<div>").css("border-bottom", "1px solid black").height("30px").width("120px").text(approveLines[i].memberId.memberName + " " + approveLines[i].memberId.job.jobName).css("text-align","center"));
			const stateCheck = $("<div>").height("40px").width("120px");
			di.append(stateCheck);
			if(approveLines[i].approveStatus == "완료"){
				stateCheck.html("<img src='${path}/resources/images/approve/stamp.png' width='40px' height='40px'/>").css("text-align","center");
			}
			di.append($("<div>").css("border-top", "1px solid black").height("28px").width("120px").text(i+1).css("align-items","center"));
		}
		
	});
	
	
	const changeStateSave=()=>{
		location.assign("${path}/approve/changeStateSave.do?approveNo=${approveNo}&mId=${loginMember.memberId}"); 
	}
	
	const reWrite=()=>{
		location.assign("${path}/approve/detailSave.do?approveNo=${approveNo}&mId=${loginMember.memberId}&approveKind=지출결의서");
	}
	
	const backs=()=>{
		history.back(); // 전페이지로 이동
	}

	

	
</script>