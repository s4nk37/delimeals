import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'categories_screen.dart';
import '../widgets/main_drawer.dart';
import '../widgets/main_appbar.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;

  const TabsScreen({Key? key, required this.favoritedMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'DeliMeals'},
      {
        'page': FavoritesScreen(favoritedMeals: (widget.favoritedMeals)),
        'title': 'Your favorites'
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String appBarText = _pages[_selectedPageIndex]['title'] as String;
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: MainAppBar(title: appBarText),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
