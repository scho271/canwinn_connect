import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:get/get.dart';

class LoginRepository extends GetxController {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<dynamic> loginApi(Map<String, dynamic> data) async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.loginUrl;
    final response = await _networkApiServices.postApiResponse(url, data);
    return response;
  }

  Future<dynamic> registerApi(Map<String, dynamic> data) async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.registersUrl;
    final response = await _networkApiServices.postApiResponse(url, data);
    return response;
  }

  Future<dynamic> sendOtp(Map<String, dynamic> data) async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.sendotp;
    final response = await _networkApiServices.postApiResponse(url, data);
    return response;
  }

  Future<dynamic> verifyOtp(Map<String, dynamic> data) async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.verifyotp;
    final response = await _networkApiServices.postApiResponse(url, data);
    return response;
  }
}
