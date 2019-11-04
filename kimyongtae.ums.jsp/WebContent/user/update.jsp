<%@page import="kimyongtae.ums.user.service.UserServiceImpl"%>
<%@page import="kimyongtae.ums.user.service.UserService"%>
<%@page import="kimyongtae.ums.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    boolean result= false;
    
    String userNo = request.getParameter("userNo");
    String userName = request.getParameter("userName");
    if((userNo!= null && !userNo.equals("userName"))&&
    		(userName!=null && !userName.equals(""))){
    	User user = new User(Integer.parseInt(userNo),userName,null);
    	UserService userService = new UserServiceImpl();
    	result= userService.correctUser(user);
    }
    if(result){
%>
        <c:redirect url="../main.jsp?msgId=21"/>    
<%
    }else{
%>
        <c:redirect url="../main.jsp?msgId=20"/>
<%
    }
%>

