import java.util.Scanner;
import java.util.ArrayList;

public class Schule {
  public static void main(String[] args) {
    /*
    Schulklasse klasse1 = new Schulklasse("Wayup 2017");
    
    Schueler s1 = new Schueler("Reto Houzchopf", "Bern");
    Schueler s2 = new Schueler("Robert Einstein", "Bern");
    
    klasse1.hinzufuegen(s1);
    klasse1.hinzufuegen(s2);
    
    klasse1.anzeigen();
    */

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
        Schulklasse k = new Schulklasse(name);
        klassen.add(k);
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
        System.out.println("Klassenname?");
        String name = scanner.nextLine();
        for (int i = 0; i < klassen.size(); i++) {
          if (klassen.get(i).getName().equals(name)) {
            klassen.get(i).hinzufuegen(schueler);
            System.out.println("Klasse hinzugefügt");
            klassen.clear();
          }
        }
      }

      if (auswahl == 4) {
        for (int i = 0; i < klassen.size(); i++) {
          klassen.get(i).anzeigen();
        }
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
