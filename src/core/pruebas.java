/**
 * 
 */
package core;

import java.sql.*;
/**
 * @author kuma_yonko
 * 
 */
public class pruebas {
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

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args){
		// TODO Auto-generated method stub
		//String usuario="ad";
		String clave="09862";
		//String kuenta=new String();
		//String pass=new String();
		try{ 
			
		
		Connection conexion = connector.getSqlServerConnection("entrada",
				"entrada");
		Statement sentenciaSQL;
		ResultSet cdr;
		sentenciaSQL = conexion.createStatement();
		cdr = sentenciaSQL
		.executeQuery("select* FROM Tabla_Alumno where ncuenta='"
				+ clave + "';");
while (cdr.next()) {
	if (clave.equals(cdr.getString("ncuenta"))) {
		sentenciaSQL
				.executeUpdate("delete FROM Tabla_Alumno where ncuenta='"
						+ clave + "';");
		conexion.close();
		System.out.print("Se ha borrado");
	} else {
		conexion.close();
		System.out.print("no se borro");
	}
}
		}
		catch(Exception e){
			System.out.print(e);
			
			
		}

	}

}
