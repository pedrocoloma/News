import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsapp/repositories/repositories.dart';
import 'package:newsapp/widgets/home_screen.dart';
import 'package:newsapp/widgets/categories_screen.dart';

void main() {
  final newsRepository = NewsRepository(
    newsApiClient:
        NewsApiClient(httpClient: http.Client()), // não está sendo usado
  );
  runApp(App(newsRepository: newsRepository));
}

class App extends StatefulWidget {
  final NewsRepository newsRepository;

  App({@required this.newsRepository});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(
      repository: NewsRepository(
        newsApiClient: NewsApiClient(httpClient: http.Client()),
      ),
    ),
    CategoriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primaryColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('News'),
            elevation: 0,
          ),
          body: screens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                title: Text('Feed'),
                icon: Icon(Icons.featured_play_list),
              ),
              BottomNavigationBarItem(
                title: Text('Categories'),
                icon: Icon(Icons.category),
              ),
            ],
          ),
        ));
  }
}
