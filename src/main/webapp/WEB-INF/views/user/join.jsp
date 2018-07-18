<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
function isOverLap(){
	var joinId = $("#id").val();
	if (joinId == "") {
		alert("아이디를 입력해주세요!");
		 $("#id").focus();
		 return false;
	}
	$.ajax({
		method : "POST",
		url : "/isOverLap",
		dataType : "JSON",
		data : {"id" : joinId},
		success : function(result) {
			if(result) {
				alert("중복된 아이디입니다");
				$("#id").val('');
				$("#id").focus();
				return false;
			} else {
				alert("사용 가능한 아이디입니다");
				$("#isCheckd").val("1");
				$("#checkId").val(joinId);
				return true;
			}
		},
		error : function(){alert('error');}
	})
}
function join() {
	var check = $("#isCheckd").val();
	var checkId = $("#checkId").val();
	var currentId = $("#id").val();
	if(currentId == "") {
		alert("아이디를 입력해주세요!");
		$("#id").focus();
		return false;
	}
	var pass = $("#password").val();
	if(pass == "") {
		alert("비밀번호를 입력해주세요!");
		$("#password").focus();
		return false;
	}
	var name = $("#name").val();
	if(name == "") {
		alert("성함을 입력해주세요!");
		$("#name").focus();
		return false;
	}
 	if (check == 0 || checkId != currentId) {
		alert("중복 검사를 해주세요!");
		return false;
	} 
 	$("#join").submit();
 	
}
</script>

<h1>회원 가입</h1>
<form id="join" method="post" >
	<input type="hidden" id="isCheckd" value="0">
	<input type="hidden" id="checkId" value="">
	<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />
	<table class="table">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id"> <input type="button" onClick="javascript:isOverLap()" value="중복 검사"/></td>
			<td><form:errors path="user.id" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" id="password"></td>
			<td><form:errors path="user.password" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name"></td>
			<td><form:errors path="user.name" /></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" value="가입" onClick="javascript:join()">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
<%@ include file="../common/footer.jspf"%>
