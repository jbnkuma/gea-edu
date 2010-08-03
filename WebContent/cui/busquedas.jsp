<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="core.connector"%>
<%@page import="java.sql.Connection" import="java.sql.ResultSet"
	import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="formularios/formu.css" type="text/css"
	media="screen" />
<title>Insert title here</title>
</head>
<body>
<%
	try {
		String ncuenta = request.getParameter("clave");
		Connection conexion = connector.getSqlServerConnection(
				"entrada", "entrada");
		Statement sentenciaSQL;
		ResultSet cdr;
		sentenciaSQL = conexion.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		cdr = sentenciaSQL
				.executeQuery("SELECT * FROM Tabla_Alumno where ncuenta='"
						+ ncuenta + "';");

		while (cdr.next()) {
			if (ncuenta.equals(cdr.getString("ncuenta"))) {
				out.println("<div id=\"dalumnos\">");
				out.println("<table class=\"datos\" >");
				out
						.println("<caption><strong>Datos del Alumno</strong></caption>");
				out.println("<tr>");
				out
						.println("<th scope= \"col\"><strong>Numero de Cuenta</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Nombre</strong></td>");
				out
						.println("<th scope= \"col\"><strong>Apellido Paterno</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Apellido Materno</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Edad</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Telefono</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Email</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Genero</strong></th>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<tr>");
				out
						.println("<td>" + cdr.getString("ncuenta")
								+ "</td>");
				out.println("<td>" + cdr.getString("nombre") + "</td>");
				out.println("<td>" + cdr.getString("a_paterno")
						+ "</td>");
				out.println("<td>" + cdr.getString("a_materno")
						+ "</td>");
				out.println("<td>" + cdr.getString("edad") + "</td>");
				out.println("<td>" + cdr.getString("Telefono")
						+ "</td>");
				out.println("<td>" + cdr.getString("email") + "</td>");
				out.println("<td>" + cdr.getString("genero") + "</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</div>");

				out.println("<div id=\"alumnosa\">");
				out.println("<table class=\"adress\" >");
				out
						.println("<caption><strong>Domicilo del  Alumno</strong></caption>");
				out.println("<tr>");
				out
						.println("<th scope= \"col\"><strong>Calle</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Colonia</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Municipio</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Estado</strong></th>");
				out
						.println("<th scope= \"col\"><strong>Codigo Postal</strong></th>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<tr>");
				out.println("<td>" + cdr.getString("calle") + "</td>");
				out
						.println("<td>" + cdr.getString("colonia")
								+ "</td>");
				out.println("<td>" + cdr.getString("municipio")
						+ "</td>");
				out.println("<td>" + cdr.getString("estado") + "</td>");
				out
						.println("<td>" + cdr.getString("codigop")
								+ "</td>");
				out.println("</tr>");
				out.println("</tr>");
				out.println("</table>");

				out.println("</div>");

			} else {
				out
						.println("Los datos del Alumno solicitado no existen");
			}
		}
		conexion.close();
	} catch (Exception e) {
		out.println("Error al procesar los datos" + e);
	}
%>
</body>
</html>