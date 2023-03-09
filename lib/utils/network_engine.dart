import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class NetworkEngine {
  static const String _baseUrl = "https://css-cms.onrender.com";

  static const String registerUser = "/api/admin/user/signup";
  static const String loginUser = "/api/admin/user/login";

  static Future<Dio> getDio() async {
    Dio dio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          'content-type': "application/json",
          'X-Requested-With': 'XMLHttpRequest',
        },
        baseUrl: _baseUrl,
      ),
    );
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocPath + "/.cookies/"),
    );
    dio.interceptors.add(CookieManager(jar));

    if (kDebugMode) {
      dio.interceptors.add(
        InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
          debugPrint('''
        ******************************************************************************************************

        ${error.message} || ${error.response}

        ******************************************************************************************************
        ''');
          return errorInterceptorHandler.next(error);
        }, onRequest: (request, requestInterceptorHandler) {
          debugPrint('''
        ******************************************************************************************************

        ${request.method} || ${request.path} ||| ${request.data}

        ******************************************************************************************************
        ''');
          return requestInterceptorHandler.next(request);
        }, onResponse: (response, responseInterceptorHandler) {
          debugPrint('''
          -******************************************************************************************************
          ${response.statusMessage} || ${response.statusCode} |||| ${response.data}
          --******************************************************************************************************
          ''');

          return responseInterceptorHandler.next(response);
        }),
      );
    }
    return dio;
  }
}
