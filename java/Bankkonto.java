class Bankkonto {
  int kontostand;
  int kontonummer;

  void einzahlen(int betrag) {
    kontostand += betrag;
  }

  void abheben(int betrag) {
    kontostand -= betrag;
  }

  int kontostandAbrufen() {
    return kontostand;
  }
}
