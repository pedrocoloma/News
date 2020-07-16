import 'package:flutter/material.dart';
import 'package:newsapp/components/feed_article_tile.dart';
import 'package:newsapp/models/article.dart';

class Feed extends StatelessWidget {
  final List<Article> articles;

  Feed(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: articles.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) => FeedArticleTile(
          title: articles[index].title,
          description: articles[index].description,
          imageUrl: articles[index].urlToImage,
          url: articles[index].url,
        ),
      ),
    );
    ;
  }
}
