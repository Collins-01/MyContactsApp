import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:my_contacts/core/network_service/exceptions.dart';
import 'package:my_contacts/utils/utils.dart';

class NetworkClient {
  final _log = appLogger(NetworkClient);

  late HttpLink httpLink;
  late AuthLink authLink;

  late Link link;
  late GraphQLClient qlClient;

  _initialize() {
    httpLink = HttpLink('https://your-graphql-endpoint.com/graphql');
    authLink = AuthLink(
      getToken: () async => '',
    );

    link = authLink.concat(httpLink);
    qlClient = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: link,
    );
  }

  static NetworkClient? _instance;

  factory NetworkClient() {
    if (_instance == null) {
      _instance = NetworkClient._internal();
      _instance!._initialize();
    }
    return _instance!;
  }

  NetworkClient._internal();

  Future runQuery(
    String query, {
    Map<String, dynamic> variables = const {},
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables,
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    );
    final response = await qlClient.query(options);

    if (!response.hasException) {
      return response.data;
    }
    _getErrorFromRequst(response.exception);
  }

  Future<dynamic> runMutation(
    String mutation, {
    Map<String, dynamic> variables = const {},
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: variables,
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    );
    final QueryResult response = await qlClient.mutate(options);

    if (!response.hasException) {
      return response.data;
    }
    _getErrorFromRequst(response.exception);
  }

  _getErrorFromRequst(OperationException? exception) {
    _log.e("Error From GQL Request", error: exception.toString());
    if (exception?.linkException != null) {
      throw UserDefinedExceptions(
          "Link Exception Error", exception?.graphqlErrors.first.message ?? "");
    }
    if (exception!.graphqlErrors.isNotEmpty) {
      for (var i = 0; i < exception.graphqlErrors.length; i++) {
        _log.i(
            "Exception for index $i == ${exception.graphqlErrors[i].message}");
      }
      throw UserDefinedExceptions(
          "Gql Errors [0]", exception.graphqlErrors[0].message);
    }
    throw throw UserDefinedExceptions(
        "Unknown", "An unkown exception has occured.");
  }
}
