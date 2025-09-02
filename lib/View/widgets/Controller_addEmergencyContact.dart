
import 'package:get/get.dart';
class EmergencyContactsController extends GetxController{
  var emergencyContacts=<Map<String,String>>[].obs;
  void addContact(String name,String phone){
    emergencyContacts.add({
      'title':name,
      'phone':phone
    });
  }
}