import 'package:canwinn_project/domain/repositories/services_repository.dart';
import 'package:canwinn_project/modules/fetch_categroy_modules.dart';
import 'package:get/get.dart';

class FetchServicesController extends GetxController {
  ServiceRepository serviceRepository = Get.put(ServiceRepository());

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  var servicesList = <Vendor>[].obs;

  Future<void> fetchServiceData(String servicesId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await serviceRepository.getServiceCategroy(servicesId);
      final vendorResponse = VendorResponse.fromJson(response);

      servicesList.assignAll(vendorResponse.data?.vendors ?? []);
    } catch (ex) {
      errorMessage.value = ex.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
