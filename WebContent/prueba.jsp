<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:sql="http://java.sun.com/jsf/sql">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<f:view>
<sql:setDataSource var="bd"
					driver="com.msql.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/Geaedu"
					user="gea"
					clave="gea.edu"
/>

<sql:query var="cdr" datasource"${bd}">
SELECT num_cuenta FROM Tabla_Alumno
</sql:query>

<f:forEach var="fila" items="${cdr.rows}">
 ${fila.num_cuenta }
</f:forEach>
</f:view>
</body>
</html>