class Bank {
  public static void main(String[] args) {
    Bankkonto b1 = new Bankkonto();
    b1.kontonummer = 12345;
    b1.kontostand = 100;

    b1.einzahlen(200);

    System.out.println(b1.kontostandAbrufen());
  }
}