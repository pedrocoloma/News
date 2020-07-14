import 'dart:convert';

import 'models/article.dart';
import 'package:http/http.dart' as http;

class News   {
  List<Article> news = [];

  Future<void> getNews() async {
    String url = 'http://newsapi.org/v2/top-headlines?country=br&apiKey=63db1b3624f145c7b88677a76be4d357';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if(element['urlToImage'] != null && element['title'] != null) {
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
  }

}

