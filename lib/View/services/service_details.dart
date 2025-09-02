import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/ViewModel/Controller/get_services_controller.dart';
import 'package:canwinn_project/modules/get_services_modules.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../res/api_url/app_api_url.dart';
import '../widgets/service_details_widgets/service_detatils.dart';

class ServicesDetails extends StatefulWidget {
  final ServiceModel service;

  const ServicesDetails({super.key, required this.service });

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  final GetServicesController controller = Get.put(GetServicesController());
  String? selectedDate;
  Map<String, dynamic>? selectedSlot;
  double additionalFee = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.fetchServiceDetails(widget.service.id);
    });
  }

  double calculateTotalPrice(double basePrice, double gst, double serviceFee) {
    final gstAmount = basePrice * gst / 100;
    return basePrice + gstAmount + serviceFee;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:  Text(widget.service.name),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.serviceDetail.value == null) {
            return const Center(child: Text("No details available"));
          }
          final data = controller.serviceDetail.value!;
          final double basePrice =
              double.tryParse(data.basePrice.toString()) ?? 0.0;
          final double gst =
              double.tryParse(data.gstPercentage.toString()) ?? 0.0;
          final double total = calculateTotalPrice(
            basePrice,
            gst,
            additionalFee,
          );
          return ListView(
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 70,
                    width: 70,
                    color: const Color(0xFF009CA9),
                    child:
                        (data.image?.isNotEmpty ?? false)
                            ? Image.network(
                              data.image!,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => Image.asset(
                                    'assets/images/service_history.png',
                                  ),
                            )
                            : Image.asset('assets/images/service_history.png'),
                  ),
                ),
                title: Text(
                  data.serviceType,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(data.description ?? ""),
              ),
              const SizedBox(height: 10),
              ServiceDetails().buildInfoCard(
                rows: [
                  ServiceDetails().buildRow(
                    "Durations",
                    data.durationMinutes?.toString() ?? "N/A",
                  ),
                  ServiceDetails().buildRow(
                    "Requires Professional",
                    data.requiresProfessional.toString() ?? "N/A",
                  ),
                  ServiceDetails().buildRow(
                    "Created At",
                    DateFormat('dd-MM-yyyy').format(data.createdAt),
                  ),
                  ServiceDetails().buildRow(
                    "Updated At",
                    DateFormat('dd-MM-yyyy').format(data.updatedAt),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ServiceDetails().buildInfoCard(
                rows: [
                  Row(
                    children: [
                      Icon(Icons.add_home, color: primaryColor),
                      const SizedBox(width: 7),
                      Text("clinic_details".tr),
                    ],
                  ),
                  Text(
                    data.vendor.address ??
                        'Aryan Hospital, 78 Shiv Puri, Old Railway Road, Gurgaon, Railway Road',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ServiceDetails().buildInfoCard(
                rows: [
                  Row(
                    children: [
                      Icon(Icons.add_home, color: primaryColor),
                      const SizedBox(width: 7),
                      const Text("Apply Coupon"),
                      const Spacer(),
                      const Text(
                        'Apply',
                        style: TextStyle(
                          color: Color(0xFF0098D0),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Unlock offers with coupon codes',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Bill Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xFF000000),
                    ),
                  ),
                  ServiceDetails().priceRow("Base Price", basePrice),
                  ServiceDetails().priceRow("GST", basePrice * gst / 100),
                  if (additionalFee > 0)
                    ServiceDetails().priceRow(
                      "Professional Fee",
                      additionalFee,
                    ),
                  const Divider(thickness: 1, color: Color(0xFFE4E4E4)),
                  const SizedBox(height: 5),
                  ServiceDetails().priceRow("Total Payable", total),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.professionals.length,
                itemBuilder: (context, index) {
                  final professional = data.professionals[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: const Color(0xffFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      (professional.profileImage != null &&
                                              professional
                                                  .profileImage!
                                                  .isNotEmpty)
                                          ? NetworkImage(
                                            "${AppApiUrl.imagebaseUrl}${professional.profileImage!.replaceFirst('/storage', '')}",
                                          )
                                          : const AssetImage(
                                            'assets/images/service_history.png',
                                          ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        professional.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        professional.specialty ?? 'General',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF666666),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF7E54A0,
                                    ).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "₹${professional.serviceFee.toString() ?? '0'}",
                                    style:  TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                tilePadding: EdgeInsets.zero,
                                childrenPadding: EdgeInsets.zero,
                                title: Text(
                                  'View More Details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor,
                                  ),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (professional.specialty != null &&
                                            professional.specialty!.isNotEmpty)
                                          ServiceDetails().buildDetailRow(
                                            Icons.medical_services_outlined,
                                            'Specialty',
                                            professional.specialty!,
                                          ),
                                        const SizedBox(height: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Select Date",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              height: 40,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    professional
                                                            .availabilities
                                                            .isNotEmpty
                                                        ? professional
                                                            .availabilities[0]
                                                            .length
                                                        : 0,
                                                itemBuilder: (context, i) {
                                                  final availabilityItem =
                                                      professional
                                                          .availabilities[0][i];
                                                  final date = DateFormat(
                                                    'MMM d, yyyy',
                                                  ).format(
                                                    DateTime.parse(
                                                      availabilityItem.date,
                                                    ),
                                                  );
                                                  final isSelected =
                                                      selectedDate == date;
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedDate = date;
                                                        selectedSlot = null;
                                                        additionalFee = 0.0;
                                                      });
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                            right: 5,
                                                          ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                            10,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        color:
                                                            isSelected
                                                                ? Colors.purple
                                                                : Colors
                                                                    .grey[200],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          date,
                                                          style: TextStyle(
                                                            color:
                                                                isSelected
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            selectedDate == null
                                                ? SizedBox.shrink()
                                                : const Text(
                                                  "Select Time",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                            const SizedBox(height: 10),
                                            GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    childAspectRatio: 2.5,
                                                  ),
                                              itemCount: selectedDate != null ? professional.availabilities[0].where(
                                                            (availability) => DateFormat('MMM d, yyyy',).format(
                                                                  DateTime.parse(availability.date,),) == selectedDate,).fold<int>(0,
                                                    (sum, availability,) => sum + availability.slots.length,) : 0,
                                              itemBuilder: (context, i) {
                                                if (selectedDate == null) {
                                                  return Container();
                                                }
                                                int currentIndex = 0;
                                                for (var availability in professional.availabilities[0]) {
                                                  if (DateFormat('MMM d, yyyy').format(
                                                        DateTime.parse(availability.date,),) == selectedDate) {
                                                    if (i < currentIndex + availability.slots.length) {
                                                      final slot = availability.slots[i - currentIndex];
                                                      final startTime = DateFormat('h:mm a',).format(DateTime.parse(slot.startTime.toString(),
                                                            ),);
                                                      final isSlotSelected =
                                                          selectedSlot !=
                                                              null &&
                                                          selectedSlot!['professional'] ==
                                                              professional &&
                                                          selectedSlot!['slot'] ==
                                                              slot;
                                                      return GestureDetector(
                                                        onTap: () {
                                                          if (slot.status ==
                                                              'available') {
                                                            setState(() {
                                                              selectedSlot = {
                                                                'professional':
                                                                    professional,
                                                                'slot': slot,
                                                              };
                                                              additionalFee =
                                                                  double.tryParse(
                                                                    professional
                                                                            .serviceFee
                                                                            .toString() ??
                                                                        '0',
                                                                  ) ??
                                                                  0.0;
                                                            });
                                                          } else {
                                                            Get.snackbar(
                                                              "Error",
                                                              "This slot is not available",
                                                            );
                                                          }
                                                        },

                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(8,),
                                                            color: isSlotSelected ? Colors.purple : (slot.status == 'success'
                                                                        ? Colors.orange[300]
                                                                        : slot.status == 'available' ? Colors.green[100]
                                                                        : Colors.grey[300]),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                startTime,
                                                                style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: isSlotSelected ? Colors.white : Colors.black,
                                                                ),
                                                              ),

                                                              Text(
                                                                slot.status == 'available'? "Available" : "Booked",
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight.bold,
                                                                  color: isSlotSelected ? Colors.white70 : slot.status == 'available'
                                                                          ? Colors.green[900]
                                                                          : Colors
                                                                              .red[900],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        // child: Container(
                                                        //   alignment: Alignment.center,
                                                        //   padding: const EdgeInsets.all(12),
                                                        //   decoration:
                                                        //   BoxDecoration(borderRadius: BorderRadius.circular(8),
                                                        //     color: isSlotSelected ? Colors.purple : (slot.status == 'available' ? Colors.green[100] : Colors.grey[300]),
                                                        //   ),
                                                        //   child: Text(startTime, style: TextStyle(
                                                        //       fontSize: 14, color: isSlotSelected ? Colors.white : Colors.black,
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      );
                                                    }
                                                    // currentIndex +=
                                                    //     availability.slots.length;
                                                  }
                                                }
                                                return Container();
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        if (professional.bio != null &&
                                            professional.bio!.isNotEmpty)
                                          ServiceDetails().buildDetailRow(
                                            Icons.work_outline,
                                            'Experience',
                                            professional.bio!,
                                          ),
                                      ],
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
                },
              ),
              const SizedBox(height: 10),
              Card(
                color: const Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.currency_rupee),
                          Text(
                            total.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if ((data.professionals).isNotEmpty &&
                              selectedSlot != null) {
                            String formattedDate = DateFormat(
                              'yyyy-MM-dd',
                            ).format(
                              DateFormat('MMM d, yyyy').parse(selectedDate!),
                            );
                            String formattedTime = DateFormat('HH:mm').format(
                              DateTime.parse(
                                selectedSlot!['slot'].startTime.toString(),
                              ),
                            );

                            controller.bookServices(
                              context: context,
                              serviceId: data.id.toString(),
                              date: formattedDate,
                              startTime: formattedTime,
                              professionalId:
                                  selectedSlot!['professional'].id.toString(),
                            );
                          } else {
                            Get.snackbar(
                              "No Selection",
                              "Please select time slot",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.TOP,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
