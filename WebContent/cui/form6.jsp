<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="core.connector" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<%

String dia=request.getParameter("dia");
String horai=request.getParameter("time2");
String hfin=request.getParameter("time3");
String cgrupo=request.getParameter("clvgrupo");
String cmateria=request.getParameter("clvmateria");
connector.formu6(dia, horai, hfin, cgrupo, cmateria);
response.sendRedirect("./formularios/formulario4.html");
%>
</body>
</html>