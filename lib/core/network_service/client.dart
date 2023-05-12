import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_contacts/core/network_service/exceptions.dart';
import 'package:my_contacts/utils/utils.dart';

HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");

class NetworkClient {
  NetworkClient._();
  static final NetworkClient _instance = NetworkClient._();
  static NetworkClient get instance => _instance;
  final _log = appLogger(NetworkClient);
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );

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
      // variables: variables,
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    );
    final QueryResult response = await qlClient.mutate(options);
    if (!response.hasException) {
      return response.data;
    }
    _getErrorFromRequst(response.exception);
  }

  _getErrorFromRequst(OperationException? exception) {
    _log.e("Error From GQL Reques", error: exception.toString());
    if (exception?.linkException != null) {
      log("Link Exception ::: ${exception?.linkException.toString()}");
      throw UserDefinedExceptions(
          "Link Exception Error", exception?.linkException?.originalException);
    }
    if (exception!.graphqlErrors.isNotEmpty) {
      final extensions = exception.graphqlErrors.first.extensions;
      log("GraphQl Error ::::: ${exception.graphqlErrors[0].message}");
      throw UserDefinedExceptions(
          "Gql Errors [0]", exception.graphqlErrors[0].message);
    }
  }
}
