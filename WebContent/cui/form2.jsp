<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="conexion.jsp"%>
<%@page import="java.util.regex.*"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<% 
try{
	conexion=(Connection)session.getAttribute("conexion");
	sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		ResultSet.CONCUR_UPDATABLE);
		String clave=request.getParameter("clave");
		String nombre=request.getParameter("nombre");
		String curso=request.getParameter("curso");
		String semestre=request.getParameter("semestre");

	    sentenciaSQL.executeUpdate("INSERT INTO Tabla_Alumno VALUES('"+clave+"', '"+nombre+"','"+curso+"','"+semestre+"');");
        out.println("Se a registrado el curso");
        conexion.close();
    }catch(Exception e){
			 out.println("error: "+e+"<br/>");
			 
		
		}
    
%>
</body>
</html>