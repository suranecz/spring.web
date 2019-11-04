<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>UMS</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css' />
<script    src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js'></script>
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<style>
header {
    border: solid black 1px;
    text-align: center;
}
form, table {
    margin-top: 20px;
}
table, th {
    text-align: center;
}
.sweet-size{
    width:320px;
    height:200px;
}
</style>
<script>
//쓰기 작업 결과 츨력창을 띄운다.
var alert = function(msg, type){
    swal({
        title:'',
        text:msg,
        type:type,
        timer:1000,
        customClass:'sweet-size',
        showConfirmButton:false
    });
}
 
//사용자명을 입력했는지 조사한다.
var isUserName = function(){
    var result = false;
    if($('#userName').val()) result = true;
    return result;
}
 
//사용자번호를 입력했는지 조사한다.
var isUserNo = function(){
    var result = false;
    if($('#userList :radio:checked').length) result = true;
    return result;
}
 
//GNB에 handler를 등록한다.
var init = function(){
    //사용자 추가
    $('#join').bind('click', function(){        
        if(isUserName()){
            userForm.action = 'user/join.jsp';            
            userForm.submit();
        }else{
            alert('사용자명을 입력하세요.','warning');
        }
    });    
 
    //사용자 수정
    $('#update').bind('click', function(){
        if(isUserNo() && isUserName()){
            userForm.action = 'user/update.jsp';            
            userForm.submit();
        }else{
            alert('사용자번호 선택하고 이름 입력하세요.','warning');
        }
    });
    
    //사용자 삭제
    $('#secede').bind('click', function(){
        if(isUserNo()){
            userForm.action = "user/secede.jsp";            
            userForm.submit();
        }else{
            alert("사용자 번호를 선택하세요.","warning");
        }
    });
}
 
$(init);
</script>
</head>
<body>
    <div class="container">
        <header>
            <h3>U M S</h3>
        </header>
 
        <form name="userForm">
            <div class="form-group">
                <input id='userName' name="userName" type="text" 
                    class='form-control' placeholder="사용자명" maxlength="3">
            </div>
 
            <div class="btn-group btn-group-justified">
                <a href="main.jsp?msgId=01" class="btn btn-default">
                    <span class='glyphicon glyphicon-list'></span> 목록
                </a>
                <a class="btn btn-default" id="join">
                    <span class='glyphicon glyphicon-plus'></span> 가입
                </a>
                <a class="btn btn-default" id="update">
                    <span class='glyphicon glyphicon-asterisk'></span> 수정
                </a>
                <a class="btn btn-default" id="secede">
                    <span class='glyphicon glyphicon-remove'></span> 탈퇴
                </a>
            </div>        
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody id="userList">
                    <c:choose>
                        <c:when test='${param.msgId=="01"}'>
                            <jsp:include page="user/list.jsp" />
                        </c:when>
                        <c:otherwise>
                            <tr><td colspan='3'>목록 버튼을 누르세요.</td></tr>
                        </c:otherwise>
                    </c:choose>        
                </tbody>
            </table>
        </form>    
    </div>
</body>
</html>
 
<%@ include file="user/msg.jsp" %>
