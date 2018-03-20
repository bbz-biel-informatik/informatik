public class Velo extends Fahrzeug {
  // Konstruktor(en)
  public Velo(String bezeichnung, int preis) {
    this.bezeichnung = bezeichnung;
    this.preis = preis;
    this.verkauft = false;
  }
  
  // Methoden
  public void testen() {
    System.out.println("Tschhiiiu");
  }
}
