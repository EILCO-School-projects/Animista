import 'package:animista/api/services/database_service.dart';
import 'package:animista/models/seasonal_anime.model.dart';
import 'package:animista/models/user.model.dart';
import 'package:animista/pages/anime_details_page.dart';
import 'package:animista/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SeasonalAnimeCard extends StatefulWidget {
  final SeasonalAnimeModel data;

  const SeasonalAnimeCard({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SeasonalAnimeCard();
}

class _SeasonalAnimeCard extends State<SeasonalAnimeCard> {
  final dbService = GetIt.I<DatabaseService>();
  final user = GetIt.I<AppUser>();
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.data.isBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AnimeDetailsPage.navigateTo(context, widget.data.id);
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
                widget.data.coverImage,
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
                                      widget.data.title.second ??
                                          widget.data.title.third ??
                                          widget.data.title.first ??
                                          "",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(fontSize: 20))),
                              IconButton(
                                  onPressed: () async {
                                    final reference =
                                        "users/${escapeEmail(user.email)}";
                                    final dbUser =
                                        await dbService.read(reference);
                                    if (dbUser != null) {
                                      List<int> bookmarks = List<int>.from(
                                          AppUser.fromJson(dbUser
                                                  as Map<Object?, dynamic>)
                                              .bookmarks as List<int>);

                                      if (!isBookmarked) {
                                        bookmarks = bookmarks
                                            .where((element) => element != 0)
                                            .toList();
                                        bookmarks.add(widget.data.id);
                                      } else {
                                        bookmarks = bookmarks
                                            .where((e) => e != widget.data.id)
                                            .toList();
                                      }
                                      user.bookmarks = bookmarks;
                                      dbService.update(reference,
                                          data: {'bookmarks': user.bookmarks});
                                    }
                                    setState(() {
                                      isBookmarked = !isBookmarked;
                                    });
                                  },
                                  icon: Icon(
                                    isBookmarked
                                        ? Icons.bookmark_added
                                        : Icons.bookmark_add,
                                    color: isBookmarked
                                        ? Colors.purple
                                        : Colors.grey,
                                  ))
                            ]),
                        Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                                "${widget.data.format} • ${widget.data.season} ${widget.data.seasonYear}",
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
                                    child:
                                        Text(widget.data.favourites.toString()),
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
                                    child: Text(
                                        widget.data.averageScore.toString()),
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
                                    child:
                                        Text(widget.data.episodes.toString()),
                                  )
                                ])),
                      ]))
            ])
          ]),
        ));
  }
}
