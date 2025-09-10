//
// import 'package:canwinn_project/Constants/color_constants.dart';
// import 'package:canwinn_project/Constants/image_constants.dart';
// import 'package:canwinn_project/View/Ambulance_services.dart';
// import 'package:canwinn_project/View/Bed_availability.dart';
// import 'package:canwinn_project/View/DcotorInformation.dart';
// import 'package:canwinn_project/View/Emergency_Contacts.dart';
// import 'package:canwinn_project/View/Pharamacy_Screen.dart';
// import 'package:canwinn_project/View/widgets/CustomDoctorServiceCard.dart';
// import 'package:canwinn_project/View/widgets/DoctorBottomSheet.dart';
// import 'package:canwinn_project/ViewModel/Controller/fetch_service_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DoctorAppointmentScreenWidgets extends StatefulWidget {
//   final dynamic categoryId;
//   final dynamic categoryName;
//   const DoctorAppointmentScreenWidgets({
//     Key? key,
//     this.categoryId,
//     this.categoryName,
//   }) : super(key: key);
//
//   @override
//   State<DoctorAppointmentScreenWidgets> createState() => _DoctorAppointmentScreenWidgetsState();
// }
//
// class _DoctorAppointmentScreenWidgetsState extends State<DoctorAppointmentScreenWidgets> {
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
//
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



import 'dart:async';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/Ambulance_services.dart';
import 'package:canwinn_project/View/Bed_availability.dart';
import 'package:canwinn_project/View/DcotorInformation.dart';
import 'package:canwinn_project/View/Emergency_Contacts.dart';
import 'package:canwinn_project/View/Pharamacy_Screen.dart';
import 'package:canwinn_project/bloc/sliders/sliders_bloc.dart';
import 'package:canwinn_project/bloc/sliders/sliders_event.dart';
import 'package:canwinn_project/bloc/sliders/sliders_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../widgets/CustomDoctorServiceCard.dart';
import '../widgets/DoctorBottomSheet.dart';

class DoctorAppointmentScreenWidgets extends StatefulWidget {
  final dynamic categoryId;
  final dynamic categoryName;

  const DoctorAppointmentScreenWidgets({
    super.key,
    this.categoryId,
    this.categoryName,
  });

  @override
  State<DoctorAppointmentScreenWidgets> createState() =>
      _DoctorAppointmentScreenWidgetsState();
}

class _DoctorAppointmentScreenWidgetsState
    extends State<DoctorAppointmentScreenWidgets> {
  Timer? _timer;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SlidersBloc>().add(LoadSliders());
      _startAutoSlide();
    });
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (mounted) {
        final bloc = context.read<SlidersBloc>();
        final state = bloc.state;
        if (state.slides.isEmpty) return;

        if (bloc.isSlidingForward && state.currentIndex == state.slides.length - 1) {
          bloc.add(PreviousSlide());
        } else if (!bloc.isSlidingForward && state.currentIndex == 0) {
          bloc.add(NextSlide());
        } else {
          bloc.add(bloc.isSlidingForward ? NextSlide() : PreviousSlide());
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: BlocConsumer<SlidersBloc, SlidersState>(
              listener: (context, state) {
                if (state.slides.isNotEmpty) {
                  _pageController?.animateToPage(
                    state.currentIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              builder: (context, state) {
                if (state.slides.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                _pageController ??= PageController(initialPage: state.currentIndex);
                return Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: state.slides.length,
                      onPageChanged: (index) {
                        context.read<SlidersBloc>().add(UpdateSlide(index));
                        _startAutoSlide();
                      },
                      itemBuilder: (context, index) {
                        final slide = state.slides[index];
                        return CustomDoctorServiceCard(
                          imagePath: slide["image"] ?? doctorAppointment,
                          title: slide["title"] ?? "Default Title",
                          onTap: () {
                            Get.to(const DoctorsAppointmentPage());
                          },
                        );
                      },
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.slides.length,
                              (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: state.currentIndex == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: state.currentIndex == index
                                  ? Colors.blue
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Find a Doctor",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                     FindDoctorSheet(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                doctorCategoryBox(doctor, "General\nPhysician"),
                doctorCategoryBox(cute, "Skin &\nHair"),
                doctorCategoryBox(woman, "Women’s\nHealth"),
                doctorCategoryBox(floss, "Dental\nCare"),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Featured Services",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 3 / 2.1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              serviceTile(phone, "Emergency Contacts", () {
                Get.to( EmergencyContactsScreen());
              }),
              serviceTile(ambulance, "Ambulance Service", () {
                Get.to( AmbulanceServiceScreen());
              }),
              serviceTile(hospitalBed, "Bed Availability", () {
                Get.to( BedAvailabilityScreen());
              }),
              serviceTile(pharmacy, "24x7 Pharmacy", () {
                Get.to( PharmacyScreen());
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget doctorCategoryBox(String imagePath, String label) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 38),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget serviceTile(String icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 20),
            Image.asset(icon, height: 50),
          ],
        ),
      ),
    );
  }
}