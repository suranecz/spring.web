<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="kimyongtae.ums.user.service.UserService" %>
<%@ page import="kimyongtae.ums.user.service.UserServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    boolean result = false;
 
    String userNo = request.getParameter("userNo");
    if(userNo != null && !userNo.equals("")){
        UserService userService = new UserServiceImpl();
        result = userService.secede(Integer.parseInt(userNo));
    }
    
    if(result){
%>
        <c:redirect url="../main.jsp?msgId=31"/>    
<%
    }else{
%>
        <c:redirect url="../main.jsp?msgId=30"/>
<%
    }
%>
