// import 'dart:io';

// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio/dio.dart' as d;
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fresh_dio/fresh_dio.dart';
// import 'package:get/get.dart' hide Response;
// import 'package:gql_dio_link/gql_dio_link.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:oja/config/secrets.dart';
// import 'package:oja/models/app_error.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:sentry_dio/sentry_dio.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

// class GQL extends GetxService {
//   GraphQLClient get client => _client;

//   ValueNotifier<GraphQLClient> get clientNotifier => ValueNotifier(client);

//   Future<void> initialize() async {
//     final Dio dio = d.Dio();
//     final String appDocPath = await getDocPath();

//     dio.interceptors.addAll([
//       /*Fresh(
//         tokenStorage: GetXTokenStorage<OAuth2Token>(
//           fromToken: GetXTokenStorage.dBStringFromOAuth2Token,
//           toToken: GetXTokenStorage.oAuth2TokenFromString,
//         ),
//         refreshToken: (token, client) {
//           // TODO: Perform refresh and return new token
//           return Future.value(token);
//         },
//         httpClient: dio,
//         tokenHeader: (token) {
//           return {
//             'Authorization': 'Bearer ${token.accessToken}',
//           };
//         },
//       ),*/
//       CookieManager(
//         PersistCookieJar(
//           ignoreExpires: true,
//           storage: FileStorage("$appDocPath/.cookies/"),
//           persistSession: true,
//         ),
//       ),
//       PrettyDioLogger(
//         request: false,
//         requestHeader: false,
//         requestBody: false,
//         responseBody: false,
//         responseHeader: false,
//         error: true,
//         compact: true,
//       ),
//     ]);

//     dio.addSentry(
//       captureFailedRequests: true,
//     );

//     final DioLink dioLink = DioLink(url, client: dio);

//     _client = GraphQLClient(
//       link: dioLink,
//       cache: GraphQLCache(store: HiveStore()),
//     );
//   }

//   GraphQLClient _client = GraphQLClient(
//     link: HttpLink(url),
//     cache: GraphQLCache(),
//   );

//   static const String url = Secrets.graphQLEndpoint;
// }

// extension Operations on GQL {
//   Future<TResult?> mutate<TParsed, TResult>(
//     MutationOptions<TParsed> options, {
//     required TResult Function(TParsed e) transform,
//     void Function(AppException e)? onError,
//     VoidCallback? onBegin,
//     VoidCallback? onEnd,
//   }) async {
//     final localErrorHandler =
//         onError ?? (e) => debugPrint('ERROR > GQL_MUTATE > ${e.message}');
//     errorHandler(AppException e, {StackTrace? stackTrace}) {
//       onEnd?.call();
//       Sentry.captureException(e, stackTrace: stackTrace ?? StackTrace.current);
//       localErrorHandler(e);
//     }

//     onBegin?.call();
//     try {
//       final result = await client.mutate(options);
//       onEnd?.call();
//       if (result.hasException) {
//         throw AppException.fromGraphQl(result.exception);
//       }
//       final parsed = result.parsedData;
//       if (parsed == null) return null;
//       return transform.call(parsed);
//     } on AppException catch (e) {
//       errorHandler(e);
//       Sentry.captureException(e);
//     } on d.DioError catch (e) {
//       errorHandler(AppException.fromDio(e));
//     } on SocketException {
//       errorHandler(const AppException('No Internet connection 😑'));
//     } on HttpException {
//       errorHandler(const AppException('Resource not found 😱'));
//     } on FormatException {
//       errorHandler(const AppException('Bad response format 👎'));
//     } on PlatformException catch (e) {
//       errorHandler(AppException.fromPlatformException(e));
//     } on DioLinkServerException {
//       errorHandler(const AppException('Server Unavailable'));
//     } on DioLinkParserException {
//       errorHandler(const AppException('Response Error'));
//     } on LinkException catch (e) {
//       errorHandler(AppException.fromLink(e));
//     } catch (e) {
//       debugPrint("\n\n\n\n<<<<<\n\n");
//       debugPrint(e.runtimeType.toString());
//       debugPrint(e.toString());
//       debugPrint("\n\n>>>>>\n\n\n\n");
//       errorHandler(const AppException());
//     }
//     return null;
//   }

//   Future<TResult?> query<TParsed, TResult>(
//     QueryOptions<TParsed> options, {
//     required TResult Function(TParsed e) transform,
//     void Function(AppException e)? onError,
//     VoidCallback? onBegin,
//     VoidCallback? onEnd,
//   }) async {
//     final localErrorHandler =
//         onError ?? (e) => debugPrint('ERROR > GQL_MUTATE > ${e.message}');
//     errorHandler(AppException e, {StackTrace? stackTrace}) {
//       onEnd?.call();
//       Sentry.captureException(e, stackTrace: stackTrace ?? StackTrace.current);
//       localErrorHandler(e);
//     }

//     onBegin?.call();
//     try {
//       final result = await client.query(options);
//       onEnd?.call();
//       if (result.hasException) {
//         throw AppException.fromGraphQl(result.exception);
//       }
//       final parsed = result.parsedData;
//       if (parsed == null) return null;
//       return transform.call(parsed);
//     } on AppException catch (e) {
//       errorHandler(e);
//     } on d.DioError catch (e) {
//       errorHandler(AppException.fromDio(e));
//     } on SocketException {
//       errorHandler(const AppException('No Internet connection 😑'));
//     } on HttpException {
//       errorHandler(const AppException('Resource not found 😱'));
//     } on FormatException {
//       errorHandler(const AppException('Bad response format 👎'));
//     } on PlatformException catch (e) {
//       errorHandler(AppException.fromPlatformException(e));
//     } on DioLinkServerException {
//       errorHandler(const AppException('Server Unavailable'));
//     } on DioLinkParserException {
//       errorHandler(const AppException('Response Error'));
//     } on LinkException catch (e) {
//       errorHandler(AppException.fromLink(e));
//     } catch (e) {
//       errorHandler(const AppException());
//     }
//     return null;
//   }

//   Future<String> getDocPath() async {
//     var appDocDir = await getApplicationDocumentsDirectory();
//     return appDocDir.path;
//   }
// }

// extension BooleanToggle on RxBool {
//   void toFalsy() => value = false;

//   void toTruthy() => value = true;
// }

// class Fresh extends d.Interceptor with FreshMixin {
//   Fresh({
//     required TokenHeaderBuilder<OAuth2Token> tokenHeader,
//     required TokenStorage<OAuth2Token> tokenStorage,
//     required Dio httpClient,
//     required RefreshToken<OAuth2Token> refreshToken,
//   })  : _refreshToken = refreshToken,
//         _tokenHeader = tokenHeader,
//         _shouldRefresh = _defaultShouldRefresh,
//         _httpClient = httpClient {
//     this.tokenStorage = tokenStorage;
//   }

//   final Dio _httpClient;
//   final TokenHeaderBuilder<OAuth2Token> _tokenHeader;
//   final ShouldRefresh _shouldRefresh;
//   final RefreshToken<OAuth2Token> _refreshToken;

//   @override
//   Future<dynamic> onRequest(
//     d.RequestOptions options,
//     d.RequestInterceptorHandler handler,
//   ) async {
//     final currentToken = await token;
//     final headers = currentToken != null
//         ? _tokenHeader(currentToken)
//         : const <String, String>{};
//     options.headers.addAll(headers);
//     handler.next(options);
//   }

//   @override
//   Future<dynamic> onResponse(
//     d.Response response,
//     d.ResponseInterceptorHandler handler,
//   ) async {
//     if (_tokenAvailable(response)) {
//       _pluckAndSaveNewToken(response);
//       return handler.next(response);
//     } else if (await token == null || !_shouldRefresh(response)) {
//       return handler.next(response);
//     }
//     try {
//       final refreshResponse = await _tryRefresh(response);
//       handler.resolve(refreshResponse);
//     } on d.DioError catch (error) {
//       handler.reject(error);
//     }
//   }

//   @override
//   Future<dynamic> onError(
//     d.DioError err,
//     d.ErrorInterceptorHandler handler,
//   ) async {
//     final response = err.response;
//     if (response == null ||
//         await token == null ||
//         err.error is RevokeTokenException ||
//         !_shouldRefresh(response)) {
//       return handler.next(err);
//     }
//     try {
//       final refreshResponse = await _tryRefresh(response);
//       handler.resolve(refreshResponse);
//     } on d.DioError catch (error) {
//       handler.next(error);
//     }
//   }

//   Future<d.Response<dynamic>> _tryRefresh(d.Response response) async {
//     late final OAuth2Token refreshedToken;
//     try {
//       refreshedToken = await _refreshToken(await token, _httpClient);
//     } on RevokeTokenException catch (error) {
//       await clearToken();
//       throw d.DioError(
//         requestOptions: response.requestOptions,
//         error: error,
//         response: response,
//       );
//     }

//     await setToken(refreshedToken);
//     _httpClient.options.baseUrl = response.requestOptions.baseUrl;
//     return _httpClient.request<dynamic>(
//       response.requestOptions.path,
//       cancelToken: response.requestOptions.cancelToken,
//       data: response.requestOptions.data,
//       onReceiveProgress: response.requestOptions.onReceiveProgress,
//       onSendProgress: response.requestOptions.onSendProgress,
//       queryParameters: response.requestOptions.queryParameters,
//       options: d.Options(
//         method: response.requestOptions.method,
//         sendTimeout: response.requestOptions.sendTimeout,
//         receiveTimeout: response.requestOptions.receiveTimeout,
//         extra: response.requestOptions.extra,
//         headers: response.requestOptions.headers
//           ..addAll(_tokenHeader(refreshedToken)),
//         responseType: response.requestOptions.responseType,
//         contentType: response.requestOptions.contentType,
//         validateStatus: response.requestOptions.validateStatus,
//         receiveDataWhenStatusError:
//             response.requestOptions.receiveDataWhenStatusError,
//         followRedirects: response.requestOptions.followRedirects,
//         maxRedirects: response.requestOptions.maxRedirects,
//         requestEncoder: response.requestOptions.requestEncoder,
//         responseDecoder: response.requestOptions.responseDecoder,
//         listFormat: response.requestOptions.listFormat,
//       ),
//     );
//   }

//   void _pluckAndSaveNewToken(d.Response response) {
//     final token = response.headers['vendure-auth-token'];
//     if (token != null) {
//       setToken(
//         OAuth2Token(
//           accessToken: token.first,
//           tokenType: 'Bearer',
//         ),
//       );
//     }
//   }

//   bool _tokenAvailable(d.Response response) {
//     return response.headers['vendure-auth-token'] != null;
//   }

//   static bool _defaultShouldRefresh(d.Response? response) {
//     return response?.statusCode == 401;
//   }
// }

