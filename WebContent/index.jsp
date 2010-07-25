<?xml version="1.0" encoding="UTF-8" ?>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page session="true" %>
<%@page import="core.connector" %>   
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
  <img src="./cui/imagenes/geacui_ligin.png" alt="logo CUI" name="baner1" height="100" width="800" />
  <center> <img src="./cui/imagenes/tux_work.png" alt="tux linux" name="tuxtrabajo" height="90" width="100" /> </center>
</div>
<form action="index.jsp" method="post" >
<div id="login">
<center>
<h1>Ingresa Tu Numero De Cuenta</h1>
 </center>
  <center>
  <input id="pass" name="cuenta" size="12" type="password" />
  </center> 
  <center>
	<input type="submit" value="Entrar" />
  </center>
</div>
</form>
</div>
<%

		String ncuenta=request.getParameter("cuenta");
        
        	if(connector.id(ncuenta)){
        		HttpSession sok=request.getSession();
        		sok.setAttribute("cuenta",ncuenta);
        		response.sendRedirect("./cui/index.html");
        	}
        	
        
%>
<div id="pie">
<center> gpdsol-gpdsol.blogspot.com </center>
<center><font size="2" color="black">CC2010 Copyleft GPDSOL: Gea-Edu by Becerril Jesus "Oso" and Romero Yoal "Galleto".</font></center>
</div>
</body>
</html>
