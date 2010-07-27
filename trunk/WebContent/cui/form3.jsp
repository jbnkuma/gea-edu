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
try{
		String clave=request.getParameter("clave");
		String nombre=request.getParameter("nombre");
		connector.formu3(clave,nombre);
		response.sendRedirect("./formularios/formulario3.html");
    }catch(Exception e){
			 out.println("error: "+e+"<br/>");
			 
		
		}
    
%>
</body>
</html>