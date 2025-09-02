// doctor_controller.dart
import 'package:get/get.dart';

class DoctorController extends GetxController {
  var services = [
    'Diabetes Management',
    'Homeopath',
    'Physiotherapy',
    'General surgery',
    'Urinary Issues',
    'Lungs & Breathing',
  ].obs;

  var filteredServices = <String>[].obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredServices.assignAll(services);
    ever(searchText, (_) {
      filteredServices.assignAll(
        services.where((service) => service.toLowerCase().contains(searchText.value.toLowerCase())),
      );
    });
  }

  void updateSearch(String value) {
    searchText.value = value;
  }
}
