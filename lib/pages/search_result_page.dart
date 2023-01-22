// import 'package:expandable/expandable.dart';
import 'dart:async';

import 'package:animista/api/queries/search_anime.query.dart';
import 'package:animista/api/services/graphql_service.dart';
import 'package:animista/models/seasonal_anime.model.dart';
import 'package:animista/widgets/seasonal_anime_card.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:rxdart/rxdart.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
  );

  @override
  State<StatefulWidget> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final searchInputController = TextEditingController();
  final searchStreamController = StreamController<String>.broadcast();
  GraphQLService gqlService = GraphQLService();
  final String query = searchAnime;

  @override
  void initState() {
    super.initState();
    searchInputController.addListener(_emitSearch);
  }

  void _emitSearch() {
    if (searchInputController.text.isNotEmpty) {
      searchStreamController.add(searchInputController.text);
    }
  }

  Stream<QueryResult> _getSearchResults() {
    return searchStreamController.stream
        .distinct()
        .debounceTime(const Duration(microseconds: 250))
        .asyncMap((searchQuery) {
      return gqlService.performQuery(query, variables: {
        'search': searchQuery,
        'page': 1,
        'perPage': 10,
        'isAdult': false,
        'sort': ['FAVOURITES_DESC'],
        'format_in': ['TV', 'OVA', 'ONA']
      });
    }).whereNotNull();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // Search bar
          title: ListTile(
            contentPadding: const EdgeInsets.only(left: 20),
            trailing: IconButton(
                icon: const Icon(Icons.close),
                color: Colors.white,
                onPressed: () {
                  if (searchInputController.text.isNotEmpty) {
                    searchInputController.text = '';
                  }
                }),
            title: TextField(
              controller: searchInputController,
              decoration: const InputDecoration(
                hintText: 'Find your favorite animes...',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: _getSearchResults(),
          builder: (context, AsyncSnapshot<QueryResult> snapshot) {
            if (snapshot.hasData) {
              final results =
                  (snapshot.data!.data?['Page']['media'] as List<dynamic>);
              if (results.isEmpty) {
                return const Center(child: Text("No results"));
              } else {
                final animes = results
                    .cast<Map<String, dynamic>>()
                    .where((element) => element['episodes'] != null)
                    .map((e) => SeasonalAnimeModel.fromJson(e))
                    .toList();
                return ListView.builder(
                    itemCount: animes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SeasonalAnimeCard(data: animes[index]);
                    });
              }
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return const SizedBox.shrink();
          },
        ));
  }

  @override
  void dispose() {
    searchInputController.dispose();
    searchStreamController.close();
    super.dispose();
  }
}
