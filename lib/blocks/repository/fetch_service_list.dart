import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/modules/service_list/fetch_service_list.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';

class Repository {
  final NetworkApiServices _networkApiServices = NetworkApiServices();
  var isLoading = false;

  Future<List<FetchServiceListData>> getServiceList() async {
    isLoading = true;
    try {
      final response = await _networkApiServices.getGetApiResponse(
        AppApiUrl.baseUrl + AppApiUrl.getServices,
      );

      print("Response data: $response");

      if (response['success'] == true && response['data'] != null) {
        final serviceList = FetchServiceList.fromJson(response);
        return serviceList.data ?? [];
      } else {
        throw Exception("Failed to load services: Invalid response structure");
      }
    } catch (e) {
      throw Exception("Error fetching services: $e");
    } finally {
      isLoading = false;
    }
  }
}
