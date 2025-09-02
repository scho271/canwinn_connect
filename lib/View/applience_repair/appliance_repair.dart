// // import 'package:canwinn_project/Constants/color_constants.dart';
// // import 'package:canwinn_project/View/applience_repair/applience_repair_details.dart';
// // import 'package:canwinn_project/ViewModel/Controller/appliance_repair.dart';
// // import 'package:canwinn_project/ViewModel/Controller/get_categories_controller.dart';
// // import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
// // import 'package:canwinn_project/helper/storage_helper.dart';
// // import 'package:canwinn_project/res/api_url/app_api_url.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import '../../modules/get_subcategories.dart';
// //
// // class ApplianceRepair extends StatefulWidget {
// //   final dynamic categoryId;
// //   final dynamic categoryName;
// //
// //   const ApplianceRepair({super.key, this.categoryId, this.categoryName});
// //
// //   @override
// //   State<ApplianceRepair> createState() => _ApplianceRepairState();
// // }
// //
// // class _ApplianceRepairState extends State<ApplianceRepair> {
// //   final HospitalController controller = Get.put(HospitalController());
// //   final ApplianceController applianceController = Get.put(
// //     ApplianceController(),
// //   );
// //   final CategoriesController categoriesController = Get.put(
// //     CategoriesController(),
// //   );
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       categoriesController.fetchSubCategories(widget.categoryId);
// //      print("Useridhrex:---${StorageHelper.getUserId()}");
// //      print("Useridhjr:---${StorageHelper.getToken()}");
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Appliance Repair'),
// //         leading: IconButton(
// //           onPressed: () => Get.back(),
// //           icon: Icon(Icons.arrow_back_ios_rounded),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Obx(() => DropdownButtonFormField<String>(
// //                 value: controller.selectedLocation.value,
// //                 decoration: const InputDecoration(
// //                   border: InputBorder.none,
// //                   isDense: true,
// //                   contentPadding: EdgeInsets.zero,
// //                 ),
// //                 items: controller.locations.map((location) {
// //                       return DropdownMenuItem<String>(
// //                         value: location,
// //                         child: Text(location),
// //                       );
// //                     }).toList(),
// //                 onChanged: (value) {
// //                   if (value != null) {
// //                     controller.changeLocation(value);
// //                   }
// //
// //                 },
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             TextField(
// //               decoration: InputDecoration(
// //                 hintText: 'Explore services near you',
// //                 prefixIcon: Icon(Icons.search),
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.all(Radius.circular(12)),
// //                   borderSide: BorderSide.none,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             Container(
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.teal,
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: const [
// //                         Text(
// //                           "20% off",
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         Text(
// //                           "Today's Special!",
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         SizedBox(height: 4),
// //                         Text(
// //                           "Get discount for every service,\nonly valid for today",
// //                           style: TextStyle(color: Colors.white70, fontSize: 12),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Image.asset("assets/images/image.png", width: 70, height: 70),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Popular Services',
// //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
// //             ),
// //             const SizedBox(height: 10),
// //
// //             Obx(() => Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   DropdownButtonFormField<Data>(
// //                     decoration: InputDecoration(
// //                       fillColor: Colors.white,
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         borderSide: const BorderSide(
// //                           color: Colors.grey,
// //                           width: 1,
// //                         ),
// //                       ),
// //                     ),
// //                     value: applianceController.selectedService.value,
// //                     hint: const Text("Select Service"),
// //                     items: categoriesController.subcategoriesList.map((sub) {
// //                           return DropdownMenuItem<Data>(value: sub,
// //                             child: Text(sub.name),);
// //                         }).toList(),
// //                     onChanged: (value) {
// //                       categoriesController.getSubCategoriesData(value!.id);
// //                       print("Selected value: $value");
// //                       print("Selected ID: ${value.id}");
// //                       applianceController.selectService(value);
// //                                         },
// //
// //                   ),
// //
// //                   const SizedBox(height: 16),
// //                   applianceController.selectedService.value == null ? Center(
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           crossAxisAlignment: CrossAxisAlignment.center,
// //                           children: [
// //                             Image.asset(
// //                               'assets/images/services.png',
// //                               width: 220,
// //                               height: 220,
// //                             ),
// //                             const SizedBox(height: 8),
// //                             const Text(
// //                               'Pick a service first to view details and\nschedule.',
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(
// //                                 fontSize: 20,
// //                                 color: Colors.black,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ) : Obx(() {
// //                         if (categoriesController.isLoading.value) {
// //                           return Center(child: CircularProgressIndicator());
// //                         }
// //                         if (categoriesController.subcategoriesListData.isEmpty) {
// //                           return Center(child: Text("No data found"));
// //                         }
// //                         var data = categoriesController.subcategoriesListData;
// //                         return ListView.builder(
// //                           shrinkWrap: true,
// //                           physics: NeverScrollableScrollPhysics(),
// //                           itemCount: data.length,
// //                           itemBuilder: (context, index) {
// //                             var service = data[index];
// //                             return Container(
// //                               margin: const EdgeInsets.only(bottom: 12),
// //                               padding: const EdgeInsets.all(16),
// //                               decoration: BoxDecoration(
// //                                 color: Colors.white,
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     color: Colors.grey.withOpacity(0.3),
// //                                     spreadRadius: 2,
// //                                     blurRadius: 5,
// //                                     offset: Offset(0, 3),
// //                                   ),
// //                                 ],
// //                               ),
// //                               child:Column(
// //                                 children: [
// //                                   Row(
// //                                     children: [
// //                                       Container(
// //                                         height: 80,
// //                                         width: 80,
// //                                         decoration: BoxDecoration(
// //                                          borderRadius: BorderRadius.circular(10),
// //                                           color: Color(0xFFF3F3F3),
// //                                         ),
// //                                         child: ClipOval(
// //                                           child: CachedNetworkImage(
// //                                             imageUrl: (service.image != null && service.image!.isNotEmpty)
// //                                                 ? "${AppApiUrl.imagebaseUrl}${service.image}"
// //                                                 : "https://via.placeholder.com/150",
// //                                             fit: BoxFit.cover,
// //                                             placeholder: (context, url) => const Center(
// //                                               child: CircularProgressIndicator(strokeWidth: 2),
// //                                             ),
// //                                             errorWidget: (context, url, error) => const Icon(
// //                                               Icons.error,
// //                                               color: Colors.red,
// //                                               size: 40,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                       ),
// //
// //
// //                                       const SizedBox(width: 12),
// //                                       Expanded(
// //                                         child: Column(
// //                                           crossAxisAlignment: CrossAxisAlignment.start,
// //                                           children: [
// //                                             Text(
// //                                               service.name ?? "",
// //                                               style: const TextStyle(
// //                                                 fontSize: 16,
// //                                                 fontWeight: FontWeight.bold,
// //                                               ),
// //                                             ),
// //                                             const SizedBox(height: 8),
// //                                             Text(service.description ?? "", style: const TextStyle(color: Colors.black54,),),
// //                                             const SizedBox(height: 8),
// //                                             Text(service.basePrice ?? "",style: const TextStyle(
// //                                               fontSize: 16,
// //                                               fontWeight: FontWeight.bold,
// //                                             ),),
// //                                           ],
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   SizedBox(height: 10,),
// //                                   SizedBox(
// //                                       width: double.infinity,
// //                                       child: ElevatedButton(onPressed: (){
// //                                         Get.to(ApplienceRepairDetails());
// //                                       },
// //                                         style:ElevatedButton.styleFrom(
// //                                           backgroundColor: clockColor,
// //                                           shape: RoundedRectangleBorder(
// //                                             borderRadius: BorderRadius.circular(10)
// //                                           )
// //                                         ) , child: Text('book_now'.tr,style: TextStyle(color: white, fontWeight: FontWeight.bold
// //                                         ),
// //                                         ),))
// //                                 ],
// //                               )
// //
// //                             );
// //                           },
// //                         );
// //                       }),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/View/applience_repair/applience_repair_details.dart';
// import 'package:canwinn_project/ViewModel/Controller/appliance_repair.dart';
// import 'package:canwinn_project/ViewModel/Controller/get_categories_controller.dart';
// import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
// import 'package:canwinn_project/helper/storage_helper.dart';
// import 'package:canwinn_project/res/api_url/app_api_url.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import '../../modules/get_subcategories.dart';
//
// class ApplianceRepair extends StatefulWidget {
//   final dynamic categoryId;
//   final dynamic categoryName;
//
//   const ApplianceRepair({super.key, this.categoryId, this.categoryName});
//
//   @override
//   State<ApplianceRepair> createState() => _ApplianceRepairState();
// }
//
// class _ApplianceRepairState extends State<ApplianceRepair> {
//   final HospitalController controller = Get.put(HospitalController());
//   final ApplianceController applianceController = Get.put(ApplianceController());
//   final CategoriesController categoriesController = Get.put(CategoriesController());
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       if (categoriesController.subcategoriesList.isEmpty) {
//         await categoriesController.fetchSubCategories(widget.categoryId);
//       }
//       print("User ID: ${StorageHelper.getUserId()}");
//       print("Token: ${StorageHelper.getToken()}");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child:SingleChildScrollView(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Obx(() => DropdownButtonFormField<String>(
//               isExpanded: true,
//               value: controller.locations.contains(controller.selectedLocation.value)
//                   ? controller.selectedLocation.value
//                   : null,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 isDense: true,
//                 contentPadding: EdgeInsets.zero,
//               ),
//               items: controller.locations
//                   .map((location) => DropdownMenuItem<String>(
//                 value: location,
//                 child: Text(location),
//               ))
//                   .toList(),
//               onChanged: (value) {
//                 if (value != null) controller.changeLocation(value);
//               },
//             )),
//             const SizedBox(height: 16),
//
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Explore services near you',
//                 prefixIcon: const Icon(Icons.search),
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.teal,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "20% off",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "Today's Special!",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "Get discount for every service,\nonly valid for today",
//                           style: TextStyle(color: Colors.white70, fontSize: 12),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Image.asset("assets/images/image.png", width: 70, height: 70),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Popular Services',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//             ),
//             const SizedBox(height: 10),
//
//             /// Service Dropdown & List
//             Obx(() {
//               if (categoriesController.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   DropdownButtonFormField<Data>(
//                     isExpanded: true,
//                     itemHeight: null,
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.grey, width: 1),
//                       ),
//                     ),
//                     value: applianceController.selectedService.value != null &&
//                         categoriesController.subcategoriesList.contains(
//                             applianceController.selectedService.value)
//                         ? applianceController.selectedService.value
//                         : null,
//                     hint: const Text("Select Service"),
//                     items: categoriesController.subcategoriesList
//                         .map((sub) => DropdownMenuItem<Data>(
//                       value: sub,
//                       child: Text(sub.name),
//                     )).toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         categoriesController.getSubCategoriesData(value.id);
//                         applianceController.selectService(value);
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   applianceController.selectedService.value == null
//                       ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/services.png',
//                           width: 220,
//                           height: 220,
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Pick a service first to view details and\nschedule.',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                       : categoriesController.subcategoriesListData.isEmpty
//                       ? const Center(child: Text("No data found"))
//                       : ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: categoriesController.subcategoriesListData.length,
//                     itemBuilder: (context, index) {
//                       var service = categoriesController.subcategoriesListData[index];
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 12),
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 80,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: const Color(0xFFF3F3F3),
//                                   ),
//                                   child: ClipOval(
//                                     child: CachedNetworkImage(
//                                       imageUrl: (service.image?.isNotEmpty ?? false)
//                                           ? "${AppApiUrl.imagebaseUrl}${service.image}"
//                                           : "https://via.placeholder.com/150",
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) => const Center(
//                                           child: CircularProgressIndicator(strokeWidth: 2)),
//                                       errorWidget: (context, url, error) => const Icon(
//                                           Icons.error, color: Colors.red, size: 40),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(service.name ?? "No Name",
//                                           maxLines: 1, overflow: TextOverflow.ellipsis),
//                                       const SizedBox(height: 4),
//                                       Text(service.description ?? "No Description",
//                                           maxLines: 2, overflow: TextOverflow.ellipsis),
//                                       const SizedBox(height: 4),
//                                       Text(service.basePrice ?? "₹0",
//                                           style: const TextStyle(
//                                               fontSize: 16, fontWeight: FontWeight.bold)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Get.to(ApplienceRepairDetails());
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: primaryColor,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                 ),
//                                 child: Text('book_now'.tr,
//                                     style: TextStyle(color: white, fontWeight: FontWeight.bold)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
