<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>
<script>
function login() {
	if($("#id").val() == "") {
		alert("아이디를 입력해주세요!");
		$("#id").focus();
		return false;
	}
	if($("#password").val() == "") {
		alert("비밀번호를 입력해주세요!");
		$("#password").focus();
		return false;
	}
	$("#login").submit();
}
</script>
<h1>로그인</h1>
<p style="color:red">${error }</p>
<form name='loginForm' id="login" action="/login" method='POST'>
	<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />
	<table class="table">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" id="password"></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" value="로그인" onClick="javascript:login()">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
<%@ include file="../common/footer.jspf"%>