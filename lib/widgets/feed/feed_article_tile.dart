import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../article_screen.dart';

class FeedArticleTile extends StatelessWidget {
  final String title, description, imageUrl, url;

  FeedArticleTile({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleScreen(url: url)));
      },
      child: Container(
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
      ),
    );
  }
}
