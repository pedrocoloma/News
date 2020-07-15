import 'package:flutter/material.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/categories_screen.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News App  ',
        theme: ThemeData(
          primaryColor: Colors.white,
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
