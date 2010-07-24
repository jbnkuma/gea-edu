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
		sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
	        cdr=sentenciaSQL.executeQuery("SELECT ncuenta FROM Tabla_Alumno where ncuenta='"+cuenta+"';");
	        while(cdr.next()){
	        	System.out .print(cdr);
	        	if(cdr.equals(cuenta)==true){
	            conexion.close();	
	        	return true;
	        	}
	        	else{
	        		conexion.close();
	        		return false;
	        	}
	        }
	   
	        conexion.close();
		    return false;
	}
	
	 public static void formu1(String ncuenta, String nombre , String apaterno , String amaterno , String edad , String telefono ,String correo , String Genero , String calle, String colonia , String municipio , String estado , String codigop ) throws SQLException{
		 Connection conexion = connector.getSqlServerConnection("entrada","entrada"); 
			Statement   sentenciaSQL;
			sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			sentenciaSQL.executeUpdate("INSERT INTO Tabla_Alumno VALUES('"+ncuenta+"', '"+nombre+"','"+apaterno+"','"+amaterno+"','"+edad+"','"+telefono+"','"+correo+"','"+Genero+"','"+calle+"','"+colonia+"','"+municipio+"','"+estado+"','"+codigop+"');");	
			conexion.close();
	 }
	 public static void formu2(String clave, String nombre, String curso, String semestre) throws SQLException{
		 Connection conexion = connector.getSqlServerConnection("entrada","entrada");
		 Statement   sentenciaSQL;
		 sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
		sentenciaSQL.executeUpdate("INSERT INTO Tabla_Alumno VALUES('"+clave+"', '"+nombre+"','"+curso+"','"+semestre+"');");
		conexion.close();
	 }

	 
}