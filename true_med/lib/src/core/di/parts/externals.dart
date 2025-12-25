part of '../dependency_injection.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) =>
    SharedPreferences.getInstance();

// @riverpod
// Dio dio(Ref ref) {
//   final dio = Dio();

//   dio.interceptors.addAll([
//     TokenManager(
//       baseUrl: Endpoints.base,
//       refreshTokenEndpoint: Endpoints.refreshToken,
//       cacheService: ref.read(cacheServiceProvider),
//       navigatorKey: ref.read(goRouterProvider).routerDelegate.navigatorKey,
//       dio: Dio(
//         BaseOptions(
//           baseUrl: Endpoints.base,
//           connectTimeout: const Duration(seconds: 5),
//           receiveTimeout: const Duration(seconds: 3),
//         ),
//       ),
//     ),
//     if (kDebugMode) PrettyDioLogger(requestHeader: true, requestBody: true),
//   ]);

//   dio.options.headers['Content-Type'] = 'application/json';

//   return dio;
// }

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.base,
      validateStatus: (status) => status != null && status < 500,

      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 13),
      headers: {
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true',
      },
    ),
  );

  // LOCTB HARD_CODE_BYPASS_SSL_CERTIFICATE

  /// ---------------------------------------------------------
  /// 🔥 TƯƠNG ĐƯƠNG curl --insecure (bypass SSL certificate)
  /// ---------------------------------------------------------
  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();

      /// Cho phép SSL không hợp lệ (self-signed, IP HTTPS)
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    },
  );

  /// ---------------------------------------------------------
  /// Interceptors
  /// ---------------------------------------------------------
  dio.interceptors.addAll([
    TokenManager(
      baseUrl: Endpoints.base,
      refreshTokenEndpoint: Endpoints.refreshToken,
      cacheService: ref.read(cacheServiceProvider),
      navigatorKey: ref.read(goRouterProvider).routerDelegate.navigatorKey,
      dio: Dio(
        BaseOptions(
          baseUrl: Endpoints.base,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 13),
        ),
      ),
    ),

    if (kDebugMode) PrettyDioLogger(requestHeader: true, requestBody: true),
  ]);

  return dio;
}
