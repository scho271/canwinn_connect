// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/modules/get_hospital_details.dart' hide Professional;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../modules/get_services_details_modules.dart';
//
// class AppointmentConfirmedScreen extends StatelessWidget {
//   final List<Professional>? professionals;
//   AppointmentConfirmedScreen({Key? key, this.professionals}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backGroundColor,
//         appBar: AppBar(
//           backgroundColor: backGroundColor,
//           title: const Text("Appointment Confirmed ✅"),
//           leading:IconButton(onPressed: (){
//             Get.back();
//           }, icon:Icon(Icons.arrow_back_ios_rounded)),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 16.0),
//               child: Icon(Icons.help_outline),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Appointment Card
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey[100],
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 6,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Row(
//                         children: [
//                           Icon(Icons.access_time, color: Colors.deepPurple),
//                           SizedBox(width: 8),
//                           Text(
//                             "Appointment time",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       // const SizedBox(height: 8),
//                       //
//                       // // Display availabilities list here:
//                       // professionals != null && professionals!.isNotEmpty && professionals![0].availabilities.isNotEmpty
//                       //     ? Column(
//                       //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //   children: professionals![0].availabilities.map<Widget>((availability) {
//                       //     return Text(
//                       //       "${formatDateTime(availability.startTime.toString())} to ${formatDateTime(availability.endTime.toString())}",
//                       //       style: const TextStyle(
//                       //         fontSize: 16,
//                       //         fontWeight: FontWeight.bold,
//                       //       ),
//                       //     );
//                       //   }).toList(),
//                       // )
//                       //     : const Text(
//                       //   "No availabilities",
//                       //   style: TextStyle(
//                       //     fontSize: 16,
//                       //     fontWeight: FontWeight.bold,
//                       //   ),
//                       // ),
//
//                       const SizedBox(height: 8),
//                       const Text(
//                         "Dr. Vishal Aryan\nBooked for - Prachi Rajpurohit",
//                       ),
//                       const SizedBox(height: 4),
//                       const Text(
//                         "Appointment ID: 1213877463846",
//                         style: TextStyle(color: Colors.green),
//                       ),
//                       Divider(
//                         thickness: 2,
//                       ),
//                       const SizedBox(height: 8),
//                       const Text("Aryan Hospital"),
//                       const Text(
//                         "78, Shiv Puri, Old Railway Road, Gurgaon, Haryana 122932",
//                       ),
//                       const SizedBox(height: 16),
//                       ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: otpBorderColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           minimumSize: const Size(double.infinity, 48),
//                         ),
//                         onPressed: () {
//                           // Call clinic action
//                         },
//                         icon: const Icon(Icons.call, color: Colors.white),
//                         label: const Text(
//                           "Call Clinic",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Need Help ?",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//
//                 const SizedBox(height: 10),
//                 const Text(
//                   "In case you cannot make it for the appointment, please cancel or reschedule the appointment, preferably 2 hours before the scheduled time.",
//                 ),
//
//                 const SizedBox(height: 16),
//                 _buildHelpTile("Reschedule", Icons.calendar_today, () {
//                   // Navigate to Reschedule screen
//                   Get.to(() => const PlaceholderWidget("Reschedule Screen"));
//                 }),
//                 const SizedBox(height: 14),
//                 _buildHelpTile("Cancel", Icons.cancel_outlined, () {
//                   Get.to(() => const PlaceholderWidget("Cancel Appointment"));
//                 }),
//                 const SizedBox(height: 14),
//                 _buildHelpTile(
//                   "Need help with other issues",
//                   Icons.help_outline,
//                       () {
//                     Get.to(() => const PlaceholderWidget("Support"));
//                   },
//                 ),
//                 const SizedBox(height: 10),
//
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey[100],
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 6,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: const [
//                       CircleAvatar(
//                         radius: 20,
//                         backgroundColor: Colors.red,
//                         child: Text("P", style: TextStyle(color: Colors.white)),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           "In-Clinic Appointment for\nPrachi Rajpurohit",
//                         ),
//                       ),
//                       Text(
//                         "₹ 700",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
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
//   Widget _buildHelpTile(String title, IconData icon, VoidCallback onTap) {
//     return Row(
//       children: [
//         Icon(icon),
//         const SizedBox(width: 10),
//         Text(title),
//         const Spacer(),
//         InkWell(
//           onTap: onTap,
//           child: const Icon(Icons.navigate_next_outlined),
//         ),
//       ],
//     );
//   }
//
//   // Helper function to format datetime strings
//   String formatDateTime(String dateTimeStr) {
//     try {
//       DateTime dt = DateTime.parse(dateTimeStr);
//       // Format to HH:mm (24-hour) format, you can customize as needed
//       return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
//     } catch (e) {
//       return dateTimeStr; // fallback to raw string if parsing fails
//     }
//   }
// }
//
// // Temporary placeholder screen
// class PlaceholderWidget extends StatelessWidget {
//   final String title;
//   const PlaceholderWidget(this.title, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(child: Text(title)),
//     );
//   }
// }




import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentConfirmedScreen extends StatelessWidget {
  const AppointmentConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Appointment Confirmed",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.help_outline, color: Colors.black),
            ),
          ],
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: _cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.person, color: Colors.white, size: 30),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Dr. Vishal Aryan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Booked for - Prachi Rajpurohit",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const Divider(height: 24),

                    // ✅ Date & Time
                    Row(
                      children: const [
                        Icon(Icons.calendar_today, color: Colors.purple),
                        SizedBox(width: 8),
                        Text(
                          "Saturday, 14 September 2025",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.access_time, color: Colors.purple),
                        SizedBox(width: 8),
                        Text(
                          "4:00 PM - 5:00 PM",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    const Text(
                      "Appointment ID: 1213877463846",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🏥 Hospital Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: _cardDecoration(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.local_hospital,
                        color: Colors.redAccent, size: 30),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Aryan Hospital",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          SizedBox(height: 4),
                          Text(
                            "78, Shiv Puri, Old Railway Road, Gurgaon, Haryana 122932",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 📞 Call Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: otpBorderColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                icon: const Icon(Icons.call, color: Colors.white),
                label: const Text("Call Clinic",
                    style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 24),

              // 📌 Help Section
              const Text(
                "Need Help?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "In case you cannot make it for the appointment, please cancel or reschedule the appointment, preferably 2 hours before the scheduled time.",
              ),

              const SizedBox(height: 16),
              _helpTile("Reschedule", Icons.calendar_today, () {
                Get.to(() => const PlaceholderWidget("Reschedule Screen"));
              }),
              _helpTile("Cancel Appointment", Icons.cancel_outlined, () {
                Get.to(() => const PlaceholderWidget("Cancel Appointment"));
              }),
              _helpTile("Need help with other issues", Icons.help_outline, () {
                Get.to(() => const PlaceholderWidget("Support"));
              }),

              const SizedBox(height: 24),

              // 💳 Payment Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: _cardDecoration(),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "In-Clinic Appointment for\nPrachi Rajpurohit",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Text(
                      "₹ 700",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Card Decoration
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  // 🔹 Help Tile Widget
  Widget _helpTile(String title, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple),
        title: Text(title, style: const TextStyle(fontSize: 14)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String title;
  const PlaceholderWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
