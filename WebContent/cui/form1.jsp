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
		String ncuenta=request.getParameter("n_cuenta");
		String nombre=request.getParameter("nombre");
		String apaterno=request.getParameter("A_paterno");
		String amaterno=request.getParameter("A_materno");
		String edad=request.getParameter("edad");
		String telefono=request.getParameter("telefono");
		String mail1=request.getParameter("correo_1");
		String arroba="@";
		String mail2=request.getParameter("correo_2");
		String correo=mail1+arroba+mail2;
		String genero1=request.getParameter("femenino");
		String genero2=request.getParameter("masculino");
		String calle=request.getParameter("calle");
		String colonia=request.getParameter("colonia");
		String municipio=request.getParameter("municipio");
		String estado=request.getParameter("Estado");
		String codigop=request.getParameter("cp");
		String Genero="otro";
		
		connector.formu1(ncuenta, nombre , apaterno ,  amaterno ,  edad , telefono , correo ,  Genero ,  calle,  colonia , municipio , estado , codigop );
    }catch(Exception e){
			 out.println("error: "+e+"<br/>");
		
		}
    
%>
</body>
</html>