// import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      "Search page",
      textAlign: TextAlign.center,
    )));
  }
}
