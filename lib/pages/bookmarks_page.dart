import 'package:animista/api/queries/search_bookmarks.query.dart';
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

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.bookmark),
    label: 'Bookmarks',
  );

  @override
  State<BookmarksPage> createState() => _BookmarksPage();
}

class _BookmarksPage extends State<BookmarksPage> {
  final user = GetIt.I<AppUser>();
  GraphQLService gqlService = GetIt.I<GraphQLService>();
  DatabaseService dbService = GetIt.I<DatabaseService>();
  final String query = getBookmarkedAnime;
  Map<String, dynamic> variables = {};

  @override
  void initState() {
    super.initState();
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
              Icon(Icons.bookmark),
              Padding(
                  padding: EdgeInsets.only(left: 10), child: Text("Bookmarks")),
            ],
          ),
        ),
        drawer: ProfileDrawer(),
        body: StreamBuilder(
          stream: dbService.listen("users/${escapeEmail(user.email)}"),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final liver_user =
                  AppUser.fromJson(snapshot.data as Map<Object?, dynamic>);
              if (user.bookmarks![0] != 0) {
                variables = {
                  'id_in': liver_user.bookmarks,
                  'page': 1,
                  'perPage': 100,
                };
                return FutureBuilder(
                    future:
                        gqlService.performQuery(query, variables: variables),
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
                          if (user.bookmarks!.contains(anime.id)) {
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
              }
              return const Center(
                  child: Text(
                "You haven't bookmarked any anime yet",
                textAlign: TextAlign.center,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
