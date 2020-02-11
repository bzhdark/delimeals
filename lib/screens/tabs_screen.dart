import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  static const _textStyle = TextStyle(fontSize: 14);

  List _pages;
  int _selectedPageIndex = 0;

  initState() {
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'}
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              'Categories',
              style: _textStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              'Favorites',
              style: _textStyle,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
