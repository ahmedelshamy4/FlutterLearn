import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class GraphQLConfig {
  static const String endpoint = 'https://api.github.com/graphql';

  static final HttpLink httpLink = HttpLink(
    endpoint,
  );

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(store: InMemoryStore()),
    link: httpLink,
  );

  Future<QueryResult> perform(
      {required String mutation, Map<String, dynamic> variables = const {}}) {
    final options = MutationOptions(
      document: gql(mutation),
      variables: variables,
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
      errorPolicy: ErrorPolicy.all,
      fetchPolicy: FetchPolicy.networkOnly,
    );
    return client.mutate(options);
  }

  Future<QueryResult> fetch(
      {required String query, Map<String, dynamic> variables = const {}}) {
    final options = QueryOptions(
        document: gql(query),
        variables: variables,
        fetchPolicy: FetchPolicy.networkOnly,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        errorPolicy: ErrorPolicy.all);
    return client.query(options);
  }
}
