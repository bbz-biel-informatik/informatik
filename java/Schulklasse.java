import java.util.ArrayList;

public class Schulklasse {
  private String name;
  private ArrayList<Schueler> schueler;

  public Schulklasse(String name) {
    this.name = name;
    this.schueler = new ArrayList<Schueler>();
  }

  public void hinzufuegen(Schueler s) {
    schueler.add(s);
  }

  public void anzeigen() {
    System.out.println(schueler);
  }
}