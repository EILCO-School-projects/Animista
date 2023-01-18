import 'package:flutter/material.dart';

class AnimeDetailsPage extends StatelessWidget {
  const AnimeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        children: [
          Image.network(
            "https://cdn.myanimelist.net/images/anime/8/86304.jpg",
            fit: BoxFit.cover,
          ),
          const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Title : Dimension W",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ))
        ],
      ),
    );
  }
}
