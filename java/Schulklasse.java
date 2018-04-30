import java.util.ArrayList;

public class Schulklasse {
  private String name;
  private ArrayList<ILebewesen> schueler;

  public Schulklasse(String name) {
    this.name = name;
    this.schueler = new ArrayList<ILebewesen>();
  }

  public String getName() {
    return name;
  }

  public void hinzufuegen(ILebewesen s) {
    schueler.add(s);
  }

  public void anzeigen() {
    for(int i = 0; i < schueler.size(); i = i + 1) {
      System.out.println(schueler.get(i).toString());
    }
  }
}