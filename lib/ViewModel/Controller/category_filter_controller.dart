// import 'package:canwinn_project/ViewModel/Controller/get_services_controller.dart';
// import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
// import 'package:canwinn_project/ViewModel/Controller/vendor_controller.dart';
// import 'package:canwinn_project/ViewModel/Controller/get_categories_controller.dart';
// import 'package:get/get.dart';
//
// class DashboardController extends GetxController {
//   final VendorsController vendorsController = Get.put(VendorsController());
//   final GetServicesController getServicesController = Get.put(GetServicesController());
//   final CategoriesController categoriesController = Get.put(CategoriesController());
//   final HospitalController hospitalController = Get.put(HospitalController());
//
//   var selectedChipIndex = 0.obs;
//   final List<String> filterOptions = ['All', 'Medical', 'Repair', 'Services', ];
//
//   @override
//   void onInit() {
//     super.onInit();
//     getServicesController.fetchBookingList();
//     vendorsController.getVendorData(Get.context!);
//     categoriesController.fetchCategories();
//   }
//
//   List<dynamic> get filteredCategories {
//     if (selectedChipIndex.value == 0) {
//       return categoriesController.categoriesList;
//     } else {
//       return categoriesController.categoriesList.where((category) {
//         if (selectedChipIndex.value == 1) {
//           return category.id == 10 || category.id == 11 || category.id == 12;
//         } else if (selectedChipIndex.value == 2) {
//           return category.id == 13;
//         } else if (selectedChipIndex.value == 3) {
//           return category.id != 10 && category.id != 11 && category.id != 12 && category.id != 13;
//         } else if (selectedChipIndex.value == 4) {
//           return false;
//         } else {
//           return false;
//         }
//       }).toList();
//     }
//   }
//
//   void changeFilter(int index) {
//     selectedChipIndex.value = index;
//   }
// }





import 'package:canwinn_project/ViewModel/Controller/get_categories_controller.dart';
import 'package:canwinn_project/ViewModel/Controller/get_services_controller.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
import 'package:canwinn_project/ViewModel/Controller/vendor_controller.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class DashboardController extends GetxController {
  final VendorsController vendorsController = Get.put(VendorsController());
  final GetServicesController getServicesController = Get.put(GetServicesController());
  final CategoriesController categoriesController = Get.put(CategoriesController());
  final HospitalController hospitalController = Get.put(HospitalController());
  var selectedApplianceIndex = (-1).obs;


  var selectedChipIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    vendorsController.getVendorData(Get.context!);
    categoriesController.fetchCategories();
  }
  List<String> get filterOptions {
    return categoriesController.categoriesList.map((c) => c.name.toString()).toList();
  }


  List<dynamic> get filteredCategories {
    if (selectedChipIndex.value == 0) {
      return categoriesController.categoriesList;
    } else {
      return categoriesController.categoriesList.where((category) {
        return category.name == filterOptions[selectedChipIndex.value];
      }).toList();
    }
  }

  void changeFilter(int index) {
    selectedChipIndex.value = index;
  }
}
