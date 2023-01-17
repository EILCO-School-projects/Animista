import 'package:animista/pages/anime_details_page.dart';
import 'package:animista/pages/bookmarks_page.dart';
import 'package:animista/pages/search_result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const _pages = [
    AnimeDetailsPage(),
    SearchResultPage(),
    BookmarksPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Overview',
            )
          ],
          onTap: (index) => setState(() {
            _selectedIndex = index;
          }),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
