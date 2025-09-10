// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/View/BillPage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../Constants/image_constants.dart';
//
// class DoctorProfileScreen extends StatelessWidget {
//   const DoctorProfileScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backGroundColor,
//         appBar: AppBar(
//           backgroundColor: backGroundColor,
//           title: const Text('Dr. Aisha Sukhani (MBBS)'),
//           leading:IconButton(onPressed: (){
//             Get.back();
//           }, icon:Icon(Icons.arrow_back_ios_rounded)),
//           actions: const [
//             Icon(Icons.share),
//             SizedBox(width: 12),
//             Icon(Icons.bookmark_border),
//             SizedBox(width: 12),
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Doctor Info
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage(profilePhoto), // Add image
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Dr. Aisha Sukhani (MBBS)',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           'Dermatologist',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         const Row(
//                           children: [
//                             Icon(Icons.star, color: Colors.amber, size: 18),
//                             SizedBox(width: 4),
//                             Text('4.5'),
//                           ],
//                         ),
//                         const SizedBox(height: 4),
//                         const Text('Railway Road, Aryan Hospital'),
//                         const SizedBox(height: 4),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Experience ',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               TextSpan(
//                                 text: '15 years   ',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               TextSpan(
//                                 text: 'Consultation ',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               TextSpan(
//                                 text: '1000/-',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 24),
//
//               // Time Slots
//               const Row(
//                 children: [
//                   Icon(Icons.access_time, color: Colors.purple),
//                   SizedBox(width: 10),
//                   Text(
//                     "Time Slot",
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text("Today 20 slots", style: TextStyle(fontSize: 12)),
//                   Text("14 May 20 slots", style: TextStyle(fontSize: 12)),
//                   Text("14 May 20 slots", style: TextStyle(fontSize: 12)),
//                   Text("14 May 20 slots", style: TextStyle(fontSize: 12)),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Wrap(
//                 spacing: 10,
//                 runSpacing: 10,
//                 children: List.generate(
//                   6,
//                   (index) => GestureDetector(
//                     onTap: () {
//                       print("Tapped slot $index");
//                     },
//                     child: Container(
//                       width: 60,
//                       height: 20,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: otpBorderColor,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: const Text(
//                         "06:00 PM",
//                         style: TextStyle(fontSize: 11, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//
//               // Reviews Section
//               const Row(
//                 children: [
//                   Icon(Icons.reviews, color: Colors.amber),
//                   SizedBox(width: 8),
//                   Text(
//                     "Reviews",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               _buildReview("Tejpal", "8 years ago"),
//               const SizedBox(height: 12),
//               _buildReview("Tejpal", "8 years ago"),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           elevation: 8,
//           color: backGroundColor,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           child: Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Get.to(ConfirmClinicVisitScreen());
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: otpBorderColor,
//
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     "Book Clinic Visit",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: otpBorderColor,
//
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     "Call Clinic",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReview(String name, String timeAgo) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(child: Text(name[0])),
//               const SizedBox(width: 10),
//               Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//               const Spacer(),
//               Text(timeAgo, style: const TextStyle(color: Colors.grey)),
//               const SizedBox(width: 4),
//               const Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.amber, size: 16),
//                   Icon(Icons.star, color: Colors.amber, size: 16),
//                   Icon(Icons.star, color: Colors.amber, size: 16),
//                   Icon(Icons.star, color: Colors.amber, size: 16),
//                   Icon(Icons.star, color: Colors.amber, size: 16),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
//             "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
//             style: TextStyle(fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/image_constants.dart';
import 'BillPage.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9FB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Doctor Profile',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          ),
          actions: const [
            Icon(Icons.share, color: Colors.black),
            SizedBox(width: 12),
            Icon(Icons.bookmark_border, color: Colors.black),
            SizedBox(width: 12),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(profilePhoto),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dr. Aisha Sukhani',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'MBBS • Dermatologist',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              const Text("4.5 (200 reviews)"),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Aryan Hospital, Railway Road",
                            style: TextStyle(fontSize: 13),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Icon(Icons.work_outline,
                                  size: 16, color: Colors.purple),
                              SizedBox(width: 4),
                              Text("15 years exp"),
                              SizedBox(width: 12),
                              Icon(Icons.currency_rupee,
                                  size: 16, color: Colors.green),
                              SizedBox(width: 2),
                              Text("1000"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.purple),
                  SizedBox(width: 8),
                  Text(
                    "Available Slots",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _DateChip(label: "Today • 20 slots"),
                    _DateChip(label: "Tomorrow • 18 slots"),
                    _DateChip(label: "12 Sept • 22 slots"),
                    _DateChip(label: "13 Sept • 15 slots"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(8, (index) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color:textColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "06:00 PM",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),
              const Row(
                children: [
                  Icon(Icons.reviews, color: Colors.amber),
                  SizedBox(width: 8),
                  Text(
                    "Patient Reviews",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildReview("Tejpal", "8 months ago"),
              const SizedBox(height: 12),
              _buildReview("Meena", "1 year ago"),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(ConfirmClinicVisitScreen()),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    "Book Clinic Visit",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.purple.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Call Clinic",
                    style: TextStyle(color: Colors.purple, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildReview(String name, String timeAgo) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(child: Text(name[0])),
              const SizedBox(width: 10),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(timeAgo, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star_half, color: Colors.amber, size: 16),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Doctor was very polite and explained everything clearly. "
                "Clinic was clean and staff was supportive.",
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final String label;
  const _DateChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:Colors.black),
      ),
      child: Text(
        label,
        style:  TextStyle(color: textColor, fontSize: 14,
        fontWeight: FontWeight.bold),
      ),
    );
  }
}
