<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/notice/notice-addetail.css?v=1.0" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/modal/notice-modal.css?v=1.0" />
</head>
<%@ include file="../../header.jsp"%>
<body>

   <!-- 페이지의 메인 부분 -->
   <div class="notice-addetail-all">
      <div class="notice-addetail-top">
         <div class="notice-addetail-txt">공지사항</div>
      </div>
      <div class="notice-addetail-main">
         <div class="notice-addetail-content">
            <div class="notice-addetail-tcontent">제목</div>
            <div class="notice-addetail-ttxt">${noticeshowdetail[0].noticeTitle}</div>
         </div>
         <div class="notice-addetail-content">
            <div class="notice-addetail-tcontent">작성자</div>
            <div class="notice-addetail-ttxt">${noticeshowdetail[0].memberNickname}</div>
         </div>
         <div class="notice-addetail-content">
            <div class="notice-addetail-tcontent">작성일</div>
            <div class="notice-addetail-ttxt">${noticeshowdetail[0].noticeRegistDate}</div>
         </div>
			<div class="notice-addetail-maincont">
			    <div>
			        <p style="font-family: Noto Sans, malgun gothic, AppleGothic, dotum, sans-serif; white-space: pre-wrap; word-wrap: break-word;">
			            ${noticeshowdetail[0].noticeContent}
			        </p>
			    </div>
			</div>

         
         <div class="notice-addetail-btuall">
            <%
            // memberNumber 값을 가져오는 로직이 필요합니다.
            // 예를 들어 세션에서 값을 가져올 수 있습니다.
            Integer memberNumber = (Integer) session.getAttribute("memberNumber");
            %>
            <!-- memberNumber가 1일 때만 보이는 버튼 -->
            <c:if test="${sessionScope.member.memberNumber  == 1}">
               <button class="notice-addetail-modi" type="button">
                  <a href="${pageContext.request.contextPath}/notice/modify.no?noticeNumber=${noticeshowdetail[0].noticeNumber}">수정</a>
               </button>
               <button class="notice-addetail-del" type="button"
                  onclick="openDeleteModal(${noticeshowdetail[0].noticeNumber})">
                  삭제</button>
            </c:if>
            <button class="notice-addetail-btu" type="button">
               <a
                  href="${pageContext.request.contextPath}/notice/notice-admain.no">
                  <span class="notice-addetail-btu-sp">목록</span>
               </a>
            </button>
         </div>

         <!-- 삭제 모달 HTML -->
         <div id="notice-deleteModal" class="notice-modal">
            <div class="notice-modal-content">
               <span class="notice-close" onclick="closeDeleteModal()">&times;</span>
               <h2>정말로 삭제하시겠습니까?</h2>
               <p>삭제 버튼을 클릭하면 항목이 영구히 삭제됩니다.</p>
               `
               <button class="confirm-btn" onclick="confirmDelete()">삭제</button>
               <button class="notice-cancel-btn" onclick="closeDeleteModal()">취소</button>
            </div>
         </div>

         <form id="deleteForm"
            action="${pageContext.request.contextPath}/notice/delete.no"
            method="post" style="display: none;">
            <input type="hidden" id="noticeNumberInput" name="noticeNumber"
               value="">
         </form>

      </div>
   </div>
</body>
<%@ include file="../../footer.jsp"%>
<script src="../../assets/js/modal/notice-modal.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>

</script>
</html>