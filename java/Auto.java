public class Auto extends Fahrzeug {
  // Eigenschaften
  private int zulassungsnummer;
  
  // Konstruktor(en)
  public Auto(String bezeichnung, int zulassungsnummer, int preis) {
    this.bezeichnung = bezeichnung;
    this.zulassungsnummer = zulassungsnummer;
    this.preis = preis;
    this.verkauft = false;
  }
  
  // Methoden
  public void testen() {
    System.out.println("Bruuuummm");
  }
}
