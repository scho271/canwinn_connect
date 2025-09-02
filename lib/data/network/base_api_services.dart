import 'package:dio/dio.dart';

abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> postApiResponse(String url, dynamic data);
  Future<dynamic> getMultipartPostApiResponse(String url, FormData formData);
}
