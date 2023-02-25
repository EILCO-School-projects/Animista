import 'package:animista/api/queries/seasonal_anime.query.dart';
import 'package:animista/api/services/graphql_service.dart';
import 'package:animista/models/seasonal_anime.model.dart';
import 'package:animista/models/user.model.dart';
import 'package:animista/widgets/profile_drawer.dart';
import 'package:animista/widgets/seasonal_anime_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import '../api/services/database_service.dart';
import '../utils/firebase.dart';

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
  final user = GetIt.I<AppUser>();
  GraphQLService gqlService = GetIt.I<GraphQLService>();
  DatabaseService dbService = GetIt.I<DatabaseService>();
  final String query = getSeasonalAnime;

  //Todo : Get season and seasonYear dynamically
  late final variables = {
    'page': 1,
    'perPage': 20,
    'season': 'FALL',
    'seasonYear': 2022,
    'isAdult': false,
    'sort': ['POPULARITY_DESC'],
    'format_in': ['TV', 'OVA', 'ONA']
  };

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
        drawer: ProfileDrawer(),
        body: StreamBuilder(
          stream: dbService.listen("users/${escapeEmail(user.email)}"),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final live_user =
                  AppUser.fromJson(snapshot.data as Map<Object?, dynamic>);

              return FutureBuilder(
                  future: gqlService.performQuery(query, variables: variables),
                  builder: (BuildContext context,
                      AsyncSnapshot<QueryResult> snapshot) {
                    if (snapshot.hasData) {
                      final animes = (snapshot.data!.data?['Page']['media']
                              as List<dynamic>)
                          .cast<Map<String, dynamic>>()
                          .where((element) => element['episodes'] != null)
                          .map((e) {
                        SeasonalAnimeModel anime =
                            SeasonalAnimeModel.fromJson(e);
                        if (live_user.bookmarks!.contains(anime.id)) {
                          anime.isBookmarked = true;
                        }
                        return anime;
                      }).toList();

                      return ListView.builder(
                          itemCount: animes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SeasonalAnimeCard(data: animes[index]);
                          });
                    } else if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    }
                    return const Center(child: CircularProgressIndicator());
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
