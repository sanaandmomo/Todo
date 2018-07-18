<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>
<h1>일정 수정</h1>
<form role="form" method="post">
	<input type="hidden" name='page' value='${cri.page }'> 
	<input type="hidden" name='perPageNum' value='${cri.perPageNum }'>
	<input type="hidden" name='idx' value='${todo.idx }'>
	<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />
<div class="box-body">
	<div class="form-group">
		<label>일정</label>
		<input type="text" name="content" value="${todo.content }" class="form-control">
	</div>
	<div class="form-group">
		<label>목표 날짜</label>
		<input type="date" name="target_date" value="${todo.target_date }" class="form-control">
		<form:errors path="todo.target_date" color="red"/>
	</div>
	<div class="form-group">
		<label>완료 여부</label>
		<input type="radio" name="done" value="true" id="rad1"><label for="rad1">완료</label>&nbsp;
		<input type="radio" name="done" value="false" id="rad2"><label for="rad2">미완료</label>
	</div>
	<div class="form-group">
		<label>카테고리</label>
		<select name="category" id="category">
			<c:forEach var="c" items="${cate }">
				<option value="${c.cat_id }">${ c.name}</option>
			</c:forEach>
		</select>
	</div>
</div>
</form>
<div class="box-footer">
	<button type='submit' class="btn btn-primary">Save</button>
	<button type='submit' class="btn btn-warning">Cancel</button>
</div>

<%@ include file="../common/footer.jspf"%>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		$(".btn-primary").on("click", function() {
			formObj.attr("action", "/todo/modify");
			formObj.submit();
		})
		$(".btn-warning").on("click",function() {
			self.location = "/todo/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
		})
		$("#category").val("${todo.category}").prop("selected", true);
		$('input:radio[name="done"][value="${todo.done}"]').prop('checked', true);
	})
	function check() {
		if($("#content").val() == "") {
			alert("일정을 등록해주세요!");
			$("#content").focus();
			return false;
		} 
		if ($("#date").val() == "") {
			alert("목표 날짜를 설정해주세요!");
			$("#date").focus();
			return false;
		}
	}
</script>

