import 'package:animista/pages/anime_overview_page.dart';
import 'package:animista/pages/bookmarks_page.dart';
import 'package:animista/pages/search_result_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    const AnimeOverviewPage(),
    const SearchResultPage(),
    const BookmarksPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          AnimeOverviewPage.navBarItem,
          SearchResultPage.navBarItem,
          BookmarksPage.navBarItem
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
