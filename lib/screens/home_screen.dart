import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/news.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  title: articles[index].title,
                  description: articles[index].description,
                  imageUrl: articles[index].urlToImage,
                ),
              ),
            ),
    );
  }
}

class ListTile extends StatelessWidget {
  final String title, description, imageUrl;

  ListTile(
      {@required this.title,
      @required this.description,
      @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
