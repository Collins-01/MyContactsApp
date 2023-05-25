import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_contacts/core/data/local/local.dart';
import 'package:my_contacts/core/locator.dart';

class GraphqlClientProvider {
  final LocalCache _localCache;
  GraphqlClientProvider({LocalCache? localCache})
      : _localCache = localCache ?? locator();
  Future<GraphQLClient> createGraphQLClient() async {
    final HttpLink httpLink =
        HttpLink('https://your-graphql-endpoint.com/graphql');

    final String? deviceToken = _localCache.getToken();

    final AuthLink authLink = AuthLink(
      getToken: () async => deviceToken != null ? 'Bearer $deviceToken' : '',
    );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    );
  }
}
