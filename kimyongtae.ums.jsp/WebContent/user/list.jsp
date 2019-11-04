<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kimyongtae.ums.user.service.UserService" %>
<%@ page import="kimyongtae.ums.user.service.UserServiceImpl" %>
<%@ page import="kimyongtae.ums.user.domain.User" %>
<%@ page import="java.util.List" %>
<%
	
    UserService userService = new UserServiceImpl();
    List<User> users = userService.listUsers();
    pageContext.setAttribute("users", users);    
%>
<%
    if(users.size()>0){
%>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><input type="radio" name="userNo" value="${user.userNo}" />
                    &nbsp;${user.userNo}
                </td>
                <td>${user.userName}</td>
                <td>${user.regDate}</td>
            </tr>
        </c:forEach>        
<%
    }else{
%>
        <tr><td colspan='3'>사용자가 없습니다.</td></tr>
<%
    }
%>
