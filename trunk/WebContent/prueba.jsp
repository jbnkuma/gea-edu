<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

<sql:setDataSource var="bd"
					driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/Geaedu"
					user="gea"
					password="gea.edu"
/>

<sql:query var="cdr" dataSource="${bd}">
SELECT ncuenta FROM Tabla_Alumno
</sql:query>

<f:forEach var="fila" items="${cdr.rows}">
 ${fila.ncuenta}
</f:forEach>

</body>
</html>