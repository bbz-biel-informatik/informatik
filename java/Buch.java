public class Buch implements IInformation {
  private String title;
  private String author;

  public Buch(String title, String author) {
    this.title = title;
    this.author = author;
  }

  public String infos() {
    return this.title + " (" + this.author + ")";
  }
}