import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpManager {
  Future<Map> request({
    required String url,
    required String method,
    Map? headers,
    Map? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(headers: defaultHeaders, method: method),
        data: body,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError catch (error) {
      showToast(message: error.message, isError: true);
      return error.response?.data ?? {};
    } catch (error) {
      showToast(message: error.toString(), isError: true);
      return {};
    }
  }

  Future<Map> requestList({
    required String url,
    required String method,
    Map? headers,
    List? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(headers: defaultHeaders, method: method),
        data: body,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError catch (error) {
      return error.response?.data ?? {};
    } catch (error) {
      return {};
    }
  }

  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 18,
    );
  }
}

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
}
