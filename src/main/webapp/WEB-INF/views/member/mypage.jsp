<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="max1920px">
<jsp:include page="/WEB-INF/views/common/side-nav.jsp"/>
	<div class="main-section section-shadow card">
		<div class="right-container">
			<div>
				<h2>프로필</h2>
				<img src="" id="mypage-profile">
				<div>
					<input type="reset" value="취소">
					<button onclick="fn_updatePwd();">수정</button>
				</div>
				<p> 님</p>
				<div>
					<p>부서</p>
					<input type="text" value="" disabled>
					<p>직책</p>
					<input type="text" value="" disabled>
					<p>급여</p>
					<input type="text" value="" disabled>
					<p>입사일</p>
					<input type="date" value="" disabled>
				</div>
			</div>
			<div>
				<h2>개인 정보 수정</h2>
				<form action="" method="post">
					<div>
						<span>전화번호</span> <input type="text" name="phone">
						<p>* 전화번호 입력 시 하이픈(-) 제외하고 입력하세요.</p>
					</div>
					<div>
						<span>이메일</span> <input type="email" name="email">
						<button onclick="fn_requestEmail();">인증 요청</button>
					</div>
					<!-- 인증 요청 버튼을 누르면 보일 구간 -->
					<div>
						<span>인증 번호</span> <input type="text" name="email-check-number">
						<button onclick="fn_checkEmailNumber();">인증</button>
					</div>
					<!--  -->
					<div>
						<span>주소 검색</span> <input type="text" name="main-address">
						<button onclick="fn_searchAddr();">검색</button>
					</div>
					<div>
						<span>상세 주소</span> <input type="text" name="detail-address">
					</div>
					<div>
						<h4>수정 요청 현황</h4>
						<table>
							<tr>
								<th>신청자</th>
								<th>승인 담당자</th>
								<th>신청 사유</th>
								<th>신청 날짜</th>
								<th>처리 결과</th>
							</tr>
							<!-- 조건문 처리될 구간 -->
							<tr>
								<td>신청자</td>
								<td>승인 담당자</td>
								<td>신청 사유</td>
								<td>신청 날짜</td>
								<td>처리 결과</td>
							</tr>
						</table>
					</div>
					<div>
						<input type="reset" value="취소">
						<button onclick="">수정 요청</button>
					</div>
				</form>
				<p>* 개인정보 수정 요청 시, 인사팀에서 승인 후 변경 사항이 적용됩니다.</p>
				<div>
					<h2>비밀번호 수정</h2>
					<div>
						<span>현재 비밀번호</span>
						<input type="password" name="ori-password" id="ori-pwd">
					</div>
					<div>
						<span>새 비밀번호</span>
						<input type="password" name="new-password" id="new-pwd">
					</div>
					<div>
						<span>비밀번호 확인</span>
						<input type="password" id="pwd-check">
					</div>
				</div>
				<div>
					<input type="reset" value="취소">
					<button onclick="fn_updatePwd();">수정</button>
				</div>
			</div>
		</div><!-- right-container -->
	</div>
</section>
</body>
</html>