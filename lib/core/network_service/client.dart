import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:my_contacts/core/network_service/exceptions.dart';
import 'package:my_contacts/core/network_service/gql_client_provider.dart';
import 'package:my_contacts/utils/utils.dart';

class NetworkClient {
  final _log = appLogger(NetworkClient);
  // NetworkClient._();
  NetworkClient() {
    _onInit();
  }

  late GraphQLClient qlClient;

  _onInit() async {
    GraphqlClientProvider provider = GraphqlClientProvider();
    qlClient = await provider.createGraphQLClient();
  }

  Future<TResult?> mutate<TParsed, TResult>(
    MutationOptions<TParsed> options, {
    required TResult Function(TParsed e) transform,
    // void Function(AppException e)? onError,
    // VoidCallback? onBegin,
    // VoidCallback? onEnd,
  }) async {
    // final localErrorHandler =
    //     onError ?? (e) => debugPrint('ERROR > GQL_MUTATE > ${e.message}');
    // errorHandler(e, {StackTrace? stackTrace}) {
    //   onEnd?.call();
    // Sentry.captureException(e, stackTrace: stackTrace ?? StackTrace.current);
    // localErrorHandler(e);
    // }

    // onBegin?.call();
    try {
      final result = await qlClient.mutate(options);
      // onEnd?.call();
      if (result.hasException) {
        // throw AppException.fromGraphQl(result.exception);
      }
      final parsed = result.parsedData;
      if (parsed == null) return null;
      return transform.call(parsed);
    }
    //  on AppException catch (e) {
    //   errorHandler(e);
    //   Sentry.captureException(e);
    // }
    //  on d.DioError catch (e) {
    //   errorHandler(AppException.fromDio(e));
    // }
    on SocketException {
      throw UserDefinedExceptions('Network Error', 'No network connection');
    } on HttpException {
      UserDefinedExceptions('Network Error', 'No network connection');
    } on FormatException {
      UserDefinedExceptions('Format Error',
          'A format error has occurred, please kindly reach out to our customer care.');
    } on PlatformException catch (e) {
      _log.e("Error From PlatformException ", error: e);
      UserDefinedExceptions('Format Error',
          'A format error has occurred, please kindly reach out to our customer care.');
    } on LinkException catch (e) {
      _log.e("Error from Link Exception: ", error: e);
      throw UserDefinedExceptions('Error', e.toString());
      // errorHandler(AppException.fromLink(e));
    } catch (e) {
      debugPrint("\n\n\n\n<<<<<\n\n");
      debugPrint(e.runtimeType.toString());
      debugPrint(e.toString());
      debugPrint("\n\n>>>>>\n\n\n\n");
      // errorHandler(const AppException());
    }
    return null;
  }

  // Future<TResult?> query<TParsed, TResult>(
  //   QueryOptions<TParsed> options, {
  //   required TResult Function(TParsed e) transform,
  //   void Function(AppException e)? onError,
  //   VoidCallback? onBegin,
  //   VoidCallback? onEnd,
  // }) async {
  //   final localErrorHandler =
  //       onError ?? (e) => debugPrint('ERROR > GQL_MUTATE > ${e.message}');
  //   errorHandler(AppException e, {StackTrace? stackTrace}) {
  //     onEnd?.call();
  //     Sentry.captureException(e, stackTrace: stackTrace ?? StackTrace.current);
  //     localErrorHandler(e);
  //   }

  //   onBegin?.call();
  //   try {
  //     final result = await client.query(options);
  //     onEnd?.call();
  //     if (result.hasException) {
  //       throw AppException.fromGraphQl(result.exception);
  //     }
  //     final parsed = result.parsedData;
  //     if (parsed == null) return null;
  //     return transform.call(parsed);
  //   } on AppException catch (e) {
  //     errorHandler(e);
  //   } on d.DioError catch (e) {
  //     errorHandler(AppException.fromDio(e));
  //   } on SocketException {
  //     errorHandler(const AppException('No Internet connection 😑'));
  //   } on HttpException {
  //     errorHandler(const AppException('Resource not found 😱'));
  //   } on FormatException {
  //     errorHandler(const AppException('Bad response format 👎'));
  //   } on PlatformException catch (e) {
  //     errorHandler(AppException.fromPlatformException(e));
  //   } on DioLinkServerException {
  //     errorHandler(const AppException('Server Unavailable'));
  //   } on DioLinkParserException {
  //     errorHandler(const AppException('Response Error'));
  //   } on LinkException catch (e) {
  //     errorHandler(AppException.fromLink(e));
  //   } catch (e) {
  //     errorHandler(const AppException());
  //   }
  //   return null;
  // }

}

// Future runQuery(
//   String query, {
//   Map<String, dynamic> variables = const {},
// }) async {
//   final QueryOptions options = QueryOptions(
//     document: gql(query),
//     variables: variables,
//     cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
//   );
//   final response = await qlClient.query(options);

//   if (!response.hasException) {
//     return response.data;
//   }
//   _getErrorFromRequst(response.exception);
// }

// Future<dynamic> runMutation(
//   String mutation, {
//   Map<String, dynamic> variables = const {},
// }) async {
//   final MutationOptions options = MutationOptions(
//     document: gql(mutation),
//     variables: variables,
//     cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
//   );
//   final QueryResult response = await qlClient.mutate(options);

//   if (!response.hasException) {
//     return response.data;
//   }
//   _getErrorFromRequst(response.exception);
// }

// _getErrorFromRequst(OperationException? exception) {
//   _log.e("Error From GQL Request", error: exception.toString());
//   if (exception?.linkException != null) {
//     throw UserDefinedExceptions(
//         "Link Exception Error", exception?.graphqlErrors.first.message ?? "");
//   }
//   if (exception!.graphqlErrors.isNotEmpty) {
//     for (var i = 0; i < exception.graphqlErrors.length; i++) {
//       _log.i(
//           "Exception for index $i == ${exception.graphqlErrors[i].message}");
//     }
//     throw UserDefinedExceptions(
//         "Gql Errors [0]", exception.graphqlErrors[0].message);
//   }
//   throw throw UserDefinedExceptions(
//       "Unknown", "An unkown exception has occured.");
// }
