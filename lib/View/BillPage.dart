// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/Constants/image_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'Confirmation_Appointment.dart';
//
// class ConfirmClinicVisitScreen extends StatelessWidget {
//   const ConfirmClinicVisitScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backGroundColor,
//         appBar: AppBar(
//           backgroundColor: backGroundColor,
//           title: const Text("Book Appointment"),
//           leading:IconButton(onPressed: (){
//             Get.back();
//           }, icon:Icon(Icons.arrow_back_ios_rounded)),
//           actions: const [
//             Icon(Icons.settings_outlined),
//             SizedBox(width: 8),
//             Icon(Icons.share_outlined),
//             SizedBox(width: 12),
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Doctor Info
//               Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 30,
//                     backgroundImage: AssetImage(profilePhoto),
//                   ),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         "Dr. Aisha Sukhani (MBBS)",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text("Dermatologist", style: TextStyle(color: Colors.grey)),
//                       Text(
//                         "Highly Recommended for doctor friendliness",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//
//               // Appointment Time Card
//               const _InfoCard(
//                 icon: Icons.access_time,
//                 title: "Appointment time",
//                 subtitle: "Thu, 15 May 12:30 PM",
//               ),
//               const SizedBox(height: 10),
//
//               // Clinic Details Card
//               const _InfoCard(
//                 icon: Icons.local_hospital_outlined,
//                 title: "Clinic Details",
//                 subtitle:
//                 "Aryan Hospital, 78 Shiv Puri, Old Railway Road, Gurgaon, Railway Road",
//               ),
//               const SizedBox(height: 10),
//
//               // Coupon Section
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF5F4F8),
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 6,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFF5F4F8),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(Icons.percent, color: Colors.purple),
//                           const SizedBox(width: 10),
//                           const Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Apply Coupon",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   "Unlock offers with coupon codes",
//                                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               "Apply",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Bill Details",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     _billRow("Consultation Fee", "₹ 700", false),
//                     _billRow("Service Fee & Tax", "₹ 49", true),
//                     const Divider(),
//                     _billRow("Total Payable", "₹ 749", false, bold: true),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF5F4F8),
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 6,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     const CircleAvatar(
//                       backgroundColor: Colors.red,
//                       child: Text("P", style: TextStyle(color: Colors.white)),
//                     ),
//                     const SizedBox(width: 10),
//                     const Expanded(
//                       child: Text(
//                         "In-Clinic Appointment for\nPrachi Rajpurohit",
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text("CHANGE"),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         bottomNavigationBar: BottomAppBar(
//           elevation: 10,
//           color: backGroundColor,
//           child: Container(
//             height: 60,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 const Text(
//                   "₹ 749",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 ElevatedButton(
//                   onPressed: () {
//                     Get.to(AppointmentConfirmedScreen());
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                   ),
//                   child: const Text(
//                     "Confirm Clinic Visit",
//                     style: TextStyle(color: Colors.white),
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
//   static Widget _billRow(String label, String price, bool isFree, {bool bold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               label,
//               style: TextStyle(
//                 color: isFree ? Colors.grey : Colors.black,
//                 decoration: isFree ? TextDecoration.lineThrough : null,
//               ),
//             ),
//           ),
//           Text(
//             isFree ? "FREE" : price,
//             style: TextStyle(
//               color: isFree ? Colors.green : Colors.black,
//               fontWeight: bold ? FontWeight.bold : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _InfoCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//
//   const _InfoCard({
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF5F4F8),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.purple),
//           const SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: Text(subtitle, style: const TextStyle(fontSize: 12)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Confirmation_Appointment.dart';

class ConfirmClinicVisitScreen extends StatelessWidget {
  const ConfirmClinicVisitScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          title: const Text(
            "Book Appointment",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black54,
              size: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined, color: Colors.black54),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined, color: Colors.black54),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDoctorInfo(),
              const SizedBox(height: 24),
              _InfoCard(
                icon: Icons.access_time,
                title: "Appointment Time",
                subtitle: "Thu, 15 May 12:30 PM",
              ),
              const SizedBox(height: 16),

              // Clinic Details Card
              _InfoCard(
                icon: Icons.local_hospital_outlined,
                title: "Clinic Details",
                subtitle:
                "Aryan Hospital, 78 Shiv Puri, Old Railway Road, Gurgaon, Railway Road",
              ),
              const SizedBox(height: 16),
              _buildCouponAndBillSection(context),
              const SizedBox(height: 16),
              _buildPatientInfoCard(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: const AssetImage(profilePhoto),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Dr. Aisha Sukhani (MBBS)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Dermatologist",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Highly Recommended for doctor friendliness",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponAndBillSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coupon Section
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.percent, color: Colors.purple, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Apply Coupon",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Unlock offers with coupon codes",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Bill Details
          const Text(
            "Bill Details",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _billRow("Consultation Fee", "₹ 700", false),
          _billRow("Service Fee & Tax", "₹ 49", true),
          const Divider(height: 24, thickness: 1),
          _billRow("Total Payable", "₹ 749", false, bold: true),
        ],
      ),
    );
  }

  Widget _buildPatientInfoCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red.shade400,
            child: const Text(
              "P",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "In-Clinic Appointment for\nPrachi Rajpurohit",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "CHANGE",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      color: Colors.white,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Text(
              "₹ 749",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to( AppointmentConfirmedScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                elevation: 2,
              ),
              child: const Text(
                "Confirm Clinic Visit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _billRow(String label, String price, bool isFree, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isFree ? Colors.grey.shade500 : Colors.black87,
                decoration: isFree ? TextDecoration.lineThrough : null,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
          Text(
            isFree ? "FREE" : price,
            style: TextStyle(
              fontSize: 14,
              color: isFree ? Colors.green.shade600 : Colors.black87,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.purple, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}