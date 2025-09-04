import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/searchbar.dart' show CustomSearchBar;
import 'package:canwinn_project/ViewModel/Controller/category_filter_controller.dart' show DashboardController;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'medical_services_details/medical_services_details.dart';

class MedicalServices extends StatefulWidget {
  const MedicalServices({super.key});

  @override
  State<MedicalServices> createState() => _MedicalServicesState();
}

class _MedicalServicesState extends State<MedicalServices> {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CANWINN CONNECT",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Obx(() => DropdownButtonFormField<String>(
                          value: controller
                              .hospitalController.selectedLocation.value,
                          decoration: const InputDecoration(
                              border: InputBorder.none, isDense: true),
                          items: controller.hospitalController.locations
                              .map((location) {
                            return DropdownMenuItem(
                                value: location, child: Text(location));
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              controller.hospitalController
                                  .changeLocation(value);
                            }
                          },
                        )),
                      ],
                    ),
                  ),
                   CircleAvatar(
                      child:
                      Icon(Icons.notifications, color: primaryColor)),
                ],
              ),

              SizedBox(height: 12.sp),
              CustomSearchBar(
                  onChanged: (value) => debugPrint("Search: $value")),
              SizedBox(height: 7),
              Text(
                'popular_services'.tr,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Raleway'),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 100,
                        margin:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: EdgeInsets.all(10),
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
                                child: Image.asset(bloodTest,height: 50,))
                          ],
                        ));
                  },
                ),
              ),
              SizedBox(height: 15),
              Text(
                'trending_offers'.tr,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Raleway'),
              ),
              SizedBox(height: 10),
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
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                offset: Offset(0, 3),
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
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            "Pharmacy Discount",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
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

              SizedBox(height: 15),
              Text('Nearby Medical Services',style: TextStyle(fontSize: 17,fontFamily: 'Raleway',fontWeight: FontWeight.w700),),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7FCFC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Available now'),
                     trailing: ElevatedButton(onPressed: (){
                       Get.to(MedicalServicesDetails());
                     },
                     style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE8F2F2),shape: RoundedRectangleBorder(
                       borderRadius:BorderRadius.circular(10)
                     )), child: Text("book_now".tr,style: TextStyle(fontFamily: 'Lexend',fontSize: 14,),),),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
