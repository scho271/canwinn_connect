import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/View/widgets/Bottomsheet_addEmergencyContacts.dart';
import 'package:canwinn_project/View/widgets/Controller_addEmergencyContact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ViewModel/Controller/hospital_controller.dart';

class EmergencyContactsScreen extends StatelessWidget {
  final contactcontroller = Get.put(EmergencyContactsController());
  final HospitalController controller = Get.put(HospitalController());


  final List<Map<String, String>> emergencyContacts = [
    {"title": "Local Police", "phone": "+91 1234567890"},
    {"title": "Fire Department", "phone": "+91 1234567890"},
    {"title": "Nearest Hospital", "phone": "+91 1234567890"},
    {"title": "Child Helpline/ Women Helpline", "phone": "+91 1234567890"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          leading:IconButton(onPressed: (){
            Get.back();
          }, icon:Icon(Icons.arrow_back_ios_rounded)),
          title: Text(
            "Emergency Contacts",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Obx(() => DropdownButton<String>(
                        value: controller.selectedLocation.value.isNotEmpty
                            ? controller.selectedLocation.value
                            : null,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("Select Location"),
                        items: controller.locations.map((location) {
                          return DropdownMenuItem<String>(
                            value: location,
                            child: Text(location),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.changeLocation(value);
                          }
                        },
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount: contactcontroller.emergencyContacts.length,
                    itemBuilder: (context, index) {
                      final contact =
                          contactcontroller.emergencyContacts[index];
                      return ListTile(
                        title: Text(contact['title'] ?? '', style: earn100),
                        subtitle: Text(contact['phone'] ?? ''),
                        trailing: IconButton(
                          icon: Icon(Icons.call, color: Colors.green),
                          onPressed: () {
                            launch("tel:${contact['phone']}");
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        AddContactBottomSheet(),
                        isScrollControlled: true,
                        backgroundColor: backGroundColor,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Add Personal Emergency Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
