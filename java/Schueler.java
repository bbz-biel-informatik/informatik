public class Schueler {
  private String name;
  private String wohnort;

  public Schueler(String name, String wohnort) {
    this.name = name;
    this.wohnort = wohnort;
  }

  public String toString() {
    return name + " (" + wohnort + ")";
  }
}