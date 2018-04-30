public class Fahrzeug {
  // Eigenschaften
  protected String bezeichnung;
  protected int preis;
  protected boolean verkauft;

  public void preisAendern(int neuerPreis) {
    this.preis = neuerPreis;
  }
}