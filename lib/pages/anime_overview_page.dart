import 'package:animista/pages/anime_details_page.dart';
import 'package:flutter/material.dart';

class AnimeOverviewPage extends StatefulWidget {
  const AnimeOverviewPage({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  );

  @override
  State<AnimeOverviewPage> createState() => _AnimeOverviewPage();
}

class _AnimeOverviewPage extends State<AnimeOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.play_circle),
            Padding(
                padding: EdgeInsets.only(left: 10), child: Text("Now Airing")),
          ],
        ),
      ),
      body: ListView(children: _generateCards(context)),
    );
  }

  List<Widget> _generateCards(context) {
    List<Widget> cards = [];
    for (int i = 0; i < 10; i++) {
      cards.add(animeCard(context));
    }
    return cards;
  }

  Widget animeCard(context) {
    return InkWell(
        onTap: () {
          AnimeDetailsPage.navigateTo(context);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: Table(columnWidths: const {
            0: FlexColumnWidth(35),
            1: FlexColumnWidth(65)
          }, children: [
            TableRow(children: [
              Image.network(
                "https://cdn.myanimelist.net/images/anime/8/86304.jpg",
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                  child: Text("Dimension W",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 20))),
                              IconButton(
                                  //Todo: Book mark action
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_add,
                                    color: Colors.grey,
                                  ))
                            ]),
                        const Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text("TV • Spring 2015",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blueGrey))),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Tooltip(
                                    message: "Favourites",
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('896'),
                                  ),
                                ])),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Tooltip(
                                    message: "Weighted Average Score",
                                    child: Icon(
                                      Icons.star_outlined,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4, right: 32),
                                    child: Text('7.5'),
                                  )
                                ])),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Tooltip(
                                    message: "Weighted Average Score",
                                    child: Icon(
                                      Icons.tv,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4, right: 32),
                                    child: Text('24 episodes'),
                                  )
                                ])),
                      ]))
            ])
          ]),
        ));
  }
}
