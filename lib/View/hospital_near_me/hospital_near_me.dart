//
//
//
// import 'package:canwinn_project/View/hospital_near_me/hospital_details.dart';
// import 'package:canwinn_project/View/widgets/contact_functions.dart';
// import 'package:canwinn_project/ViewModel/Controller/fetch_service_controller.dart';
// import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
// import 'package:canwinn_project/data/locations_handler/locations_handers.dart';
// import 'package:canwinn_project/res/api_url/app_api_url.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Constants/color_constants.dart';
//
// class HospitalNearMe extends StatefulWidget {
//   final dynamic categoryId;
//   final dynamic categoryName;
//
//   HospitalNearMe({super.key, this.categoryId, this.categoryName});
//
//   @override
//   State<HospitalNearMe> createState() => _HospitalNearMeState();
// }
//
// class _HospitalNearMeState extends State<HospitalNearMe> {
//   final HospitalController controller = Get.put(HospitalController());
//
//   FetchServicesController fetchServicesController = Get.put(FetchServicesController());
//   @override
//   void initState() {
//     super.initState();
//     fetchServicesController.fetchServiceData(widget.categoryId.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
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
//               )
//             ],
//           ),
//           child: ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: redColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 16),
//             ),
//             onPressed: () {
//               ContactFunctions().callNumber("102");
//             },
//             icon: const Icon(Icons.call, color: Colors.white),
//             label: Text("emergency_call".tr,
//                 style: const TextStyle(fontSize: 18, color: Colors.white)),
//           ),
//         ),
//
//         body: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () => Get.back(),
//                     icon: const Icon(Icons.arrow_back_ios, size: 20),
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("${widget.categoryName}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                         Obx(() => DropdownButtonFormField<String>(
//                           value: controller.selectedLocation.value,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             isDense: true,
//                             contentPadding: EdgeInsets.zero,
//                           ),
//                           items: controller.locations.map((location) {
//                             return DropdownMenuItem<String>(
//                               value: location,
//                               child: Text(location),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.changeLocation(value);
//                             }
//                           },
//                         )),
//                       ],
//                     ),
//                   ),
//                   const Icon(Icons.notifications, color: Colors.black54),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(Icons.search_rounded),
//                   hintText: 'search_hospital'.tr,
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 16),
//               Text('filters'.tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               const SizedBox(height: 8),
//               Obx(() => SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: controller.filters.map((filter) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8),
//                       child: ChoiceChip(
//                         label: Text(filter),
//                         selected: controller.selectedFilter.value == filter,
//                         onSelected: (val) {
//                           controller.changeFilter(filter);
//                         },
//                         selectedColor: clockColor.withOpacity(0.2),
//                         labelStyle: TextStyle(
//                           color: controller.selectedFilter.value == filter
//                               ? clockColor
//                               : Colors.black,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               )),
//
//               const SizedBox(height: 16),
//               Expanded(
//                 child:Obx(() {
//                   if(fetchServicesController.isLoading.value){
//                     return Center(child: CircularProgressIndicator());
//                   }else if(fetchServicesController.servicesList.isEmpty){
//                     return Center(child: Text("No Data Found"),);
//                   }else{
//                     return ListView.builder(
//                       itemCount: fetchServicesController.servicesList.length,
//                       itemBuilder: (context, index) {
//                         final vendor = fetchServicesController.servicesList[index];
//                         return Card(
//                           margin: const EdgeInsets.only(bottom: 12),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                           elevation: 3,
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(12),
//                             onTap: () => Get.to(() => const HospitalDetails()),
//                             child: Row(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(12),
//                                     bottomLeft: Radius.circular(12),
//                                   ),
//                                   child: Image.network(
//                                     "${AppApiUrl.imagebaseUrl}/${vendor.businessImage}",
//                                     height: 110,
//                                     width: 120,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Container(
//                                         height: 110,
//                                         width: 120,
//                                         color: Colors.grey.shade200,
//                                         child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
//                                       );
//                                     },
//                                     loadingBuilder: (context, child, loadingProgress) {
//                                       if (loadingProgress == null) return child;
//                                       return Container(
//                                         height: 110,
//                                         width: 120,
//                                         alignment: Alignment.center,
//                                         child: const CircularProgressIndicator(strokeWidth: 2),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 12, vertical: 8),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                          Text("${vendor.businessName}",
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 16)),
//                                         const SizedBox(height: 4),
//                                         Row(
//                                           children: List.generate(
//                                             5, (i) => Icon(i < 4 ? Icons.star : Icons.star_border, color: Colors.orange, size: 18,
//                                           ),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         FutureBuilder<String>(
//                                           future: LocationHandler.calculateDistance(vendor.latitude, vendor.longitude),
//                                           builder: (context, snapshot) {
//                                             if (snapshot.connectionState == ConnectionState.waiting) {
//                                               return Text("Calculating distance...",
//                                                   style: TextStyle(fontSize: 13, color: Colors.grey));
//                                             }
//                                             if (snapshot.hasError || !snapshot.hasData) {
//                                               return Text("Distance not available",
//                                                   style: TextStyle(fontSize: 13, color: Colors.red));
//                                             }
//                                             return Text(
//                                               "${snapshot.data} | 4.4 ⭐ Open 24×7",
//                                               style: TextStyle(fontSize: 13),
//                                             );
//                                           },
//                                         ),
//                                         const SizedBox(height: 8),
//                                         Row(
//                                           children: [
//                                             InkWell(
//                                               onTap:(){
//                                                 ContactFunctions().openMapDirections(vendor.latitude!.toDouble(),vendor.longitude!.toDouble());
//                                               },
//                                               child: Container(
//                                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   border: Border.all(color: boldTextColor.withOpacity(0.4), width: 1),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.black12,
//                                                       blurRadius: 3,
//                                                       offset: Offset(0, 2),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(Icons.location_on, color: boldTextColor, size: 20),
//                                                     const SizedBox(width: 6),
//                                                     Text(
//                                                       "Directions",
//                                                       style: TextStyle(
//                                                         fontSize: 14,
//                                                         fontWeight: FontWeight.w500,
//                                                         color: boldTextColor,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//
//                                             const SizedBox(width: 12),
//                                             InkWell(
//                                               onTap:(){
//                                                 ContactFunctions().callNumber(vendor.contactInfo.toString());
//                                               },
//                                               child: Container(
//                                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                                 decoration: BoxDecoration(
//                                                   color: clockColor,
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.black26,
//                                                       blurRadius: 3,
//                                                       offset: Offset(0, 2),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 child: Row(
//                                                   children: const [
//                                                     Icon(Icons.call, color: Colors.white, size: 20),
//                                                     SizedBox(width: 6),
//                                                     Text(
//                                                       "Call",
//                                                       style: TextStyle(
//                                                         fontSize: 14,
//                                                         fontWeight: FontWeight.w500,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//






import 'package:canwinn_project/View/hospital_near_me/hospital_details.dart';
import 'package:canwinn_project/View/widgets/contact_functions.dart';
import 'package:canwinn_project/ViewModel/Controller/fetch_service_controller.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
import 'package:canwinn_project/data/locations_handler/locations_handers.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/color_constants.dart';

class HospitalNearMeWidget extends StatefulWidget {
  final dynamic categoryId;
  final dynamic categoryName;

  const HospitalNearMeWidget({super.key, this.categoryId, this.categoryName});

  @override
  State<HospitalNearMeWidget> createState() => _HospitalNearMeWidgetState();
}

class _HospitalNearMeWidgetState extends State<HospitalNearMeWidget> {
  final HospitalController controller = Get.put(HospitalController());
  final FetchServicesController fetchServicesController = Get.put(FetchServicesController());

  @override
  void initState() {
    super.initState();
    fetchServicesController.fetchServiceData(widget.categoryId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3F3F7),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            // Filters
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'filters'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: controller.filters.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      backgroundColor: Color(0xFFFFFFFF),
                      label: Text(filter),
                      selected: controller.selectedFilter.value == filter,
                      onSelected: (val) {
                        controller.changeFilter(filter);
                      },
                      selectedColor: Colors.grey.withOpacity(0.2),
                      labelStyle: TextStyle(
                        color: controller.selectedFilter.value == filter ? Colors.grey : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
            const SizedBox(height: 16),

            Obx(() {
              if (fetchServicesController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (fetchServicesController.servicesList.isEmpty) {
                return const Center(child: Text("No Data Found"));
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: fetchServicesController.servicesList.length,
                  itemBuilder: (context, index) {
                    final vendor = fetchServicesController.servicesList[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Get.to(() => const HospitalDetails()),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              child: Image.network(
                                AppApiUrl.imagebaseUrl + vendor.businessImage.toString(),
                                height: 110,
                                width: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 110,
                                    width: 120,
                                    color: Colors.grey.shade200,
                                    child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    height: 110,
                                    width: 120,
                                    alignment: Alignment.center,
                                    child: const CircularProgressIndicator(strokeWidth: 2),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${vendor.businessName}",
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: List.generate(
                                        5, (i) => Icon(
                                          i < 4 ? Icons.star : Icons.star_border,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    FutureBuilder<String>(
                                      future: LocationHandler.calculateDistance(
                                          vendor.latitude, vendor.longitude),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Text("Calculating...");
                                        } else if (snapshot.hasError) {
                                          return const Text("Error");
                                        } else {
                                          return Text(snapshot.data ?? "0.0 Km");
                                        }
                                      },
                                    ),

                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            ContactFunctions().openMapDirections(vendor.latitude!.toDouble(), vendor.longitude!.toDouble());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: boldTextColor.withOpacity(0.4), width: 1),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(Icons.location_on, color: boldTextColor, size: 20),
                                                const SizedBox(width: 6),
                                                Text(
                                                  "Directions",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: boldTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        InkWell(
                                          onTap: () {
                                            ContactFunctions().callNumber(vendor.contactInfo.toString());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: const Row(
                                              children: [
                                                Icon(Icons.call, color: Colors.white, size: 20),
                                                SizedBox(width: 6),
                                                Text(
                                                  "Call",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
            // Container(
            //   padding: const EdgeInsets.all(12),
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black12,
            //         blurRadius: 5,
            //         offset: Offset(0, -2),
            //       ),
            //     ],
            //   ),
            //   child: ElevatedButton.icon(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: redColor,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       padding: const EdgeInsets.symmetric(vertical: 16),
            //     ),
            //     onPressed: () {
            //       ContactFunctions().callNumber("102");
            //     },
            //     icon: const Icon(Icons.call, color: Colors.white),
            //     label: Text(
            //       "emergency_call".tr,
            //       style: const TextStyle(fontSize: 18, color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}