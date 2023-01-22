import 'package:graphql/client.dart';

class GraphQLService {
  GraphQLClient? _client;

  GraphQLService() {
    HttpLink link = HttpLink("https://graphql.anilist.co");

    _client = GraphQLClient(cache: GraphQLCache(), link: link);
  }

  Future<QueryResult> performQuery(String query,
      {required Map<String, dynamic> variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);
    return await _client!.query(options);
  }
}
