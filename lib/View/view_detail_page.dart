// import 'package:canwinn_project/Constants/image_constants.dart';
// import 'package:canwinn_project/ViewModel/Controller/vendor_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import '../Constants/color_constants.dart';

// class HospitalDetailsScreen extends StatefulWidget {
//   dynamic venderId;
//   HospitalDetailsScreen({super.key, this.venderId});

//   @override
//   State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
// }

// class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
//   VendorsController vendorsController = Get.put(VendorsController());

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       vendorsController.getVendorById(8, context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backGroundColor,
//       appBar: AppBar(
//         backgroundColor: backGroundColor,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         title: const Text(
//           "Hospital Details",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Top image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 hospitalDetailImage,
//                 height: 150,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 5),

//             // Hospital Info Card
//             Card(
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "🏥 ABC Hospital",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Wrap(
//                       spacing: 8,
//                       children: [
//                         Text("📍 2.1 km"),
//                         Text("⭐ 4.4"),
//                         Text("🕒 Open 24×7"),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     const Wrap(
//                       spacing: 8,
//                       children: [
//                         Text("🏳️ Type: Private"),
//                         Text("🛏️ Beds: 15"),
//                         Text("💊 Pharmacy: Yes"),
//                       ],
//                     ),
//                     const SizedBox(height: 14),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               foregroundColor: Colors.black,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 side: BorderSide(color: Colors.grey.shade400),
//                               ),
//                             ),
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.directions,
//                               color: Colors.black,
//                             ),
//                             label: const Text("Get Direction"),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.purple,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             onPressed: () {},
//                             icon: const Icon(Icons.call, color: Colors.white),
//                             label: const Text(
//                               "Call Now",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 14),
//                     const Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Icon(Icons.location_on, color: Colors.black),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             "Address: Schotest, Ansal Corporate Plaza, Palam vihar, Gurgaon, Hariyana",
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),
//             const Text(
//               "Senior Doctors",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 8),

//             // Doctor List
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildDoctorTile("Dr. Jyoti", "Surgeon"),
//                 _buildDoctorTile("Dr. Shaym", "Surgeon"),
//                 _buildDoctorTile("Dr. Deepshikha", "Surgeon"),
//               ],
//             ),

//             const SizedBox(height: 20),
//             const Text(
//               "Image Gallery",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 8),

//             // Gallery
//             SizedBox(
//               height: 85,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 5,
//                 separatorBuilder: (_, __) => const SizedBox(width: 8),
//                 itemBuilder:
//                     (_, index) => ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Container(
//                         child: Image.asset(interiorImage),
//                         width: 100,
//                         color: Colors.white,
//                       ),
//                     ),
//               ),
//             ),

//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.circle, size: 8, color: Colors.purple),
//                 SizedBox(width: 4),
//                 Icon(Icons.circle_outlined, size: 8, color: Colors.grey),
//                 SizedBox(width: 4),
//                 Icon(Icons.circle_outlined, size: 8, color: Colors.grey),
//               ],
//             ),

//             const SizedBox(height: 20),
//             const Text(
//               "Reviews",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 10),

//             // Review Card
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(child: Image.asset(doctor)),
//                       const SizedBox(width: 10),
//                       const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Tejpal",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text("8 years ago"),
//                         ],
//                       ),
//                       const Spacer(),
//                       const Row(
//                         children: [
//                           Icon(Icons.star, size: 16, color: Colors.amber),
//                           Icon(Icons.star, size: 16, color: Colors.amber),
//                           Icon(Icons.star, size: 16, color: Colors.amber),
//                           Icon(Icons.star, size: 16, color: Colors.amber),
//                           Icon(Icons.star, size: 16, color: Colors.amber),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 // Emergency call logic
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 foregroundColor: Colors.white,
//                 minimumSize: const Size(double.infinity, 48),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               icon: const Icon(Icons.phone, color: Colors.white),
//               label: const Text(
//                 "Emergency Call 102",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDoctorTile(String name, String title) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundImage: AssetImage(profilePhoto),
//           backgroundColor: Colors.grey[300],
//         ),
//         const SizedBox(height: 6),
//         Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
//         Text(title, style: const TextStyle(fontSize: 12)),
//       ],
//     );
//   }
// }

import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/contact_functions.dart';
import 'package:canwinn_project/ViewModel/Controller/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/color_constants.dart';

class HospitalDetailsScreen extends StatefulWidget {
  final dynamic venderId;
 final dynamic lat;
  final dynamic lot;
  HospitalDetailsScreen({super.key, this.venderId, this.lat, this.lot});

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  final VendorsController vendorsController = Get.put(VendorsController());
  ContactFunctions contactFunctions = ContactFunctions();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vendorsController.getVendorById(widget.venderId ?? 8, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            "Hospital Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() {
          final data = vendorsController.singleVendor.value;

          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    hospitalDetailImage,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "🏥 ${data.vendorType.name}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Wrap(
                          spacing: 8,
                          children: [
                            Text("📍 2.1 km"),
                            Text("⭐ 4.4"),
                            Text("🕒 Open 24×7"),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          children: [
                            Text(
                              "🏳️ Type: ${data.services.isNotEmpty ? data.services[2].serviceType : 'N/A'}",
                            ),
                            Text("🛏️ Beds:${data.beds}"),
                            Text("💊 Pharmacy: ${data.isPharmacy}"),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  contactFunctions.openMapDirections(widget.lat, widget.lot );
                                },
                                icon: const Icon(
                                  Icons.directions,
                                  color: Colors.black,
                                ),
                                label: const Text("Get Direction"),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  if (data.contactInfo != null) {
                                    // launchUrl(Uri.parse('tel:${data.mobile}'));
                                  }
                                },
                                icon: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Call Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on, color: Colors.black),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Address: ${data.address ?? 'Schotest, Ansal Corporate Plaza, Palam vihar, Gurgaon, Hariyana'}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Senior Doctors",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),


                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.professionals.length,

                    itemBuilder: (context, index) {
                      final professionalData = data.professionals[index];

                      final imageUrl = 'https://canwinnconnect.canwinn.in${professionalData.profileImage}';

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildDoctorTile(
                          professionalData.name,
                          professionalData.specialty?.toString() ?? "Specialist",
                          imageUrl,
                        ),
                      );
                    },
                  ),
                ),


                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     _buildDoctorTile(data.professionals[0].name, "Surgeon",profilePhoto),
                //     _buildDoctorTile(data.professionals[0].name, "Surgeon", profilePhoto),
                //     _buildDoctorTile(data.professionals[0].name, "Surgeon",profilePhoto),
                //   ],
                // ),

                const SizedBox(height: 20),
                const Text(
                  "Image Gallery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),

                SizedBox(
                  height: 85,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder:
                        (_, index) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(interiorImage, width: 100),
                        ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Reviews",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),

                // Review Card
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(child: Image.asset(doctor)),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tejpal",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("8 years ago"),
                            ],
                          ),
                          const Spacer(),
                          const Row(
                            children: [
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              Icon(Icons.star, size: 16, color: Colors.amber),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              ContactFunctions().callNumber(102.toString());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.phone, color: Colors.white),
            label: const Text(
              "Emergency Call 102",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorTile(String name, String title, String imageUrl) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }




// Widget _buildDoctorTile(String name, String title,String image) {
  //   return Column(
  //     children: [
  //       CircleAvatar(
  //         radius: 30,
  //         backgroundImage: AssetImage(image),
  //         backgroundColor: Colors.grey[300],
  //       ),
  //       const SizedBox(height: 6),
  //       Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
  //       Text(title, style: const TextStyle(fontSize: 12)),
  //     ],
  //   );
  // }
}
