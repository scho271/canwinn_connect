import 'package:get/get.dart';

class HospitalController extends GetxController {
  var locations = ["Gurugram", "Delhi", "Mumbai", "Bangalore", "Kolkata"];
  var filters = ["Near Me", "Open 24x7", "Rating", "Private"];

  RxString selectedLocation = "Gurugram".obs;
  RxString selectedFilter = "Near Me".obs;
  RxBool isSelected= false.obs;

  void changeLocation(String value) {
    selectedLocation.value = value;
  }

  void changeFilter(String value) {
    selectedFilter.value = value;
  }

  var chipSelection = <String, bool>{
    "Nearby Focus": false,
    "Distance": false,
    "Category": false,
    "Price Offers": false,
    "Ratings": false,
  }.obs;

  void toggleChip(String key, bool value) {
    chipSelection[key] = value;
  }


}
