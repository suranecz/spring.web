<%@page import="kimyongtae.ums.user.service.UserServiceImpl"%>
<%@page import="kimyongtae.ums.user.service.UserService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result=false;
	
	String userName = request.getParameter("userName");
	if(userName!=null && !userName.equals("")){
		UserService userService = new UserServiceImpl();
		result = userService.join(userName);
	}
	
	if(result){
%>
	
	<c:redirect url="../main.jsp?msgId=11"/>
<%
}else{
%>
	<c:redirect url="../main.jsp?msgId=10"/>
<%
}
%>