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

	String clave=request.getParameter("clave");
	String nombre=request.getParameter("nombre");
	String curso=request.getParameter("curso");
	String docente=request.getParameter("docente");
	String semestre=request.getParameter("semestre");

	connector.formu4(clave,nombre,curso,docente,semestre);
	response.sendRedirect("./formularios/formulario2.html");
%>
</body>
</html>