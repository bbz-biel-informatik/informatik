import java.util.*;

public class Shop {
  public static void main(String[] args) {
    ArrayList<IInformation> artikel = new ArrayList<IInformation>();

    Buch b1 = new Buch("La Divina Comedia", "Dante");
    artikel.add(b1);

    CD c1 = new CD("Aelita", "Mando Diao");
    artikel.add(c1);

    for(IInformation x : artikel) {
      System.out.println(x.infos());
    }
  }
}
