import java.sql.*;
import java.util.*;

class Datenbank {
  public Connection connect() {
    try {
      Class.forName("org.postgresql.Driver");
    } catch(ClassNotFoundException e) {
      e.printStackTrace();
    }

    String url = "jdbc:postgresql://ssh.bbz.cloud:21/lukas";
    String username = "postgres";
    String password = "1c567b94ebc1b4413950795dedea089c";

    try {
      Connection db = DriverManager.getConnection(url, username, password);
      return db;
    } catch(SQLException e) {
      return null;
    } 
  }

  public void insert(Connection db, String query) {
    try {
      Statement st = db.createStatement();
      ResultSet rs = st.executeQuery(query);
      rs.close();
      st.close();
    } catch(SQLException e) {
      e.printStackTrace();
    }
  }

  /* VARARGS hatten sie noch nicht, diese Methode ist also zu schwierig! */
  public void select(Connection db, String query, String... columns) {
    try {
      Statement st = db.createStatement();
      ResultSet rs = st.executeQuery(query);

      /* Not implemented, weil kompliziert */

      while (rs.next()) {
        String val = rs.getString("name");
      }
      rs.close();
      st.close();
    } catch(SQLException e) {
      e.printStackTrace();
    }
  }
}
