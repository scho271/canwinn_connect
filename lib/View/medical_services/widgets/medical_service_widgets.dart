import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/medical_services/medical_services_details/medical_services_details.dart';
import 'package:canwinn_project/ViewModel/Controller/category_filter_controller.dart' show DashboardController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalServiceWidgets extends StatefulWidget {
  const MedicalServiceWidgets({super.key});

  @override
  State<MedicalServiceWidgets> createState() => _MedicalServiceWidgetsState();
}

class _MedicalServiceWidgetsState extends State<MedicalServiceWidgets> {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'popular_services'.tr,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, fontFamily: 'Raleway'),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Service ${index + 1}'),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        bloodTest,
                        height: 50,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'trending_offers'.tr,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, fontFamily: 'Raleway'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 170,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            medicalImage,
                            height: 110,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "Pharmacy Discount",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "20% OFF",
                      style: TextStyle(color: Color(0xff4F9696)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Nearby Medical Services',
          style: TextStyle(
              fontSize: 17, fontFamily: 'Raleway', fontWeight: FontWeight.w700),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFF7FCFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    medicalService,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'Medical Service ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Available now'),
                trailing: ElevatedButton(
                  onPressed: () {
                    Get.to(MedicalServicesDetails());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8F2F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "book_now".tr,
                    style: const TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
