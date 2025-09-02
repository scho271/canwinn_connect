import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MemberShipRepository extends GetxController{
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<dynamic> registerMembers(Map<String, dynamic> data) async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.registersUrl;
    final response = await _networkApiServices.postApiResponse(url, data);
    return response;
  }
}