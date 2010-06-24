<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="cui/conexion.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="login.css" media="screen" />
<title>Bienvenido </title>
</head>
<body>
<div id="contenedor">

<div id="cabecera">
  <img src="./cui/imagenes/geacui.png" alt="logo CUI" name="baner1" height="80" width="650" /><center> <img src="./cui/imagenes/tux_work.png" alt="tux linux" name="tuxtrabajo" height="90" width="100" /> </center>
</div>
<form action="index.jsp" method="post">
<div id="login">
<center>
<h1>TECLEA TU NUMERO DE CUENTA</h1>
 </center>
  <center>
  <input name="cuenta" size="12" type="password" />
  </center> 
  <center>
	<input type="submit" value="Entrar" />
  </center>
</div>
</form>
</div>
<%
try{
	conexion=(Connection)session.getAttribute("conexion");
	sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		ResultSet.CONCUR_UPDATABLE);
		String ncuenta=request.getParameter("cuenta");
		out.println("<p>"+ncuenta+"</p>");
        cdr=sentenciaSQL.executeQuery("SELECT clave FROM exemplo");
        while(cdr.next()){
        	if(cdr.getString("clave").equals(ncuenta)==true){
        		response.sendRedirect("./cui/index.html");
        	}
        	else{
        		out.println("<p>"+"Error Numero de cuenta no encontrado"+"</p>");
        	}
        }
        conexion.close();
    }catch(Exception e){
			 out.println("error: "+e+"<br/>");
		
		}
%>
</body>
</html>
