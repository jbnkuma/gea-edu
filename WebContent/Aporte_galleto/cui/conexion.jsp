<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Gea-horarios</title>
</head>
<body>
<% 
Connection conexion;
Statement   sentenciaSQL;
ResultSet   cdr; 
	try{
		String URL_bd="jdbc:mysql://localhost/test";
		String Usuario="root";
		String Contraseña="king.86";

		conexion = DriverManager.getConnection(URL_bd,Usuario,Contraseña);
		session.setAttribute("conexion",conexion);
	}
	
	catch(Exception e){
		out.println("<center>Error: Falla de Conexion.</center>");
	}



%>
</body>
</html>