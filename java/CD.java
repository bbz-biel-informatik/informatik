public class CD implements IInformation {
  private String title;
  private String artist;

  public CD(String title, String artist) {
    this.title = title;
    this.artist = artist;
  }

  public String infos() {
    return this.title + " (" + this.artist + ")";
  }
}