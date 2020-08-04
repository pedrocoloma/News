import 'package:http/http.dart' as http;
import 'package:newsapp/models/models.dart';
import 'dart:convert';

class NewsApiClient {
  final http.Client httpClient;
  final baseUrl = 'http://newsapi.org/v2/top-headlines?country=br';

  NewsApiClient({this.httpClient}) /*: assert(httpClient != null)*/;

  Future<List<Article>> getNewsForCategory(String category) async {
    List<Article> articles = [];
    String url =
        '$baseUrl&category=$category&apiKey=63db1b3624f145c7b88677a76be4d357';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['title'] != null) {
          var article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );

          articles.add(article);
        }
      });
    }
    return articles;
  }

  Future<List<Article>> getFeaturedNews(String category) async {
    List<Article> articles = [];

    String url =
        '$baseUrl&category=$category&apiKey=63db1b3624f145c7b88677a76be4d357';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['title'] != null) {
          var article = Article(
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );

          articles.add(article);
        }
      });
    }

    return articles;
  }

  Future<List<Article>> getNews() async {
    List<Article> news = [];
    String url = '$baseUrl&apiKey=63db1b3624f145c7b88677a76be4d357';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['title'] != null) {
          var article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );

          news.add(article);
        }
      });
    }
    return news;
  }
}
