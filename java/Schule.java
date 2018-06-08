import java.util.Scanner;
import java.util.ArrayList;
import java.sql.*;

public class Schule {
  public static void main(String[] args) throws SQLException {
    /*
    Schulklasse klasse1 = new Schulklasse("Wayup 2017");
    
    Schueler s1 = new Schueler("Reto Houzchopf", "Bern");
    Schueler s2 = new Schueler("Robert Einstein", "Bern");
    
    klasse1.hinzufuegen(s1);
    klasse1.hinzufuegen(s2);
    
    klasse1.anzeigen();
    */

    /* JDBC */
    Connection conn = new Datenbank().connect();

    ArrayList<Schulklasse> klassen = new ArrayList<Schulklasse>();
    ArrayList<Schueler> schueler = new ArrayList<Schueler>();

    Scanner scanner = new Scanner(System.in);

    System.out.println("1: Klasse erfassen; 2: Schüler erfassen; 3: Schüler zu Klasse hinzufügen; 4: Klasse anzeigen");
    System.out.println("Was möchtest du tun?");
    int auswahl = scanner.nextInt();
    scanner.nextLine();

    while (auswahl != 0) {
      if (auswahl == 1) {
        System.out.println("Name?");
        String name = scanner.nextLine();
        /* JDBC */
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("INSERT INTO schulklassen (name) VALUES ('" + name + "')");
        rs.close();
        st.close();
      }
      if (auswahl == 2) {
        System.out.println("Name?");
        String name = scanner.nextLine();
        System.out.println("Wohnort?");
        String ort = scanner.nextLine();
        Schueler s = new Schueler(name, ort);
        schueler.add(s);
      }

      if (auswahl == 3) {
        /* INCOMPLETE! */
        System.out.println("Klassenname?");
        String name = scanner.nextLine();
        for (int i = 0; i < klassen.size(); i++) {
          if (klassen.get(i).getName().equals(name)) {
            //klassen.get(i).hinzufuegen(schueler);
            System.out.println("Klasse hinzugefügt");
            klassen.clear();
          }
        }
      }

      if (auswahl == 4) {
        /* JDBC */
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM lieder");
        while (rs.next()) {
          System.out.println(rs.getInt("id"));
          System.out.println(rs.getString("name"));
        }
        rs.close();
        st.close();
      }

      System.out
          .println("1: Klasse erfassen; 2: Schüler erfassen; 3: Schüler zu Klasse hinzufügen; 4: Klasse anzeigen");
      System.out.println("Was möchtest du tun?");
      auswahl = scanner.nextInt();
      scanner.nextLine();
    }

    System.out.println("Auswahl war 0, beenden");
    scanner.close();
    System.exit(0);
  }
}
