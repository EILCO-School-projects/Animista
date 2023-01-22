import 'package:animista/api/graphql_service.dart';
import 'package:animista/api/queries/seasonal_anime.query.dart';
import 'package:animista/models/seasonal_anime.model.dart';
import 'package:animista/pages/anime_details_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

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
  late List<SeasonalAnimeModel> animes;
  GraphQLService gqlService = GraphQLService();
  final String query = getSeasonalAnime;
  final variables = {
    'page': 1,
    'perPage': 20,
    'season': 'FALL',
    'seasonYear': 2022,
    'isAdult': false,
    'sort': ['POPULARITY_DESC'],
    'format_in': ['TV', 'OVA', 'ONA']
  };

  @override
  void initState() {
    super.initState();
    // final data = json.decode(seasonalAnimesJsonExample) as List<dynamic>;
    // animes = data
    //     .cast<Map<String, dynamic>>()
    //     .where((element) => element['episodes'] != null)
    //     .map((e) => SeasonalAnimeModel.fromJson(e))
    //     .toList();
  }

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
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Now Airing")),
            ],
          ),
        ),
        body: FutureBuilder(
            future: gqlService.performQuery(query, variables: variables),
            builder:
                (BuildContext context, AsyncSnapshot<QueryResult> snapshot) {
              if (snapshot.hasData) {
                final animes =
                    (snapshot.data!.data?['Page']['media'] as List<dynamic>)
                        .cast<Map<String, dynamic>>()
                        .where((element) => element['episodes'] != null)
                        .map((e) => SeasonalAnimeModel.fromJson(e))
                        .toList();

                return ListView.builder(
                    itemCount: animes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return seasonalAnimeCard(context, animes[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  List<Widget> _generateSeasonalCards(context) {
    List<Widget> cards = [];
    for (SeasonalAnimeModel anime in animes) {
      cards.add(seasonalAnimeCard(context, anime));
    }
    return cards;
  }

  Widget seasonalAnimeCard(context, SeasonalAnimeModel data) {
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
                data.coverImage,
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
                              Flexible(
                                  child: Text(
                                      data.title.second ??
                                          data.title.third ??
                                          data.title.first ??
                                          "",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(fontSize: 20))),
                              IconButton(
                                  //Todo: Book mark action
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_add,
                                    color: Colors.grey,
                                  ))
                            ]),
                        Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                                "${data.format} • ${data.season} ${data.seasonYear}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.blueGrey))),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Tooltip(
                                    message: "Favourites",
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(data.favourites.toString()),
                                  ),
                                ])),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Tooltip(
                                    message: "Weighted Average Score",
                                    child: Icon(
                                      Icons.star_outlined,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 32),
                                    child: Text(data.averageScore.toString()),
                                  )
                                ])),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Tooltip(
                                    message: "Weighted Average Score",
                                    child: Icon(
                                      Icons.tv,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 32),
                                    child: Text(data.episodes.toString()),
                                  )
                                ])),
                      ]))
            ])
          ]),
        ));
  }
}
