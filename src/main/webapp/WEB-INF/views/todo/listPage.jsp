<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>

<h1>게시물 리스트</h1>
<form id="jobForm">
	<input type="hidden" name="page" value=${pageMaker.cri.page }>
	<input type="hidden" name="perPageNum"
		value=${pageMaker.cri.perPageNum }>
</form>

<table class="table">
	<tr>
		<th>일정</th>
		<th>목표 날짜</th>
		<th>생성 날짜</th>
		<th>완료 여부</th>
		<th>카테고리</th>
	</tr>
	<c:forEach items="${list }" var="todo">
		<tr>
			<td><a href='/todo/read?idx=${todo.idx}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}'>${todo.content }</a></td>
			<td>${todo.target_date }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${todo.create_date }" /></td>
			<td>		
			<c:choose>
       			<c:when test="${todo.done == true}">
           			완료
       			</c:when>
       			<c:otherwise>
           			미완료
       			</c:otherwise>
   			</c:choose>
			</td>
			<td>${todo.name }</td>
		</tr>
	</c:forEach>
</table>

<div class="text-center">
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
			<li><a href="${pageMaker.startPage-1 }">&laquo;</a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
			var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>><a
				href="${idx }">${idx }</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next }">
			<li><a href="${pageMaker.endPage+1 }">&raquo;</a></li>
		</c:if>
	</ul>
</div>

<%@ include file="../common/footer.jspf"%>

<script>
	var result = "${result}";
	if (result == "success") 
		alert("처리가 완료되었습니다.");
	$(".pagination li a").on("click", function(event) {
		event.preventDefault();
		var targetPage = $(this).attr("href");
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/todo/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>