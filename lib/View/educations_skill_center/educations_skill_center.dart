// import 'package:flutter/material.dart';
//
// class EducationSkillCenterScreen extends StatelessWidget {
//   const EducationSkillCenterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: Icon(Icons.arrow_back, color: Colors.black),
//         title: const Text(
//           "Education Skill Center",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Bar
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const TextField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   icon: Icon(Icons.search, color: Colors.grey),
//                   hintText: "Explore services near you",
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
//                   const Icon(Icons.person, size: 60, color: Colors.white),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Service Cards
//             _buildServiceCard(
//               "Tech Titans Academy",
//               "123 Innovation Drive, Tech City",
//               "https://cdn-icons-png.flaticon.com/512/681/681494.png",
//             ),
//             _buildServiceCard(
//               "Artistic Minds Studio",
//               "789 Executive Blvd, Business District",
//               "https://cdn-icons-png.flaticon.com/512/3595/3595458.png",
//             ),
//             _buildServiceCard(
//               "Business Leaders Institute",
//               "789 Executive Blvd, Business District",
//               "https://cdn-icons-png.flaticon.com/512/1046/1046784.png",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildServiceCard(String title, String address, String imageUrl) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 6,
//             offset: Offset(0, 2),
//           )
//         ],
//       ),
//       child: Row(
//         children: [
//           // Text Info
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 4),
//                 Text(address,
//                     style: const TextStyle(color: Colors.grey, fontSize: 12)),
//                 const SizedBox(height: 8),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   ),
//                   icon: const Icon(Icons.call, size: 16, color: Colors.white),
//                   label: const Text("Call",
//                       style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           // Image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               imageUrl,
//               width: 70,
//               height: 70,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationSkillCenterScreen extends StatelessWidget {
  const EducationSkillCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black)),
        title: const Text(
          "Education Skill Center",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Explore services near you',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "20% off",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Today's Special!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Get discount for every service,\nonly valid for today",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/image.png",
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Service Cards
            _buildServiceCard(
              "Tech Titans Academy",
              "123 Innovation Drive, Tech City",
              "assets/images/image.png",
            ),
            _buildServiceCard(
              "Artistic Minds Studio",
              "789 Executive Blvd, Business District",
              "assets/images/image.png",
            ),
            _buildServiceCard(
              "Business Leaders Institute",
              "789 Executive Blvd, Business District",
              "assets/images/image.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String address, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          // Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(address,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),

                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Call",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10,),
                      const Icon(Icons.call, size: 16, color: Colors.white),
                    ],
                  )
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
