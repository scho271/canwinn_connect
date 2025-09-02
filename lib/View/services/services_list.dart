
// import 'package:canwinn_project/res/api_url/app_api_url.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../ViewModel/Controller/get_services_controller.dart';
// import 'service_details.dart';
//
// class ServiceListScreen extends StatefulWidget {
//
//   ServiceListScreen({super.key});
//
//   @override
//   State<ServiceListScreen> createState() => _ServiceListScreenState();
// }
//
// class _ServiceListScreenState extends State<ServiceListScreen> {
//   final GetServicesController controller = Get.put(GetServicesController());
//
//
//   @override
//   void initState() {
//     controller.fetchBookServiceList();
//     print("BookingList:---${controller.bookingList.length}");
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Service History",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         leading: InkWell(
//           onTap: () => Get.back(),
//           child: const Icon(Icons.arrow_back_ios, color: Colors.black),
//         ),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (controller.serviceList.isEmpty) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/service_his.png'),
//               Text("No Services yet.",style: TextStyle(fontWeight: FontWeight.bold),),
//               Text('Looks like you haven’t experienced\n quality services at home')
//             ],
//           );
//         }
//
//         return ListView.builder(
//           padding: const EdgeInsets.all(12),
//           itemCount: controller.serviceList.length,
//           itemBuilder: (context, index) {
//             final data = controller.serviceList[index];
//             final double basePrice = double.tryParse(data.basePrice) ?? 0;
//             final double gst = double.tryParse(data.gstPercentage) ?? 0;
//             final double total = basePrice + (basePrice * gst / 100);
//
//             return InkWell(
//               onTap: () => Get.to(() => ServicesDetails(service: data)),
//               child: Container(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade200,
//                       blurRadius: 5,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: data.image != null
//                           ? Image.network(
//                            AppApiUrl.imagebaseUrl +  data.image!,
//                         height: 120,
//                         width: 120,
//                         fit: BoxFit.cover,
//                       ) : Container(
//                         height: 120,
//                         width: 120,
//                         color: const Color(0xFF009CA9),
//                         child: Image.asset('assets/images/service_history.png'),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 8),
//                           Text(
//                             data.name,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 6),
//                           Row(
//                             children: [
//                               const Icon(Icons.access_time, size: 16, color: Colors.purple),
//                               const SizedBox(width: 4),
//                               Text("${data.durationMinutes ?? 'N/A'} min",
//                                   style: const TextStyle(fontSize: 13)),
//                             ],
//                           ),
//                           const SizedBox(height: 6),
//                           Row(
//                             children: [
//                               const Icon(Icons.currency_rupee, size: 16, color: Colors.green),
//                               const SizedBox(width: 4),
//                               Expanded(child: Text("$total | Gst ${data.gstPercentage}%")),
//                             ],
//                           ),
//                           const SizedBox(height: 6),
//                           Row(
//                             children: [
//                               const Icon(Icons.calendar_today, size: 16, color: Colors.red),
//                               const SizedBox(width: 4),
//                               Text(data.createdAt.split(" ").first,
//                                   style: const TextStyle(fontSize: 13)),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Align(
//                             alignment: Alignment.bottomRight,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                               decoration: BoxDecoration(
//                                 color: data.isActive
//                                     ? Colors.blue.shade400
//                                     : Colors.green.shade400,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 data.isActive ? "In Process" : "Completed",
//                                 style: const TextStyle(color: Colors.white, fontSize: 12),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//
//
//           },
//         );
//       }),
//     );
//   }
// }
//




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../ViewModel/Controller/get_services_controller.dart';

class ServiceListScreen extends StatefulWidget {
  ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  final GetServicesController controller = Get.put(GetServicesController());
  final List<bool> _expanded = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchBookServiceList();
    });
  }

  String formatTime(String time) {
    try {
      final parsedTime = DateFormat("HH:mm:ss").parse(time);
      return DateFormat("hh:mm a").format(parsedTime);
    } catch (e) {
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Service History",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      // body: Obx(() {
      //   if (controller.isLoading.value) {
      //     return const Center(child: CircularProgressIndicator());
      //   }
      //
      //   if (controller.bookingList.isEmpty) {
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Image.asset('assets/images/service_his.png'),
      //         const SizedBox(height: 12),
      //         const Text(
      //           "No Services yet.",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      //         ),
      //         const SizedBox(height: 4),
      //         const Text(
      //           'Looks like you haven’t experienced\nquality services at home',
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     );
      //   }
      //
      //
      //   return ListView.builder(
      //     padding: const EdgeInsets.all(12),
      //     itemCount: controller.bookingList.length,
      //     itemBuilder: (context, index) {
      //       final data = controller.bookingList[index];
      //       final double basePrice = double.tryParse(data.basePrice) ?? 0;
      //       final double gst = double.tryParse(data.gstPercentage) ?? 0;
      //       final double total = basePrice + (basePrice * gst / 100);
      //
      //       return Container(
      //         margin: const EdgeInsets.only(bottom: 16),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(16),
      //           color: Colors.white,
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.shade300,
      //               blurRadius: 8,
      //               offset: const Offset(0, 4),
      //             ),
      //           ],
      //         ),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(16),
      //           child: Theme(
      //             data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      //             child: ExpansionTile(
      //               tilePadding: const EdgeInsets.all(0),
      //               backgroundColor: Colors.white,
      //               collapsedBackgroundColor: Colors.white,
      //               initiallyExpanded: _expanded[index],
      //               onExpansionChanged: (val) {
      //                 setState(() {
      //                   _expanded[index] = val;
      //                 });
      //               },
      //               childrenPadding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      //               leading: null,
      //               title: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   // Left: Image
      //                   Container(
      //                     height: 120,
      //                     width: 80,
      //                     decoration: BoxDecoration(
      //                       color: const Color(0xFF009CA9),
      //                       borderRadius: BorderRadius.circular(12),
      //                     ),
      //                     child: Image.asset(
      //                       'assets/images/service_history.png',
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                   const SizedBox(width: 12),
      //                   // Right: Text content
      //                   Expanded(
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           data.service.name,
      //                           style: const TextStyle(
      //                               fontWeight: FontWeight.bold, fontSize: 16),
      //                           overflow: TextOverflow.ellipsis,
      //                         ),
      //                         const SizedBox(height: 6),
      //                         Text(
      //                           "₹$total | GST ${data.gstPercentage}%",
      //                           style: const TextStyle(
      //                               fontWeight: FontWeight.w500, fontSize: 14),
      //                         ),
      //                         const SizedBox(height: 6),
      //                         Row(
      //                           children: [
      //                             const Text(
      //                               "Booking Status: ",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.w500, fontSize: 14),
      //                             ),
      //                             Container(
      //                               padding: const EdgeInsets.symmetric(
      //                                   horizontal: 10, vertical: 5),
      //                               decoration: BoxDecoration(
      //                                 color: data.status == "pending"
      //                                     ? Colors.orange.shade400
      //                                     : Colors.green.shade400,
      //                                 borderRadius: BorderRadius.circular(20),
      //                               ),
      //                               child: Text(
      //                                 data.status.capitalizeFirst.toString(),
      //                                 style: const TextStyle(
      //                                     color: Colors.white,
      //                                     fontWeight: FontWeight.bold),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               children: [
      //                 infoRow(Icons.calendar_today, "Booking Date",
      //                     data.createdAt.split(" ").first),
      //                 infoRow(Icons.access_time, "Start Time",
      //                     formatTime(data.startTime)),
      //                 infoRow(Icons.access_time, "End Time", formatTime(data.endTime)),
      //                 infoRow(Icons.money, "Base Price", "₹${data.basePrice}"),
      //                 infoRow(Icons.money, "GST Amount", "₹${data.gstAmount}"),
      //                 infoRow(Icons.discount, "Discount", "₹${data.membershipDiscount}"),
      //                 infoRow(Icons.payment, "Final Price", "₹${data.finalPrice}"),
      //                 infoRow(Icons.account_balance_wallet, "Payment Status",
      //                     data.paymentStatus.capitalizeFirst.toString()),
      //               ],
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //   );
      // }),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.bookingList.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/service_his.png'),
              const SizedBox(height: 12),
              const Text(
                "No Services yet.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              const Text(
                'Looks like you haven’t experienced\nquality services at home',
                textAlign: TextAlign.center,
              ),
            ],
          );
        }

        // 👉 yaha ensure karo ki expanded list same length ki ho
        if (_expanded.length != controller.bookingList.length) {
          _expanded.clear();
          _expanded.addAll(List.filled(controller.bookingList.length, false));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.bookingList.length,
          itemBuilder: (context, index) {
            final data = controller.bookingList[index];
            final double basePrice = double.tryParse(data.basePrice) ?? 0;
            final double gst = double.tryParse(data.gstPercentage) ?? 0;
            final double total = basePrice + (basePrice * gst / 100);

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.all(0),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    initiallyExpanded: _expanded[index],
                    onExpansionChanged: (val) {
                      setState(() {
                        _expanded[index] = val;
                      });
                    },
                    childrenPadding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left: Image
                        Container(
                          height: 120,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF009CA9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/images/service_history.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Right: Text content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.service.name ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "₹$total | GST ${data.gstPercentage ?? '0'}%",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Text(
                                    "Booking Status: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: data.status == "pending"
                                          ? Colors.orange.shade400
                                          : Colors.green.shade400,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      data.status.capitalizeFirst ?? "",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    children: [
                      infoRow(Icons.calendar_today, "Booking Date",
                          data.createdAt.split(" ").first ?? ""),
                      infoRow(Icons.access_time, "Start Time",
                          formatTime(data.startTime)),
                      infoRow(Icons.access_time, "End Time",
                          formatTime(data.endTime ?? "")),
                      infoRow(Icons.money, "Base Price", "₹${data.basePrice}"),
                      infoRow(Icons.money, "GST Amount", "₹${data.gstAmount ?? '0'}"),
                      infoRow(Icons.discount, "Discount",
                          "₹${data.membershipDiscount ?? '0'}"),
                      infoRow(Icons.payment, "Final Price",
                          "₹${data.finalPrice ?? '0'}"),
                      infoRow(Icons.account_balance_wallet, "Payment Status",
                          data.paymentStatus.capitalizeFirst ?? ""),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),


    );
  }

  Widget infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.w500)),
          Expanded(
              child:
              Text(value, style: const TextStyle(fontWeight: FontWeight.w400))),
        ],
      ),
    );
  }
}
