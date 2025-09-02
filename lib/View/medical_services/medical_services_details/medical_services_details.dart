import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/medical_services/medical_services_details/medical_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

class MedicalServicesDetails extends StatefulWidget {
  const MedicalServicesDetails({super.key});

  @override
  State<MedicalServicesDetails> createState() => _MedicalServicesDetailsState();
}

class _MedicalServicesDetailsState extends State<MedicalServicesDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    medicalDetails,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 180,
                  ),
                  Positioned(
                    top: 140,
                    left: 10,
                    right: 10,
                    child: Card(
                      elevation: 10,
                      color: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "RK Clinic",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Schotest F-259 Ansal Corporate Plaza....',
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                                Icon(Icons.directions),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border_purple500_sharp,
                                  color: Colors.yellow,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '4.76 (11.1 M bookings)',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 250),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Text('lab_test'.tr,style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.bold, ),),
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Foam jet services',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  child:  Text(
                                    "Save 7%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text('Defects infections & anemia '),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 5),
                                Text('4.76 (11.1 M bookings)'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  Text(
                                    "₹ 3000",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "3000",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      Get.to(MedicalServiceCart());
                                    },
                                    child: Container(
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFFE4E4E4)
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,

                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text("Add"),
                                        ),
                                      ),

                                    ),
                                  ),
                                  SizedBox(width: 8),



                                ],
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  );
                },)

            ],
          ),
        ),

      ),
    );
  }
}
