import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AnimeDetailsPage extends StatelessWidget {
  static const String routeName = '/details';

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, AnimeDetailsPage.routeName);
  }

  const AnimeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
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
                    "https://cdn.myanimelist.net/images/anime/8/86304.jpg",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Primary title
                        const Text(
                          "Dimension W",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        //Secondary title
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            "(Dimension W)",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // Year's season
                        const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text("2023")),
                        // Format and episodes
                        const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text("TV • 24 episodes")),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
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
                                padding: EdgeInsets.only(left: 4, right: 32),
                                child: Text(
                                  '7.5',
                                ),
                              ),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Tooltip(
                                message: "Popularity",
                                child: Icon(
                                  Icons.people,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text('1523')),
                            ],
                          ),
                        ),
                        Center(
                            child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              side: const BorderSide(color: Colors.blue)),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                  fontWeight: FontWeight.w600,
                ),
              ),
              collapsed: const Text(
                "When Thorfinn loses it all, he must find his new purpose for living in a strange new land \n"
                "When Thorfinn loses it all, he must find his new purpose for living in a strange new land",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: const Text(
                  "When Thorfinn loses it all, he must find his new purpose for living in a strange new land\n"
                  "When Thorfinn loses it all, he must find his new purpose for living in a strange new land"),
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
              ),
            ),
          ),
          // Info section
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              "Info",
              style: TextStyle(
                fontWeight: FontWeight.w600,
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
                const TableRow(
                  children: [
                    Text(
                      'Romaji',
                    ),
                    Text(
                      "Dimension W",
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'English',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text("Dimension W"),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Native'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Dimension W",
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Genres'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        ["Action", "Adventure", "Drama"].join(', '),
                      ),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text('Format')),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('TV'),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Episodes',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        '24',
                      ),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Ep. Duration',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        '25 minutes',
                      ),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Source'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Manga",
                      ),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Status',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text("Released"),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Start Date'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "06-22-2015",
                      ),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'End Date',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "03-29-2016",
                      ),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Season',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Summer',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
