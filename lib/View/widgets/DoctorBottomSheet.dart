// find_doctor_sheet.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DoctorController.dart';
class FindDoctorSheet extends StatelessWidget {
  final DoctorController controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Find a Doctor for your Health Problem",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              )
            ],
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: controller.updateSearch,
            decoration: InputDecoration(
              hintText: "Explore services near you",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(height: 16),
          Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.filteredServices.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(controller.filteredServices[index]),
                onTap: () {
                  // Handle tap action
                  print('Selected: ${controller.filteredServices[index]}');
                  Get.back();
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
