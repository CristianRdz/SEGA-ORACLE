package mx.edu.utez.aweb.sega.utiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class OracleConnection {
    public Connection getConnection() {
        final String host="localhost",
                port="1521",
                sid="xe",
                user="system",
                password="password";
        try {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            return DriverManager.getConnection(
                    "jdbc:oracle:thin:@"+host+":"+port+":"+sid+"",user,password);
        } catch (SQLException e) {
            System.out.println(this.getClass().getCanonicalName() + " -> " + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        Connection conn = new OracleConnection().getConnection();
        if (conn != null) {
            try {
                System.out.println("Exito");
                conn.close();
            } catch (SQLException e) {

            }
        } else {
            System.out.println("Fallo de conexión");
        }
    }
}
