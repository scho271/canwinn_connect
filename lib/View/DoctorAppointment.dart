// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/View/Ambulance_services.dart';
// import 'package:canwinn_project/View/Bed_availability.dart';
// import 'package:canwinn_project/View/DcotorInformation.dart';
// import 'package:canwinn_project/View/Emergency_Contacts.dart';
// import 'package:canwinn_project/View/Pharamacy_Screen.dart';
// import 'package:canwinn_project/View/widgets/CustomDoctorServiceCard.dart';
// import 'package:canwinn_project/View/widgets/DoctorBottomSheet.dart';
// import 'package:canwinn_project/View/widgets/searchbar.dart';
// import 'package:canwinn_project/ViewModel/Controller/fetch_service_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Constants/image_constants.dart';
//
// class DoctorAppointmentScreen extends StatefulWidget {
//   final dynamic categoryId;
//   final dynamic categoryName;
//   const DoctorAppointmentScreen({
//     Key? key,
//     this.categoryId,
//     this.categoryName,
//   }) : super(key: key);
//
//   @override
//   State<DoctorAppointmentScreen> createState() => _DoctorAppointmentScreenState();
// }
//
// class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
//   FetchServicesController fetchServicesController = Get.put(FetchServicesController());
//
//
//     @override
//   void initState() {
//     fetchServicesController.fetchServiceData(widget.categoryId.toString());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(onPressed: (){
//             Get.back();
//           }, icon:Icon(Icons.arrow_back_ios_rounded)),
//           title: Text("Doctor’s Appointment"),
//           backgroundColor: backGroundColor,
//           centerTitle: false,
//           elevation: 0,
//         ),
//         backgroundColor: backGroundColor,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomSearchBar(
//                   onChanged: (value) {
//                     print("Search: \$value");
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 SizedBox(height: 8),
//                 CustomDoctorServiceCard(
//                   imagePath: hospitalNearMe,
//                   title: 'Book Clinic Appointment',
//                   onTap: () {
//                     Get.to(DoctorsAppointmentPage());
//                   },
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Find a Doctor",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.bottomSheet(
//                           FindDoctorSheet(),
//                           isScrollControlled: true,
//                           backgroundColor: Colors.transparent,
//                         );
//                       },
//                       child: Text(
//                         "See All",
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12),
//                 SizedBox(
//                   height: 100,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       doctorCategoryBox(doctor, "General\nPhysician"),
//                       doctorCategoryBox(cute, "Skin &\nHair"),
//                       doctorCategoryBox(woman, "Women’s\nHealth"),
//                       doctorCategoryBox(floss, "Dental\nCare"),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 Text(
//                   "Featured Services",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 12),
//                 GridView.count(
//                   crossAxisCount: 2,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   childAspectRatio: 3 / 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                   children: [
//                     serviceTile(phone, "Emergency Contacts", () {
//                       Get.to(EmergencyContactsScreen());
//                     }),
//                     serviceTile(ambulance, "Ambulance Service", () {
//                       Get.to(AmbulanceServiceScreen());
//                     }),
//                     serviceTile(hospitalBed, "Bed Availability", () {
//                       Get.to(BedAvailabilityScreen());
//                     }),
//                     serviceTile(pharmacy, "24x7 Pharmacy", () {
//                       Get.to(PharmacyScreen());
//                     }),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget doctorCategoryBox(String imagePath, String label) {
//     return Container(
//       width: 80,
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(imagePath, height: 38),
//           SizedBox(height: 6),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget serviceTile(String icon, String label, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13),
//             ),
//             SizedBox(height: 20),
//             Image.asset(icon, height: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }



//
// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/View/Ambulance_services.dart';
// import 'package:canwinn_project/View/Bed_availability.dart';
// import 'package:canwinn_project/View/DcotorInformation.dart';
// import 'package:canwinn_project/View/Emergency_Contacts.dart';
// import 'package:canwinn_project/View/Pharamacy_Screen.dart';
// import 'package:canwinn_project/View/widgets/CustomDoctorServiceCard.dart';
// import 'package:canwinn_project/View/widgets/DoctorBottomSheet.dart';
// import 'package:canwinn_project/View/widgets/searchbar.dart';
// import 'package:canwinn_project/ViewModel/Controller/fetch_service_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Constants/image_constants.dart';
//
// class DoctorAppointmentScreen extends StatefulWidget {
//   final dynamic categoryId;
//   final dynamic categoryName;
//   const DoctorAppointmentScreen({
//     Key? key,
//     this.categoryId,
//     this.categoryName,
//   }) : super(key: key);
//
//   @override
//   State<DoctorAppointmentScreen> createState() => _DoctorAppointmentScreenState();
// }
//
// class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
//   FetchServicesController fetchServicesController = Get.put(FetchServicesController());
//
//
//   @override
//   void initState() {
//     fetchServicesController.fetchServiceData(widget.categoryId.toString());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  SingleChildScrollView(
//       padding: EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // CustomSearchBar(
//           //   onChanged: (value) {
//           //     print("Search: \$value");
//           //   },
//           // ),
//           // SizedBox(height: 16),
//           // SizedBox(height: 8),
//           CustomDoctorServiceCard(
//             imagePath: hospitalNearMe,
//             title: 'Book Clinic Appointment',
//             onTap: () {
//               Get.to(DoctorsAppointmentPage());
//             },
//           ),
//           SizedBox(height: 24),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Find a Doctor",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.bottomSheet(
//                     FindDoctorSheet(),
//                     isScrollControlled: true,
//                     backgroundColor: Colors.transparent,
//                   );
//                 },
//                 child: Text(
//                   "See All",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           SizedBox(
//             height: 100,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 doctorCategoryBox(doctor, "General\nPhysician"),
//                 doctorCategoryBox(cute, "Skin &\nHair"),
//                 doctorCategoryBox(woman, "Women’s\nHealth"),
//                 doctorCategoryBox(floss, "Dental\nCare"),
//               ],
//             ),
//           ),
//           SizedBox(height: 24),
//           Text(
//             "Featured Services",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           SizedBox(height: 12),
//           GridView.count(
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             childAspectRatio: 3 / 2.1,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             children: [
//               serviceTile(phone, "Emergency Contacts", () {
//                 Get.to(EmergencyContactsScreen());
//               }),
//               serviceTile(ambulance, "Ambulance Service", () {
//                 Get.to(AmbulanceServiceScreen());
//               }),
//               serviceTile(hospitalBed, "Bed Availability", () {
//                 Get.to(BedAvailabilityScreen());
//               }),
//               serviceTile(pharmacy, "24x7 Pharmacy", () {
//                 Get.to(PharmacyScreen());
//               }),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget doctorCategoryBox(String imagePath, String label) {
//     return Container(
//       width: 80,
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(imagePath, height: 38),
//           SizedBox(height: 6),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget serviceTile(String icon, String label, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13),
//             ),
//             SizedBox(height: 20),
//             Image.asset(icon, height: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }
