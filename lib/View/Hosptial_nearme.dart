// import 'package:canwinn_project/Constants/font_constants.dart';
// import 'package:canwinn_project/View/view_detail_page.dart';
// import 'package:canwinn_project/View/widgets/contact_functions.dart';
// import 'package:canwinn_project/ViewModel/Controller/vendor_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Constants/color_constants.dart';
//
// class HospitalListScreen extends StatefulWidget {
//   final dynamic vendor_id;
//   const HospitalListScreen({Key? key, this.vendor_id}) : super(key: key);
//
//   @override
//   State<HospitalListScreen> createState() => _HospitalListScreenState();
// }
//
// class _HospitalListScreenState extends State<HospitalListScreen> {
//   VendorsController vendorsController = Get.put(VendorsController());
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       vendorsController.getVendorTypeData(widget.vendor_id.toString());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backGroundColor,
//         appBar: AppBar(
//           backgroundColor: backGroundColor,
//           elevation: 0,
//           leading: BackButton(color: Colors.black),
//           title: Text(
//             "Hospitals near me",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           centerTitle: false,
//         ),
//         body: Column(
//           children: [
//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search hospital name or speciality...",
//                   prefixIcon: Icon(Icons.search),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.symmetric(vertical: 12),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//
//             Expanded(
//               child: Obx(() {
//                 if (vendorsController.isLoading.value) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (vendorsController.vendorData.isEmpty) {
//                   return Center(child: Text("No hospitals found."));
//                 } else {
//                   return ListView.builder(
//                     padding: EdgeInsets.symmetric(horizontal: 12),
//                     itemCount: vendorsController.vendorData.length,
//                     itemBuilder: (context, index) {
//                       final vendor = vendorsController.vendorData[index];
//                       return Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 2,
//                         margin: EdgeInsets.only(bottom: 12),
//                         child: Padding(
//                           padding: const EdgeInsets.all(14.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "🏥 ${vendor.businessName}",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               Wrap(
//                                 spacing: 8,
//                                 children: [
//                                   Text("📍 ${vendor.address ?? 'N/A'}"),
//                                   Text("⭐ 4.4"),
//                                   Text("🕒 Open 24×7"),
//                                 ],
//                               ),
//                               SizedBox(height: 6),
//                               Wrap(
//                                 spacing: 8,
//                                 children: [
//                                   Text(
//                                     "🏳️ Type: ${vendor.bussinessType ?? 'N/A'}",
//                                   ),
//                                   Text("🛏️ Beds: ${vendor.beds ?? 'N/A'}"),
//                                   Text(
//                                     "💊 Pharmacy: ${vendor.isPharmacy ?? 'N/A'}",
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 14),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: ElevatedButton.icon(
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: secondaryColor,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                       ),
//                                       onPressed: () {
//                                         Get.to(
//                                           HospitalDetailsScreen(
//                                             venderId: vendor.id ,
//                                             lat: vendor.latitude ,
//                                             lot: vendor.longitude,
//                                           ),
//                                         );
//                                       },
//                                       icon: Icon(
//                                         Icons.info_outline,
//                                         color: Colors.white,
//                                       ),
//                                       label: Text(
//                                         "View Details",
//                                         style: mostly,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Expanded(
//                                     child: ElevatedButton.icon(
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: primaryColor,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                       ),
//                                       onPressed: () {
//                                         // Phone call logic
//                                       },
//                                       icon: Icon(
//                                         Icons.call,
//                                         color: Colors.white,
//                                       ),
//                                       label: Text("Call Now", style: mostly),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               }),
//             ),
//
//             // Hospital Card
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             //   child: Card(
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(12),
//             //     ),
//             //     elevation: 2,
//             //     child: Padding(
//             //       padding: const EdgeInsets.all(14.0),
//             //       child: Column(
//             //         crossAxisAlignment: CrossAxisAlignment.start,
//             //         children: [
//             //           Text(
//             //             "🏥 ABC Hospital",
//             //             style: TextStyle(
//             //               fontWeight: FontWeight.bold,
//             //               fontSize: 16,
//             //             ),
//             //           ),
//             //           SizedBox(height: 8),
//             //           Wrap(
//             //             spacing: 8,
//             //             runSpacing: 4,
//             //             children: [
//             //               Text("📍 2.1 km"),
//             //               Text("⭐ 4.4"),
//             //               Text("🕒 Open 24×7"),
//             //             ],
//             //           ),
//             //           SizedBox(height: 6),
//             //           Wrap(
//             //             spacing: 8,
//             //             runSpacing: 4,
//             //             children: [
//             //               Text("🏳️ Type: Private"),
//             //               Text("🛏️ Beds: 15"),
//             //               Text("💊 Pharmacy: Yes"),
//             //             ],
//             //           ),
//             //           SizedBox(height: 14),
//             //           Row(
//             //             children: [
//             //               Expanded(
//             //                 child: ElevatedButton.icon(
//             //                   style: ElevatedButton.styleFrom(
//             //                     backgroundColor: secondaryColor,
//             //                     shape: RoundedRectangleBorder(
//             //                       borderRadius: BorderRadius.circular(8),
//             //                     ),
//             //                   ),
//             //                   onPressed: () {
//             //                     Get.to(HospitalDetailsScreen());
//             //                   },
//             //                   icon: Icon(
//             //                     Icons.info_outline,
//             //                     color: Colors.white,
//             //                   ),
//             //                   label: Text("View Details", style: mostly),
//             //                 ),
//             //               ),
//             //               SizedBox(width: 12),
//             //               Expanded(
//             //                 child: ElevatedButton.icon(
//             //                   style: ElevatedButton.styleFrom(
//             //                     backgroundColor: primaryColor,
//             //                     shape: RoundedRectangleBorder(
//             //                       borderRadius: BorderRadius.circular(8),
//             //                     ),
//             //                   ),
//             //                   onPressed: () {
//             //                     // TODO: Call logic
//             //                   },
//             //                   icon: Icon(Icons.call, color: Colors.white),
//             //                   label: Text("Call Now", style: mostly),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//         bottomNavigationBar: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Emergency Call Button
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   ContactFunctions().callNumber(102.toString());
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(double.infinity, 48),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 icon: Icon(Icons.phone, color: Colors.white),
//                 label: Text(
//                   "Emergency Call 102",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             // Custom Bottom Navigation Bar
//           ],
//         ),
//       ),
//     );
//   }
// }
