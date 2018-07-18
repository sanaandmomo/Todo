<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%-- <jsp:include page ="/WEB-INF/views/commo99n/header.jsp" flush="false" /> --%>
<script>
function checkPersonnel(roomNo, roomPw, result) {
        alert(typeof roomNo + roomPw + result);

      $.ajax ({
         type:'get',
         url:'/checkPersonnel',
         data: {
            roomNo : roomNo
         },
         success:function(data) {
            alert(data);
            if (data >= 6) {
               alert("방 인원이 꽉 찼습니다");
               return false;
            } else {
               alert(!result + data );
               if (!result) {
                  check(roomNo, roomPw);
               } else {
                  submitForm(roomNo);
               }
           }
         }
      });
   }

   
/* function checkPersonnelForNormal(roomNo, roomPw, result) {
      var roomNo = {
            roomNo : roomNo
      }
      
      $.ajax ({
         type:'get',
         url:'/checkPersonnel',
         data: roomNo,
         success:function(data) {
            if (data > 3) {
               alert("방 인원이 꽉 찼습니다");
               return false;
            } else {
               if (!result) {
                  check(roomNo, roomPw);
               } else {
                  submitForm(roomNo);
               }
           }
      }
   });
} */
   
function check(roomNo, roomPw){
   alert(roomNo + "roomPw" + roomPw);
   
   var input = prompt('패스워드를 입력하세요 > ');
   if(input == roomPw){
      alert("일치함");
      
      submitForm(roomNo);
   }else{
      alert("패스워드가 일치하지 않습니다.");
      return false;
   }
}

function submitForm(roomNo){
   
   alert(roomNo);
   $("#subNo").val(roomNo);
   $("#formByNo").submit();
}

$(".pagination li a").on("click", function(event) {
	event.preventDefault();
	var targetPage = $(this).attr("href");
	var jobForm = $("#jobForm");
	jobForm.find("[name='page']").val(targetPage);
	jobForm.attr("action", "/room/chatList").attr("method", "get");
	jobForm.submit();
});
</script>
<style>
   #header li a{
      color:#3d3d3d;
   }
   
   #header li a:hover{
      color:#adadad;
   }
   
   .wrap{
      text-align: center;
      
      position: absolute;
      top: 120px;
   }
   
   .wrap h2{
      margin: 20px auto;
   }
   
   .table{   
      width: 80%;
      margin: 0 auto;
      text-align: center;
   }
   .table, tr, td, th{
      border: 1px solid #3d3d3d;
      border-collapse:collapse;
      
   }
   
   thead tr{
      height: 40px;
   }
   
   tbody tr{
      height: 34px;
   }
   
   button{
      width:50%;
      text-align: center;
      
      color:#fff;
      background-color: #3d3d3d;
      
      border: 0;
      height: 25px;
   }
   
   tfoot tr{
      height: 36px;
   }
   
   .wrap_table{
      width: 89%;
      overflow:hidden;
      position:absolute;
      top: 160px;
   }
</style>
</head>
<body>
<!-- 방 입장할 때 필요한 폼 -->
<form action="/room/enterRoom" method="post" id="formByNo"> 
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   <input type="hidden" id="subNo" name="roomNo" />
   	<input type="hidden" name="page" value=${pageMaker.cri.page }>
	<input type="hidden" name="perPageNum"
		value=${pageMaker.cri.perPageNum }>
</form>

<!-- 페이징할 때 필요한 폼 -->
<form action="/room/chatList" method="get" id="jobForm">
	<input type="hidden" name="page" value=${pageMaker.cri.page }>
	<input type="hidden" name="perPageNum"
		value=${pageMaker.cri.perPageNum }>
</form>


<div class="wrap_table">

<table class="table">
   <tr>
      <th>방 이름</th>
      <th>방장</th>
      <th>방 타입</th>
      <th>생성 시간</th>
      <th>입장</th>
   </tr>
   <c:forEach items="${roomList}" var="room">
      <tr>
         <td>${room.roomName}</td>
         <td>${room.owner}</td>
         <td>${room.roomType}</td>
         <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${room.reg_date}" /></td>
         
         <c:choose>
            <c:when test="${room.roomPw == ''}">
               <td><button type="button" onclick="return checkPersonnel(${room.roomNo}, ${room.roomNo}, true)">입장하기</button></td>
            </c:when>
            <c:otherwise>
               <td><button type="button" id="btn_enter" onclick="return checkPersonnel(${room.roomNo}, ${room.roomPw}, false)" >방 입장하기</button></td>
            </c:otherwise>
        </c:choose>
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


     <a href="/room/createRoom">방 만들기</a>

</div>

</body>
</html>