// import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.bookmark),
    label: 'Bookmarks',
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      "Bookmarks page",
      textAlign: TextAlign.center,
    )));
  }
}
