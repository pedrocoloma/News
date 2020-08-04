import 'dart:core';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/repositories/news_api_client.dart';

class NewsRepository {
  final NewsApiClient newsApiClient;

  NewsRepository({this.newsApiClient}) : assert(newsApiClient != null);

  Future<List<Article>> getNews() async {
    return newsApiClient.getNews();
  }

  Future<List<Article>> getNewsForCategory(String category) async {
    return newsApiClient.getNewsForCategory(category);
  }

  Future<List<Article>> getFeaturedNews(String category) async {
    return newsApiClient.getFeaturedNews(category);
  }
}
