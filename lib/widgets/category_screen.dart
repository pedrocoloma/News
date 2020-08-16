import 'package:flutter/material.dart';
import 'feed/feed.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/repositories/repositories.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen(this.category);
  final String category;
  final NewsRepository repository =
      NewsRepository(newsApiClient: NewsApiClient());

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Article> _articles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  getArticles() async {
    _articles = await widget.repository.getNewsForCategory(widget.category);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Feed(_articles),
    );
  }
}
