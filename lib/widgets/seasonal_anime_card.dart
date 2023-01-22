import 'package:animista/models/seasonal_anime.model.dart';
import 'package:animista/pages/anime_details_page.dart';
import 'package:flutter/material.dart';

class SeasonalAnimeCard extends StatelessWidget {
  final SeasonalAnimeModel data;

  const SeasonalAnimeCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AnimeDetailsPage.navigateTo(context, data.id);
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
