import 'package:animista/api/queries/anime_details.query.dart';
import 'package:animista/api/services/graphql_service.dart';
import 'package:animista/models/anime_details.model.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:graphql/client.dart';

class AnimeDetailsPage extends StatelessWidget {
  final GraphQLService gqlService = GraphQLService();
  static const String routeName = '/details';

  final String query = getAnimeDetails;

  static void navigateTo(BuildContext context, int id) {
    Navigator.pushNamed(context, AnimeDetailsPage.routeName, arguments: id);
  }

  AnimeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final variables = {'id': ModalRoute.of(context)!.settings.arguments as int};
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: FutureBuilder(
            future: gqlService.performQuery(query, variables: variables),
            builder:
                (BuildContext context, AsyncSnapshot<QueryResult> snapshot) {
              if (snapshot.hasData) {
                final data = AnimeDetailsModel.fromJson(
                    (snapshot.data!.data?['Media'] as Map<String, dynamic>));

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(45),
                        1: FlexColumnWidth(55),
                      },
                      children: [
                        TableRow(
                          children: [
                            Image.network(
                              data.coverImage,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Primary title
                                  Text(
                                    data.title.second ??
                                        data.title.third ??
                                        data.title.first ??
                                        "",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  //Secondary title
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      "(${data.title.first ?? ""})",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  // Year's season
                                  Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(data.seasonYear.toString())),
                                  // Format and episodes
                                  Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                          "${data.format} • ${data.episodes == 1 ? "1 episode" : "${data.episodes} episodes"}")),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              data.averageScore.toString()),
                                        ),
                                        const Tooltip(
                                          message: "Favourites",
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child:
                                              Text(data.favourites.toString()),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 25),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Tooltip(
                                          message: "Popularity",
                                          child: Icon(
                                            Icons.people,
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 4),
                                            child: Text(
                                                data.popularity.toString())),
                                      ],
                                    ),
                                  ),
                                  Center(
                                      child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.blue,
                                        side: const BorderSide(
                                            color: Colors.blue)),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.bookmark_add),
                                        Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text("Add to bookmarks")),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //Synopsis
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ExpandablePanel(
                        header: const Text(
                          "Synopsis",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        collapsed: Text(
                          data.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Html(data: data.description),
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                        ),
                      ),
                    ),
                    // Info section
                    const Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Text(
                        "Info",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(30),
                          1: FlexColumnWidth(50),
                        },
                        children: [
                          TableRow(
                            children: [
                              const Text(
                                'Romaji',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                data.title.first ?? "",
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'English',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(data.title.second ?? ""),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text('Native',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  data.title.third ?? "",
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text('Genres',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  data.genres.join(', '),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text('Format',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(data.format),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text('Episodes',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  data.episodes.toString(),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text('Ep. Duration',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  data.duration == 1
                                      ? "1 minute"
                                      : "${data.duration} minutes",
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text('Source',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  data.source,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text('Status',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(data.status),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text('Start Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "${data.startDate.first}-${data.startDate.second}-${data.startDate.third}",
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text('End Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text((data.endDate?.first != null &&
                                        data.endDate?.second != null &&
                                        data.endDate?.third != null)
                                    ? "${data.endDate?.first}-${data.endDate?.second}-${data.endDate?.third}"
                                    : "-"),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text('Season',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  data.season,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
