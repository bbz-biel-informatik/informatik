public class Katze implements ILebewesen {
  public String name;
  public String fellfarbe;
  
  public Katze(String name, String fellfarbe) {
    this.name = name;
    this.fellfarbe = fellfarbe;
  }
  
  public String toString() {
    return "Miau ich bin " + name;
  }
}
