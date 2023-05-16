// import 'package:dio/dio.dart';
// import 'package:flutter/services.dart';
// import 'package:gql_dio_link/gql_dio_link.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class AppException implements Exception {
//   @pragma('vm:entry-point')
//   const AppException(
//       [this.message = defaultMessage, Object? data, StackTrace? trace]);

//   factory AppException.fromPlatformException(PlatformException e) {
//     String msg = defaultMessage;

//     switch (e.code) {
//       case 'sign_in_canceled':
//         msg = 'Sign-in cancelled';
//         break;

//       case 'network_error':
//         msg = 'Check your internet connection';
//         break;

//       case 'sign_in_failed':
//         msg = 'Sign-in failed';
//         break;

//       default:
//         msg = e.message ?? defaultMessage;
//         break;
//     }

//     return AppException(msg);
//   }

//   // factory AppException.fromDio(DioError e) {
//   //   String message = defaultMessage;

//   //   switch (e.type) {
//   //     case DioErrorType.connectTimeout:
//   //     case DioErrorType.sendTimeout:
//   //     case DioErrorType.receiveTimeout:
//   //       message = 'Timeout: Check you internet connection';
//   //       break;
//   //     case DioErrorType.response:
//   //       message = 'Invalid server response';
//   //       break;
//   //     case DioErrorType.cancel:
//   //       message = 'Request cancelled';
//   //       break;
//   //     case DioErrorType.other:
//   //       break;
//   //   }

//   //   return AppException(message);
//   // }

//   factory AppException.fromGraphQl(OperationException? e) {
//     if (e == null) {
//       return const AppException(defaultMessage);
//     }

//     if (e.linkException != null) {
//       final err = e.linkException;

//       if (err is NetworkException) {
//         return const AppException('Check your internet connection');
//       }

//       if (err is DioLinkTimeoutException) {
//         return const AppException('Timeout: Check your internet connection');
//       }

//       if (err is DioLinkCanceledException) {
//         return const AppException('Request Cancelled');
//       }

//       if (err is DioLinkServerException) {
//         return const AppException('Server Unavailable');
//       }

//       if (err is DioLinkParserException) {
//         return const AppException('Response Error');
//       }

//       return const AppException('Unexpected Error, Try again');
//     }

//     if (e.graphqlErrors.isNotEmpty) {
//       final err = e.graphqlErrors.first;
//       print(e);
//       return AppException(
//           '${err.message}${e.graphqlErrors.length > 1 ? '${e.graphqlErrors.length - 1}' : ''}');
//     }

//     return const AppException();
//   }

//   factory AppException.fromLink(LinkException e) {
//     String message = 'Unexpected Error, Try again';

//     if (e is DioLinkTimeoutException) {
//       message = 'Timeout: Check your internet connection';
//     }

//     if (e is DioLinkCanceledException) {
//       message = 'Request Cancelled';
//     }

//     return AppException(message);
//   }

//   final String message;

//   @override
//   String toString() {
//     return message;
//   }

//   static const String defaultMessage = 'Unexpected Error';
// }
