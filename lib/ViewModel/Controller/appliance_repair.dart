import 'package:get/state_manager.dart';
import 'package:canwinn_project/modules/get_subcategories.dart';

class ApplianceController extends GetxController {
  var selectedService = Rx<Data?>(null);

  void selectService(Data service) {
    selectedService.value = service;
  }
}
