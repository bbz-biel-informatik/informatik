public class Werkstatt {
  public static void main(String[] args) {
    Auto fiat = new Auto("Fiat 500", 3748957, 12000);
    fiat.testen();
    fiat.preisAendern(10000);
    
    Velo cannondale = new Velo("Cannondale", 5000);
    cannondale.testen();
    cannondale.preisAendern(4000);
  }
}
