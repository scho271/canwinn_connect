import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ServiceRepository extends GetxController{
  final NetworkApiServices _networkApiServices = NetworkApiServices();
  Future<dynamic> bookServices(Map<String, dynamic> data) async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.bookServices;
    final response = await _networkApiServices.postData(url, data);
    return response;
  }

  Future<dynamic> getServiceCategroy(String serviceId)async{
    final String url = "${AppApiUrl.baseUrl + AppApiUrl.getServicesCategories}/$serviceId";
    final response = await _networkApiServices.getUserBookings(url, serviceId);
    return response;
  }


Future<dynamic> getBookServiceHistory(String userId, String token) async {
  final String url = "${AppApiUrl.baseUrl+ AppApiUrl.serviceBookingList}$userId";
  final response = await _networkApiServices.getUserBookings(url, userId);
  return response;
}

}