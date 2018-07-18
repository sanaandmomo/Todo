<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>
<h1>일정 조회</h1>

<form role="form" method="post">
	<input type="hidden" name='idx' value='${todo.idx }'>
	<input type="hidden" name='page' value='${cri.page }'>
	<input type="hidden" name='perPageNum' value='${cri.perPageNum }'>
	<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />
</form>

<div class="box-body">
	<div class="form-group">
		<label>일정</label>
		<input type="text" name="content" value="${todo.content }" readonly="readonly"
			class="form-control">
	</div>
	<div class="form-group">
		<label>목표 날짜</label>
		<input type="text" name="target_date" value="${todo.target_date }" readonly="readonly"
			class="form-control">
	</div>
	<div class="form-group">
		<label>생성 날짜</label>
		<textarea name="content" rows='1' readonly="readonly"
			class="form-control"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${todo.create_date }" /></textarea>
	</div>
	<div class="form-group">
		<label>완료 여부</label>
		<input type="text" name="done" id="done" value="${todo.done }" readonly="readonly"
			class="form-control">
	</div>
	<div class="form-group">
		<label>카테고리</label>
		<input type="text" name="writer" value="${todo.name }" readonly="readonly"
			class="form-control">
	</div>
</div>

<div class="box-footer">
	<button type='submit' class="btn btn-warning">Modify</button>
	<button type='submit' class="btn btn-danger">Remove</button>
	<button type='submit' class="btn btn-primary">List</button>
</div>

<%@ include file="../common/footer.jspf"%>

<script>
	$(document).ready(function() {
		var done = $('#done').val();
		if(done == true) {
			$('#done').val('완료');
		}else {
			$('#done').val('미완료');
		}
		
		var formObj = $("form[role='form']");
		$(".btn-warning").on('click', function() {
			formObj.attr("action", "/todo/modify");
			formObj.attr("method","get");
			formObj.submit();
		});
		$(".btn-danger").on('click', function() {
			formObj.attr("action", "/todo/remove");
			formObj.submit();
		});
		$(".btn-primary").on('click', function() {
			self.location = "/todo/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});
	})
</script>
