import 'package:flutter/material.dart';
import 'package:newsapp/components/feed.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/news.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  getArticles() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: Container(
              // child: Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: ListView.builder(
                    itemBuilder: (_, __) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 10.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 180,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                width: double.infinity,
                                height: 70,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )),
              ),
              // ),
            ),
          )
        : Feed(articles);
  }
}
