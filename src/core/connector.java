/**
 * 
 */
package core;

import java.sql.*;

/**
 * @author kuma_yonko
 * 
 */
public class connector {

	/**
	 * 
	 */
	public static java.sql.Connection getSqlServerConnection(String Usuario,
			String Contraseña) {
		Usuario = "gea";
		Contraseña = "gea.edu";
		try {
			String URL_bd = "jdbc:mysql://localhost/Geaedu";
			Connection conexion = DriverManager.getConnection(URL_bd, Usuario,
					Contraseña);
			return conexion;
		}

		catch (Exception e) {
			System.out.println("Error = " + e);
			return null;
		}

	}

	public static Boolean id(String cuenta) throws SQLException {
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		Statement sentenciaSQL;
		ResultSet cdr;
		sentenciaSQL = conexion.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		cdr = sentenciaSQL
				.executeQuery("SELECT ncuenta FROM Tabla_Alumno where ncuenta='"
						+ cuenta + "';");
		while (cdr.next()) {
			String kuenta = cdr.getString("ncuenta");
			if (kuenta.equals(cuenta)) {
				conexion.close();
				return true;
			} else {
				conexion.close();
				return false;
			}
		}

		conexion.close();
		return false;
	}

	public static void formu1(String ncuenta, String nombre, String apaterno,
			String amaterno, String edad, String telefono, String correo,
			String Genero, String calle, String colonia, String municipio,
			String estado, String codigop) throws SQLException {
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		Statement sentenciaSQL;
		sentenciaSQL = conexion.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sentenciaSQL.executeUpdate("INSERT INTO Tabla_Alumno VALUES('"
				+ ncuenta + "', '" + nombre + "','" + apaterno + "','"
				+ amaterno + "','" + edad + "','" + telefono + "','" + correo
				+ "','" + Genero + "','" + calle + "','" + colonia + "','"
				+ municipio + "','" + estado + "','" + codigop + "');");
		conexion.close();
	}

	public static void formu2(String clave, String nombre, String curso,
			String semestre) throws SQLException {
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		Statement sentenciaSQL;
		sentenciaSQL = conexion.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sentenciaSQL.executeUpdate("INSERT INTO Tabla_Alumno VALUES('" + clave
				+ "', '" + nombre + "','" + curso + "','" + semestre + "');");
		conexion.close();
	}

	public static int idadmin(String clave, String usuario) {

		try {
			String kuenta = new String();
			String pass = new String();
			Connection conexion = connector.getSqlServerConnection("entrada",
					"entrada");
			Statement sentenciaSQL;
			ResultSet cdr;
			sentenciaSQL = conexion.createStatement();
			cdr = sentenciaSQL
					.executeQuery("SELECT nombre,password FROM Tabla_admin where password='"
							+ clave + "';");
			while (cdr.next()) {
				kuenta = cdr.getString("nombre");
				pass = cdr.getString("password");

			}
			if (kuenta.equals(usuario) && pass.equals(clave)) {
				conexion.close();
				return 1;
			} else {
				conexion.close();
				return 0;
			}
		} catch (Exception e) {
			return 0;
		}

	}

	public static void formu3(String clave, String nombre) throws SQLException {
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		Statement sentenciaSQL;
		sentenciaSQL = conexion.createStatement();
		sentenciaSQL
				.executeUpdate("INSERT INTO Tabla_admin (nombre,password) VALUES('"
						+ nombre + "', '" + clave + "');");
		conexion.close();
	}

	public static void formu4(String clave, String nombre, String curso,
			String docente, String semestre) throws SQLException {
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		Statement sentenciaSQL;
		sentenciaSQL = conexion.createStatement();
		sentenciaSQL.executeUpdate("INSERT INTO Tabla_Materia  VALUES('"
				+ clave + "','" + nombre + "', '" + curso + "','" + docente
				+ "','" + semestre + "');");
		conexion.close();
	}

	public static void formu5(String clave, String nombre, String tmpcupo,
			String c_materia, String semestre) throws SQLException {
		int cupo = Integer.parseInt(tmpcupo);
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		Statement sentenciaSQL;
		sentenciaSQL = conexion.createStatement();
		sentenciaSQL.executeUpdate("INSERT INTO Tabla_Grupo  VALUES('" + clave
				+ "','" + nombre + "', '" + cupo + "','" + c_materia + "','"
				+ semestre + "');");
		conexion.close();
	}

	public static void formu6(String dia, String hinicio, String hfinal,
			String tmpgrupo, String cmateria) throws SQLException {
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		int cgrupo = Integer.parseInt(tmpgrupo);
		Statement sentenciaSQL;
		sentenciaSQL = conexion.createStatement();
		sentenciaSQL
				.executeUpdate("INSERT INTO Tabla_Horario (Dia, Hora_inicio, Hora_fin, Tabla_Grupo_id_grupo, Tabla_Materia_id_materia)  VALUES('"
						+ dia
						+ "','"
						+ hinicio
						+ "', '"
						+ hfinal
						+ "','"
						+ cgrupo + "','" + cmateria + "');");
		conexion.close();
	}
}