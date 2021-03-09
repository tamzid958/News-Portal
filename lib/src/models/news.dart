import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<News> news = [];

  String headline;
  String img;
  String description;
  String url;

  News({
    this.headline,
    this.description,
    this.img,
    this.url,
  });

  Future<void> getNews() async {
    var uri = Uri.encodeFull(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=322e52c552d54a9ea4d287f41a1d18d4");

    var response = await http.get(Uri.parse(uri));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          News article = News(
            headline: element['title'],
            description: element['description'],
            img: element['urlToImage'],
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
