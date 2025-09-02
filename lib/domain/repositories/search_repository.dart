import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/modules/search_data_modules.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class SearchRepository extends GetxController {
  final NetworkApiServices _networkApiServices = NetworkApiServices();
  RxList<SearchServiceModel> searchResponseData = <SearchServiceModel>[].obs;
  RxBool isSearching = false.obs;

  Future<List<SearchServiceModel>> searchData(String query) async {
    try {
      isSearching.value = true; 
      final String url = "https://connect.electionmaster.in/public/api/services/search?query=$query";
      final response = await _networkApiServices.getUserBookings(url, query);

      if (response != null && response['success'] == true) {
        SearchServiceResponse searchResponse = SearchServiceResponse.fromJson(response);
        searchResponseData.value = searchResponse.data;
        return searchResponse.data;
      } else {
        searchResponseData.clear();
        return [];
      }
    } catch (e) {
      print("Error in SearchRepository.searchData: $e");
      searchResponseData.clear();
      return [];
    }
  }

  void clearSearch() {
    isSearching.value = false;
    searchResponseData.clear();
  }
}
