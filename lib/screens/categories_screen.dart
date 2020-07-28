import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/models/data.dart';
import 'package:newsapp/news.dart';
import 'package:newsapp/screens/article_screen.dart';
import 'package:newsapp/screens/category_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> _categories = getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryTile(_categories[index]);
          }),
    );
  }
}

class CategoryTile extends StatefulWidget {
  final Category _category;

  CategoryTile(this._category);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool isLoading = true;
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  void getArticles() async {
    _articles =
        await CategoryNews().getFeaturedNews(widget._category.identifier);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            child: Container(
              height: 240,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 140,
                          width: 260,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: 260,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Column(
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryScreen(widget._category.identifier),
                      ));
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      widget._category.label,
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                    itemCount: _articles.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext contex, int index) {
                      return CategoryTileItem(_articles[index]);
                    }),
              ),
              SizedBox(
                height: 12.0,
              )
            ],
          );
  }
}

class CategoryTileItem extends StatelessWidget {
  final Article article;

  CategoryTileItem(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ArticleScreen(url: article.url);
        }));
      },
      child: Container(
        height: 220,
        width: 260,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 6,
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage,
                  fit: BoxFit.fill,
                  width: 220,
                )),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              flex: 4,
              child: Text(
                article.title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
