

import 'dart:async';
import 'dart:io';
import 'package:canwinn_project/data/app_exception.dart';
import 'package:canwinn_project/data/network/base_api_services.dart';
import 'package:canwinn_project/helper/storage_helper.dart';
import 'package:dio/dio.dart';

class NetworkApiServices extends BaseApiServices {
  Dio dio = Dio();

  NetworkApiServices() {
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        error: true,
      ),
    );
  }

  @override
  // Future<dynamic> getGetApiResponse(String url) async {
  //   try {
  //     dio.options.headers["Authorization"] =
  //         "Bearer ${StorageHelper.getToken()}";
  //     final response = await dio.get(url);
  //     return returnResponse(response);
  //   } on SocketException {
  //     throw InternetException(message: 'No Internet Connection');
  //   } on TimeoutException {
  //     throw RequestTimeoutException(message: 'Request Timeout');
  //   } on DioException catch (e) {
  //     throw ServerException(message: e.message ?? 'Server Error');
  //   } catch (e) {
  //     throw AppException(message: 'Unexpected error: $e');
  //   }
  // }

  Future<dynamic> getGetApiResponse(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${StorageHelper.getToken()}";

      final response = await dio.get(
        url,
        queryParameters: queryParams,
      );

      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }


  Future<dynamic> getUserBookings(String url ,String userId,) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${StorageHelper.getToken()}";
      final response = await dio.get(url);
      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }



  @override
  Future<dynamic> postApiResponse(String url, dynamic data) async {
    try {
      dio.options.headers["Content-Type"] = "application/json";

      final response = await dio.post(url, data: data);

      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  Future<dynamic> postData(String url, dynamic data) async {
    try {
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Authorization"] = "Bearer ${StorageHelper.getToken()}";

      final response = await dio.post(url, data: data);

      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }







  @override
  Future<dynamic> getMultipartPostApiResponse(
    String url,
    FormData formData,
  ) async {
    try {
      dio.options.headers["Authorization"] =
          "Bearer ${StorageHelper.getToken()}";
      dio.options.contentType = 'multipart/form-data';

      final response = await dio.post(url, data: formData);
      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
          message: 'Bad Request',
          code: response.statusCode,
        );
      case 401:
        throw UnauthorizedException(
          message: 'Unauthorized',
          code: response.statusCode,
        );
      case 404:
        throw NotFoundException(
          message: 'Not Found',
          code: response.statusCode,
        );
      default:
        throw AppException(
          message: 'Something went wrong',
          code: response.statusCode,
        );
    }
  }
}
