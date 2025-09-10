// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/Constants/image_constants.dart';
// import 'package:canwinn_project/View/widgets/contact_functions.dart'
//     show ContactFunctions;
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HospitalDetailsController extends GetxController {
//   var expandedIndex = (-1).obs;
// }
//
// class HospitalDetails extends StatelessWidget {
//   const HospitalDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HospitalDetailsController());
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xffF3F3F7),
//         bottomNavigationBar: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 5,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: redColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 14),
//             ),
//             onPressed: () {
//               ContactFunctions().callNumber("102");
//             },
//             icon: const Icon(Icons.call, color: Colors.white),
//             label: Text(
//               "emergency_call".tr,
//               style: const TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(
//                   leading: InkWell(
//                     onTap: () => Get.back(),
//                     child: const Icon(Icons.arrow_back_ios),
//                   ),
//                   title: Text(
//                     'hospital_Details'.tr,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   height: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage(nearHospitalImage),
//                       fit: BoxFit.cover,
//                       filterQuality: FilterQuality.high,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Card(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'ABC Hospital',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const Text('2.1 km | 4.4'),
//                           const Text('Type : Private | Beds : 15'),
//                           const Text('Pharmacy : Yes | Open 24×7'),
//                           Row(
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   ContactFunctions().openMapDirections(
//                                     28.4684,
//                                     77.0251,
//                                   );
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   backgroundColor: white,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       'directions'.tr,
//                                       style: TextStyle(color: boldTextColor),
//                                     ),
//                                      Icon(
//                                       Icons.location_on,
//                                       color: boldTextColor,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(width: 10),
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   ContactFunctions().callNumber("102");
//                                 },
//                                 label: Text(
//                                   'Call Now',
//                                   style: TextStyle(color: white),
//                                 ),
//                                 icon: Icon(Icons.call, color: white),
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   backgroundColor: primaryColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Divider(thickness: 1),
//                           Row(
//                             children: const [
//                               Icon(Icons.location_on),
//                               Expanded(
//                                 child: Text(
//                                   'Address : Schotest, Ansal Corporate Plaza, Palam vihar, Gurgaon, Haryana ',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 7),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: Text(
//                     'senior_doctors'.tr,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: boldTextColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 140,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     padding: const EdgeInsets.all(8),
//                     itemCount: 6,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Column(
//                           children: const [
//                             CircleAvatar(
//                               radius: 35,
//                               backgroundImage:
//                               AssetImage("assets/images/dr_image.jpg"),
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               'Dr. Jyoti\nSurgeon',
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 TextButton.icon(
//                   onPressed: () {},
//                   icon: Icon(Icons.art_track, color: textColor),
//                   label: Text(
//                     'Image Gallery',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: textColor,
//                     ),
//                   ),
//                 ),
//                 CarouselSlider(
//                   options: CarouselOptions(
//                     height: 120,
//                     autoPlay: true,
//                     autoPlayInterval: const Duration(seconds: 3),
//                     enlargeCenterPage: false,
//                     viewportFraction: 0.34,
//                   ),
//                   items: List.generate(5, (index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 1),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 3,
//                           )
//                         ],
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(
//                           bedImage,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5, top: 10),
//                   child: Text(
//                     'reviews'.tr,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: boldTextColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 220,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     padding: const EdgeInsets.all(8),
//                     children: [
//                       reviewCard(controller, 0,
//                           "Great hospital service! Doctors are very professional and staff is helpful.", '8:25 Pm'),
//                       reviewCard(controller, 1,
//                           "Best experience ever! The doctors listened carefully and gave the best treatment. The staff was polite and supportive. Highly recommended to everyone.", '8:25 Pm'),
//                       reviewCard(controller, 2,
//                           "Clean hospital with modern facilities. Nurses are cooperative. I had a smooth treatment process here.", '8:25 Pm'),
//                       reviewCard(controller, 3,
//                           "Affordable and reliable healthcare service with experienced doctors. Totally satisfied with the experience. Will come again if needed.", '8:25 Pm'),
//                       reviewCard(controller, 4,
//                           "Doctors are highly skilled, but waiting time was a bit long. Overall, satisfied with the treatment.", '8:25 Pm'),
//                       reviewCard(controller, 5,
//                           "One of the best hospitals in the city with excellent emergency care facilities.", '8:25 Pm'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget reviewCard(
//       HospitalDetailsController controller,
//       int index,
//       String text,
//       String time,
//       ) {
//     return Obx(() {
//       final isExpanded = controller.expandedIndex.value == index;
//       return Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: Container(
//           width: 220,
//           decoration: BoxDecoration(
//             color: white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           backgroundImage:
//                           AssetImage("assets/images/dr_image.jpg"),
//                           radius: 20,
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           "User",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: boldTextColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       time,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   children: List.generate(5, (starIndex) {
//                     return Icon(
//                       Icons.star,
//                       size: 16,
//                       color: starIndex < 4 ? Colors.amber : Colors.grey,
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 8),
//                 Expanded(
//                   child: isExpanded
//                       ? SingleChildScrollView(
//                     child: Text(
//                       text,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   )
//                       : Text(
//                     text,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.black87,
//                     ),
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       controller.expandedIndex.value =
//                       isExpanded ? -1 : index;
//                     },
//                     child: Text(
//                       isExpanded ? "Less" : "More",
//                       style: const TextStyle(fontSize: 12, color: Colors.blue),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }




import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/contact_functions.dart'
    show ContactFunctions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalDetailsController extends GetxController {
  var expandedIndex = (-1).obs;
}

class HospitalDetails extends StatelessWidget {
  const HospitalDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HospitalDetailsController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F8FA),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: redColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Softer corners
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              elevation: 3, // Subtle elevation
            ),
            onPressed: () => ContactFunctions().callNumber("102"),
            icon: const Icon(Icons.call, size: 22, color: Colors.white),
            label: Text(
              "emergency_call".tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
                      padding: const EdgeInsets.all(0),
                    ),
                    Expanded(
                      child: Text(
                        'hospital_Details'.tr,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Hospital Banner Image
                Container(
                  height: 150, // 🔹 छोटा height ताकि कटे नहीं और proportion अच्छा रहे
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(nearHospitalImage),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

// Hospital Details Card
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ABC Hospital',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_pin, size: 18, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              '2.1 km | 4.4 ★',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Type: Private | Beds: 15',
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Pharmacy: Yes | Open 24×7',
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Equal Width Buttons Row
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => ContactFunctions().openMapDirections(28.4684, 77.0251),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: boldTextColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(color: boldTextColor),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'directions'.tr,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: boldTextColor,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Icon(Icons.location_on, size: 18, color: boldTextColor),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => ContactFunctions().callNumber("102"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                icon: const Icon(Icons.call, size: 18, color: Colors.white),
                                label: Text(
                                  'Call Now',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(thickness: 1, height: 24),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 18, color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Address: Schotest, Ansal Corporate Plaza, Palam Vihar, Gurgaon, Haryana',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Text(
                  'senior_doctors'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: boldTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40, // Slightly larger avatar
                              backgroundImage: const AssetImage("assets/images/dr_image.jpg"),
                              backgroundColor: Colors.grey.shade200, // Fallback color
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Dr. Jyoti\nSurgeon',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Image Gallery Section
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.art_track, size: 20, color: boldTextColor),
                  label: Text(
                    'Image Gallery',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: boldTextColor,
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 140, // Slightly taller carousel
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true, // Highlight center image
                    viewportFraction: 0.35,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  ),
                  items: List.generate(5, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          bedImage,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                // Reviews Section
                Text(
                  'reviews'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: boldTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: [
                      reviewCard(
                        controller,
                        0,
                        "Great hospital service! Doctors are very professional and staff is helpful.",
                        '8:25 PM',
                      ),
                      reviewCard(
                        controller,
                        1,
                        "Best experience ever! The doctors listened carefully and gave the best treatment.",
                        '8:25 PM',
                      ),
                      reviewCard(
                        controller,
                        2,
                        "Clean hospital with modern facilities. Nurses are cooperative.",
                        '8:25 PM',
                      ),
                      reviewCard(
                        controller,
                        3,
                        "Affordable and reliable healthcare service with experienced doctors.",
                        '8:25 PM',
                      ),
                      reviewCard(
                        controller,
                        4,
                        "Doctors are highly skilled, but waiting time was a bit long.",
                        '8:25 PM',
                      ),
                      reviewCard(
                        controller,
                        5,
                        "One of the best hospitals in the city with excellent emergency care facilities.",
                        '8:25 PM',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reviewCard(
      HospitalDetailsController controller,
      int index,
      String text,
      String time,
      ) {
    return Obx(() {
      final isExpanded = controller.expandedIndex.value == index;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage("assets/images/dr_image.jpg"),
                          radius: 22,
                          backgroundColor: Colors.grey.shade200,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "User",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: boldTextColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      Icons.star,
                      size: 16,
                      color: starIndex < 4 ? Colors.amber : Colors.grey.shade400,
                    );
                  }),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.4, // Improved line spacing
                    ),
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded ? null : TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      controller.expandedIndex.value = isExpanded ? -1 : index;
                    },
                    child: Text(
                      isExpanded ? "Less" : "More",
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}