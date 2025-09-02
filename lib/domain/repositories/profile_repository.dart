import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/modules/userprofile_modules.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileRepository extends GetxController {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<UserProfile> getProfileApi() async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.getProfile;
    final response = await _networkApiServices.getGetApiResponse(url);
    final profile = ProfileResponse.fromJson(response);
    return profile.data;
  }
}
