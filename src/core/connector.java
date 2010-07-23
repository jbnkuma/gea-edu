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
		Usuario="gea";
		Contraseña="gea.edu";
		try{
			String URL_bd="jdbc:mysql://localhost/Geaedu";
			Connection conexion = DriverManager.getConnection(URL_bd,Usuario,Contraseña);
			return conexion;
		}
		
		catch(Exception e){
			System.out.println("Error = "+e);
			return null;
		}
		
	}
	public static Boolean id(String cuenta) throws SQLException{
		Connection conexion = connector.getSqlServerConnection("entrada","entrada"); 
		Statement   sentenciaSQL;
		ResultSet   cdr;
		sentenciaSQL = conexion.createStatement();
	        cdr=sentenciaSQL.executeQuery("SELECT ncuenta FROM Tabla_Alumno");
	        while(cdr.next()){
	        	if(cdr.getString("ncuenta").equals(cuenta)==true){
	        	return true;
	        	}
	        	else{
	        		return false;
	        	}
	        }
	   
	        conexion.close();
		    return false;
	}
}