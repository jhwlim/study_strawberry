<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- sidebar/footer css -->
	<link rel="stylesheet" type="text/css" href="<c:url value = '/resources/css/reset.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value = '/resources/css/fragments/side_and_footer.css' /> ">
	<link rel="stylesheet" href="<c:url value = '/resources/css/notice/write.css?ver=1' />">
    <script src="<c:url value="/resources/js/notice/write.js?ver=1"/>"></script>
    <script src="<c:url value="/resources/js/ckeditor/ckeditor.js"/>"></script>
		
	<title>NOTICE - WRITE</title>
</head>
<body>
	<!-- side bar -->
	<c:import url="/WEB-INF/views/fragments/sidebar.jsp" />
		
	<div id="container">
        <div id="wrapper">
            <div id="wrapper-head">
                <h1>NOTICE</h1>
                <hr>
            </div>
            <div id="wrapper-body">
                <form id="write-form" action= "<c:url value='/notice/write' />" method="post">
                    <table>
                        <tr>
                            <td class="table-field">작성자</td>
                            <td class="table-input">
                                <input type="text" id="writer" name="#" value="${sessionScope.nick}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-field">제목</td>
                            <td class="table-input">
                                <input type="text" id="title" name="#">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div>
                                    <textarea name="contents" id="contents" cols="80" rows="40">
                                	</textarea>
                                    <script>
                                        CKEDITOR.replace('contents', {
                                            height: '500px'
                                        });
                                    </script>
                                </div>
                            </td>
                        </tr>
                        <tr id="btns">
                            <td colspan="2">
                                <span>
                                    <button id="cancel-btn" class="btn">취소</button>
                                    <button id="submit-btn" class="btn">등록</button>
                   				</span>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>
        </div>
    </div>
	
	<!-- Footer -->
	<c:import url="/WEB-INF/views/fragments/footer.jsp" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		
	$(document).ready(function() {
		
		$("#cancel-btn").click(function() {
			if (confirm("작성을 취소하시겠습니까?") == true) {
				redirect();
			} else {
				return false;	
			}
		});
		
		$("#submit-btn").click(function() {
			var chkTitle = isAllWhiteSpace($("#title").val());
			if (chkTitle) {
				console.log(chkTitle);
				alert("제목을 입력해주세요.")	
				return false;
			}
			
			var chkContent = isAllWhiteSpace(CKEDITOR.instances.contents.getData());
			if (chkContent) {
				alert("내용을 입력해주세요.")	
				return false;
			}
			
			if(confirm("글을 등록하시겠습니까?") == true) {
				$("#write-form").submit();
			} else {
				return false;	
			}
			
		});
	});
		
	</script>
		
</body>
</html>