/**
 * 
 */
package core;

import java.sql.Connection;
import java.sql.Statement;

import core.connector;

/**
 * @author kuma_yonko
 * 
 */
public class Borrado {

	/**
	 * 
	 */

	public static int borrar_Alumno(String clave) {
		try {
			Connection conexion = connector.getSqlServerConnection("entrada",
					"entrada");
			Statement sentenciaSQL;
			sentenciaSQL = conexion.createStatement();
			sentenciaSQL
			.executeUpdate("delete FROM Tabla_Alumno where ncuenta='"
					+ clave + "';");
			conexion.close();
			return 1;
		} catch (Exception e) {
                return 0;
		}
	
	}
	
}
