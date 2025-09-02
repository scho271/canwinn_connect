import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/modules/get_hospital_details.dart';
import 'package:canwinn_project/modules/get_vendor_type_module.dart';
import 'package:canwinn_project/modules/get_vendors_modules.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:get/get.dart';

class VendorRepository extends GetxController {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<List<Vendor>?> getVendorApi() async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.vendorType;
    final response = await _networkApiServices.getGetApiResponse(url);
    final vendorResponse = GetVendor.fromJson(response);
    return vendorResponse.data;
  }

  Future<List<Data>?> getVendorType({required String vendorType}) async {
    final String url = "${AppApiUrl.baseUrl}${AppApiUrl.getvendor}?vendor_type=$vendorType";
    final response = await _networkApiServices.getGetApiResponse(url);
    final vendorResponsedData = GetVendorTypeModule.fromJson(response);
    return vendorResponsedData.data;
  }

  Future<VendorModel?> getVendorById(int vendorId) async {
    try {
      final String url = "https://connect.electionmaster.in/public/api/vendors/$vendorId";
      final response = await _networkApiServices.getGetApiResponse(url);
      if (response != null && response['success'] == true) {
        return VendorModel.fromJson(response['data']);
      } else {
        return null;
      }
    } catch (e) {
      print("Error in getVendorById: $e");
      return null;
    }
  }
}
