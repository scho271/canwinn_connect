// widgets/add_contact_bottom_sheet.dart
import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller_addEmergencyContact.dart';


class AddContactBottomSheet extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final contactController = Get.find<EmergencyContactsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40,
      ),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add Contact", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              )
            ],
          ),
          SizedBox(height: 12),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),
          SizedBox(height: 70),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: "Phone Number",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),
          SizedBox(height: 70),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                contactController.addContact(
                  nameController.text.trim(),
                  phoneController.text.trim(),
                );
                Get.back(); // Close bottom sheet
              },
              child: Text("Save Contact",style: TextStyle(color: white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
