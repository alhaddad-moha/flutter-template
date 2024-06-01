import 'dart:convert';
import 'dart:io';

import 'package:template/common/models/pagination.dart';
import 'package:template/core/network/interceptors/auth_interceptor.dart';
import 'package:template/core/network/models/network_error.dart';
import 'package:template/core/providers/localization_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final _dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://btm.tagtech.site/api/",
      receiveTimeout: const Duration(seconds: 20), // 20 seconds
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    ));

    dio.interceptors.addAll({
      TokenInterceptor(),
      // ErrorInterceptors(dio),
    });
    dio.interceptors.addAll({
      Logging(dio),
    });

    return dio;
  }

  Options options = Options(headers: header);

  Future getDeleteApiResponse({required String endPoint}) async {
    Response jsonResponse;

    try {
      final response = await _dio.delete(endPoint);
      jsonResponse = response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Response(
          requestOptions: RequestOptions(path: e.requestOptions.path),
          data: ErrorModel(messageAr: loc.no_internet_connection, messageEn: loc.no_internet_connection).toMap(),
        );
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }

    return jsonResponse;
  }

  Future getDeleteWithDataApiResponse({required String endPoint, required data}) async {
    Response? jsonResponse;

    try {
      Response response = await _dio.delete(
        endPoint,
        data: jsonEncode(data),
      );

      jsonResponse = response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Response(
          requestOptions: RequestOptions(path: e.requestOptions.path),
          data: ErrorModel(messageAr: loc.no_internet_connection, messageEn: loc.no_internet_connection).toMap(),
        );
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }

    return jsonResponse;
  }

  Future getGetApiResponse({required String endPoint, Map<String, dynamic>? queryParameter}) async {
    Response jsonResponse;

    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameter,
      );
      jsonResponse = response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Response(
          requestOptions: RequestOptions(path: e.requestOptions.path),
          data: ErrorModel(messageAr: loc.no_internet_connection, messageEn: loc.no_internet_connection).toMap(),
        );
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }

    return jsonResponse;
  }

  Future getGetWithDataApiResponse(
      {required String endPoint, required data, PaginationParameters? paginationParameters}) async {
    Response? jsonResponse;

    try {
      Response response = await _dio.get(
        endPoint,
        data: jsonEncode(data),
        queryParameters: paginationParameters?.toQueryParameter(),
      );

      jsonResponse = response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Response(
          requestOptions: RequestOptions(path: e.requestOptions.path),
          data: ErrorModel(messageAr: loc.no_internet_connection, messageEn: loc.no_internet_connection).toMap(),
        );
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }

    return jsonResponse;
  }

  Future<Either<String, dynamic>> getPostApiResponse({required String endPoint, required data}) async {
    try {
      Response response = await _dio
          .post(
            endPoint,
            data: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200 || response.statusCode == 200) {
        return right(response.data);
      } else {
        final errorResponse = ErrorModel.fromMap(response.data);
        return left(errorResponse.message);
      }
    } on SocketException catch (e) {
      // throw SocketException(e.toString());
      return left(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return left(loc.no_internet_connection);
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }
  }

  Future getPostFormDataApiResponse({required String endPoint, required data}) async {
    Response? jsonResponse;

    try {
      Response response = await _dio
          .post(
            endPoint,
            data: data,
            options: Options(headers: {'Content-Type': 'multipart/form-data'}),
          )
          .timeout(const Duration(seconds: 60));

      jsonResponse = response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Response(
          requestOptions: RequestOptions(path: e.requestOptions.path),
          data: ErrorModel(messageAr: loc.no_internet_connection, messageEn: loc.no_internet_connection).toMap(),
        );
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }

    return jsonResponse;
  }

  Future getPutApiResponse({required String endPoint, required data}) async {
    Response? jsonResponse;

    try {
      Response response = await _dio
          .put(
            endPoint,
            data: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 60));

      jsonResponse = response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Response(
          requestOptions: RequestOptions(path: e.requestOptions.path),
          data: ErrorModel(messageAr: loc.no_internet_connection, messageEn: loc.no_internet_connection).toMap(),
        );
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }

    return jsonResponse;
  }

  Future getPutFormDataApiResponse({required String endPoint, required data}) async {
    Response? jsonResponse;

    try {
      Response response = await _dio.put(
        endPoint,
        data: data,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      jsonResponse = response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Response(
          requestOptions: RequestOptions(path: e.requestOptions.path),
          data: ErrorModel(messageAr: loc.no_internet_connection, messageEn: loc.no_internet_connection).toMap(),
        );
      }

      final errorResponse = ErrorModel.fromMap(e.response?.data);
      return left(errorResponse.message);
    } catch (e) {
      rethrow;
    }

    return jsonResponse;
  }
}

class Logging extends Interceptor {
  final Dio dio;

  Logging(this.dio);

  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}

final Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'client-secret': 'xyz',
  'client-id': 'abc',
  'platform': 'android',
  'Authorization': "access_token"
};
