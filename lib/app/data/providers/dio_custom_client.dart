import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';
import 'package:hmv_care_app/core/utils/constants.dart';

class DioCustomClient {
  static Dio? _client;

  static Dio get getClient =>
      _client ??= _customDioClient(Hive.box(AppConfig.HIVEBOX_STORAGE));

  static Dio _customDioClient(Box<dynamic> settingsBox) {
    var dioClient = Dio();
    dioClient.options = BaseOptions(baseUrl: AppConfig.API_ENDPOINT, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
      "Access-Control-Allow-Headers":
          "Origin,X-Requested-With,Accept,Access-Control-Allow-Headers,Access-Control-Allow-Methods,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token"
    });
    dioClient.interceptors.clear();
    dioClient.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      var authController = Get.find<AuthenticationController>();
      options.headers["Authorization"] = await authController.getToken();
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      print('Http Error on ${e.requestOptions.path}');
      if (e.response?.statusCode == 401) {
        var authController = Get.find<AuthenticationController>();
        e.requestOptions.headers["Authorization"] = authController.getToken();
        var response = e.response;
        try {
          response = await dioClient.fetch(e.requestOptions);
        } catch (e) {
          print(e);
        }
        if (response != null) {
          return handler.resolve(response);
        }
      }
      return handler.next(e);
    }));

    return dioClient;
  }
}
