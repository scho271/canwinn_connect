// import 'package:canwinn_project/Constants/image_constants.dart';
// import 'package:canwinn_project/View/Doctor_profile_screen.dart';
// import 'package:canwinn_project/View/widgets/DoctorprofileCrad.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DoctorsAppointmentPage extends StatelessWidget {
//   const DoctorsAppointmentPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF9F9FB),
//         appBar: AppBar(
//           title: const Text("Doctor’s Appointment"),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_rounded),
//             onPressed: () => Get.back(),
//           ),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF1F1F5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: "Explore services near you",
//                     icon: Icon(Icons.search),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     DoctorProfileCard(
//                       name: "Dr. Aisha Sukhani",
//                       qualification: "MBBS",
//                       specialization: "Dermatologist",
//                       rating: 4.5,
//                       location: "Railway Road, Aryan Hospital",
//                       experience: 15,
//                       consultationFee: 1000,
//                       date: "Saturday, January, 2025",
//                       time: "4.00 pm - 10.00 pm",
//                       image: profilePhoto,
//                     ),
//                     DoctorProfileCard(
//                       name: "Dr. Aisha Sukhani",
//                       qualification: "MBBS",
//                       specialization: "Dermatologist",
//                       rating: 4.5,
//                       location: "Railway Road, Aryan Hospital",
//                       experience: 15,
//                       consultationFee: 1000,
//                       date: "Saturday, January, 2025",
//                       time: "4.00 pm - 10.00 pm",
//                       image: profilePhoto,
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 4,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 28,
//                                 backgroundImage: AssetImage(profilePhoto),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       "Dr. Aisha Sukhani (MBBS)",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text("Dermatologist"),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 8,
//                                   vertical: 4,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.amber.shade100,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: const Row(
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.amber,
//                                       size: 16,
//                                     ),
//                                     SizedBox(width: 4),
//                                     Text("4.5"),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFF3F1FD),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: const [
//                                 Column(
//                                   children: [
//                                     Text(
//                                       "15 years",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text("Experience"),
//                                   ],
//                                 ),
//                                 VerticalDivider(
//                                   thickness: 1,
//                                   color: Colors.grey,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text(
//                                       "1000/-",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text("Consultation Fee"),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton.icon(
//                               onPressed: () {
//                                 Get.to(DoctorProfileScreen());
//                               },
//                               label: const Text(
//                                 "Book Appointment",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.purple,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               icon: Icon(
//                                 Icons.arrow_forward,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/Doctor_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsAppointmentPage extends StatelessWidget {
  const DoctorsAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFF9F9FB),
          appBar: AppBar(
            title: const Text(
              "Doctor’s Appointment",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                // 🔎 Search Box
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search doctors, clinics...",
                      icon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                const TabBar(
                  labelColor: Colors.deepPurple,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.deepPurple,
                  tabs: [
                    Tab(
                      text: "Clinic Appointment",
                      icon: Icon(Icons.medical_services_outlined),
                    ),
                    Tab(
                      text: "Online Consultation",
                      icon: Icon(Icons.video_call_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // ✅ TabBarView Expanded में wrap
                Expanded(
                  child: TabBarView(
                    children: [
                      // First Tab (Clinic Appointment List)
                      ListView(
                        children: [
                          buildDoctorCard(
                            name: "Dr. Aisha Sukhani",
                            qualification: "MBBS",
                            specialization: "Dermatologist",
                            rating: 4.5,
                            location: "Railway Road, Aryan Hospital",
                            experience: 15,
                            consultationFee: 1000,
                            date: "Saturday, January, 2025",
                            time: "4.00 pm - 10.00 pm",
                            image: profilePhoto,
                          ),
                          buildDoctorCard(
                            name: "Dr. Rohan Mehta",
                            qualification: "MD",
                            specialization: "Cardiologist",
                            rating: 4.8,
                            location: "City Heart Clinic",
                            experience: 12,
                            consultationFee: 1200,
                            date: "Sunday, February, 2025",
                            time: "10.00 am - 2.00 pm",
                            image: profilePhoto,
                          ),
                        ],
                      ),
                      const Center(
                        child: Text(
                          "Online Consultation Coming Soon...",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
}

Widget buildDoctorCard({
  required String name,
  required String qualification,
  required String specialization,
  required double rating,
  required String location,
  required int experience,
  required int consultationFee,
  required String date,
  required String time,
  required String image,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name ($qualification)",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    specialization,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.redAccent),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star,
                      color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "$experience yrs",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Text("Experience",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            Container(height: 24, width: 1, color: Colors.grey.shade300),
            Column(
              children: [
                Text(
                  "₹$consultationFee",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Text("Consultation",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(const DoctorProfileScreen());
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ).copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.deepPurpleAccent],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Book Appointment",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
