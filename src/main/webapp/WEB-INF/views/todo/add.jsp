<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>
	
<h1>일정 추가</h1>
<div class="container">
<form method="post" onsubmit="return check()">
	<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />
	<div class="box-body">
		<div class="form-group">
			<label>일정</label> 
			<textarea class="form-control" name="content" id="content" rows='3' placeholder="일정을 등록하세요">${todo.content }</textarea>
			<form:errors path="todo.content" color="red"/>
		</div>
		<div class="form-group">
			<label >목표 날짜</label>
			<input type="text" name="target_date" id="date" value='${todo.target_date }' class="form-control" placeholder="목표 날짜를 설정하세요"/>
			<form:errors path="todo.target_date" color="red"/>
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
	<div class="box-footer">
		<button type='submit' class="btn btn-primary">추가</button>
		<button type='reset' class="btn btn-primary">리셋</button>
	</div>
</form>
</div>
<script>
function check() {
	if ($("#date").val() == "") {
		alert("목표 날짜를 설정해주세요!");
		$("#date").focus();
		return false;
	}
	if($("#content").val() == "") {
		alert("일정을 등록해주세요!");
		$("#content").focus();
		return false;
	}  
}
$("#category").val("${todo.category}").prop("selected", true);
</script>
<%@ include file="../common/footer.jspf"%>