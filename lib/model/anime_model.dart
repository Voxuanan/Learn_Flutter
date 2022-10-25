import "dart:core";

class AnimeModel {
  final String id;
  final String name;
  final String image;
  final List<String> genre;
  final int rating;

  AnimeModel(this.id, this.name, this.image, this.genre, this.rating);

  static List<AnimeModel> mockData() {
    List<AnimeModel> lst = [];
    lst.add(AnimeModel("1", "Your lie in April",
        "assets/images/anime/YourLieInApril.jpg", ["Romance"], 5));
    lst.add(AnimeModel(
        "2",
        "Grimgar of fantasy and ash",
        "assets/images/anime/Grimgar.jpg",
        ["Action", "Adventure", "Fantasy"],
        5));
    lst.add(AnimeModel("3", "No game no life",
        "assets/images/anime/NoGameNoLife.jpg", ["Action", "Fantasy"], 5));
    lst.add(AnimeModel("4", "Koe no katachi",
        "assets/images/anime/KoeNoKatachi.jpg", ["Romance"], 5));

    return lst;
  }
}
