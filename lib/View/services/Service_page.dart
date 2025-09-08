import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/applience_repair/appliance_repair.dart';
import 'package:canwinn_project/View/doctor_appoiments/doctor_appoiments.dart';
import 'package:canwinn_project/View/health_care/health_care.dart';
import 'package:canwinn_project/ViewModel/Controller/get_services_controller.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart' show HospitalController;
import 'package:canwinn_project/blocks/fetch_servicelist/fetch_service_list_states.dart';
import 'package:canwinn_project/blocks/fetch_servicelist/fetch_services_list_bloc.dart';
import 'package:canwinn_project/blocks/fetch_servicelist/fetch_serviceslist_event.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final HospitalController controller = Get.put(HospitalController());
  final GetServicesController getServicesController = Get.put(GetServicesController());
  @override
  void initState() {
   getServicesController.fetchServiceList();
   context.read<ServiceListBloc>().add(FetchServiceList());
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.arrow_back_ios_rounded)),
                  const Text(
                    'Services',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: white,
                    child: IconButton(
                      icon:  Icon(
                        Icons.notifications,
                        color: primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 6),
                  Expanded(child: Obx(() => DropdownButton<String>(
                      value: controller.selectedLocation.value.isNotEmpty
                          ? controller.selectedLocation.value
                          : null,
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text("Select Location"),
                      items: controller.locations.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.changeLocation(value);
                        }
                      },
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 20),
             Obx(() => controller.isSelected.value? Container(
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10)
               ),
               child: ListTile(
                 title: Text('Your Booked Services' , style: TextStyle(fontWeight: FontWeight.bold),),
                 subtitle: Text('View and manage your bookings'),
                 trailing: TextButton(
                   onPressed: () {},
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text('View All',style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 18,
                           fontFamily: 'Raleway'
                       ),),
                       SizedBox(width: 4),
                       Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                     ],
                   ),
                 ),

               ),
             ): Wrap(
                   spacing: 6,
                   children: controller.chipSelection.keys.map((chip) {
                     return Obx(() => FilterChip(
                       selected: controller.chipSelection[chip]!,
                       onSelected: (val) {
                         controller.toggleChip(chip, val);
                       },
                       label: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text(chip),
                           const SizedBox(width: 5),
                           const Icon(Icons.arrow_drop_down, size: 20),
                         ],
                       ),
                     ));
                   }).toList(),
                 ),),
              SizedBox(height: 20,),

              //
    //           Wrap(
    //             spacing: 6,
    //             children: [
    //               FilterChip(
    //               onSelected: (_) {}, label: Row(mainAxisSize: MainAxisSize.min,
    //                children: const [
    //       Text("Nearby Focus"),
    //       SizedBox(width: 5),
    //       Icon(Icons.arrow_drop_down, size: 20),
    //     ],
    //   ),
    // ),
    //               FilterChip(
    //               onSelected: (_) {}, label: Row(mainAxisSize: MainAxisSize.min,
    //     children: const [
    //       Text("Distance"),
    //       SizedBox(width: 5),
    //       Icon(Icons.arrow_drop_down, size: 20),
    //     ],
    //   ),
    // ),
    //               FilterChip(
    //                 onSelected: (_) {}, label: Row(mainAxisSize: MainAxisSize.min,
    //                 children: const [
    //                   Text("Category"),
    //                   SizedBox(width: 5),
    //                   Icon(Icons.arrow_drop_down, size: 20),
    //                 ],
    //               ),
    //               ),
    //               FilterChip(
    //                 onSelected: (_) {}, label: Row(mainAxisSize: MainAxisSize.min,
    //                 children: const [
    //                   Text("Price Offers"),
    //                   SizedBox(width: 5),
    //                   Icon(Icons.arrow_drop_down, size: 20),
    //                 ],
    //               ),
    //               ),
    //               FilterChip(
    //                 onSelected: (_) {}, label: Row(mainAxisSize: MainAxisSize.min,
    //                 children: const [
    //                   Text("Ratings"),
    //                   SizedBox(width: 5),
    //                   Icon(Icons.arrow_drop_down, size: 20),
    //                 ],
    //               ),
    //               ),
    //
    //             ],
    //           ),
              const Text(
                'Popular Services',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              BlocBuilder<ServiceListBloc, FetchServiceListStates>(
                builder: (context, state) {



                  if (state.fetch.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/service_his.png'),
                        const Text(
                          "No Services yet.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Looks like you haven’t experienced\n quality services at home',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }

                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.fetch.length,
                      itemBuilder: (context, index) {
                        final data = state.fetch[index];
                        return InkWell(
                          onTap: () {
                            if (data.id == 10) {
                              Get.to(() => HealthCare());
                            } else if (data.id == 11) {
                              Get.to(() => DoctorAppointmentScreen());
                            } else if (data.id == 12) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Click on the id 12"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else if (data.id == 13) {
                              // Get.to(()=>ApplianceRepair());
                            } else if (data.id == 14) {
                              // Get.to(()=>ApplianceRepair());
                            }
                          },
                          child: _buildServiceCard(
                            data.name.toString(),
                            AppApiUrl.imagebaseUrl + (data.image ?? ''),
                          ),
                        );
                      },
                    ),
                  );

                  // initial state
                  return const SizedBox.shrink();
                },
              ),






              // Obx(() {
              //   if (getServicesController.isLoading.value) {
              //     return const Center(child: CircularProgressIndicator());
              //   }
              //
              //   if (getServicesController.serviceList.isEmpty) {
              //     return Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Image.asset('assets/images/service_his.png'),
              //         const Text(
              //           "No Services yet.",
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //         const Text(
              //           'Looks like you haven’t experienced\n quality services at home',
              //           textAlign: TextAlign.center,
              //         ),
              //       ],
              //     );
              //   }
              //
              //   return SizedBox(
              //     height: 150,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: getServicesController.serviceList.length,
              //       itemBuilder: (context, index) {
              //         final data = getServicesController.serviceList[index];
              //         return InkWell(
              //             onTap: () {
              //               // Get.to(() =>HealthCare());
              //               // Get.to(() => ServicesDetails(service: data));
              //              if(data.id==10){
              //                Get.to(() =>HealthCare());
              //              }else if(data.id ==11){
              //                Get.to(()=>DoctorAppointmentScreen());
              //              }else if(data.id ==12){
              //                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Click on the id 12"),shape: RoundedRectangleBorder(
              //                    borderRadius: BorderRadius.circular(10)
              //                ),backgroundColor: Colors.green,));
              //
              //              }else if(data.id==13){
              //                // Get.to(()=>ApplianceRepair());
              //              }
              //              else if(data.id ==14){
              //                // Get.to(()=>ApplianceRepair());
              //              }
              //             },
              //             child: _buildServiceCard(data.name, AppApiUrl.imagebaseUrl+ data.image.toString()));
              //       },
              //     ),
              //   );
              // }),

             
              const SizedBox(height: 20),
              const Text(
                'Trending Offers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              _buildOfferCard(
                title: 'Get 20% off Dental Checkups',
                subtitle:
                'Get a comprehensive dental checkup at half price. Offer valid for new patients only.',
                label: 'Limited Time',
                image: limitedTime,
              ),
              const SizedBox(height: 12),

              _buildOfferCard(
                title: 'Free Home Repair Consultation',
                subtitle:
                'Get a free consultation for any home repair service. No obligation.',
                label: 'New',
                image: freeHomeConsultant,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String imageUrl) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: imageUrl.isNotEmpty
                ? FadeInImage.assetNetwork(
              placeholder: 'assets/images/img.png',
              image: imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) => Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported, size: 40),
              ),
            )
                : Container(
              height: 100,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Icon(Icons.image_not_supported, size: 40),
            ),
          ),
          const SizedBox(height: 8),
          // Title with padding
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildOfferCard({
    required String title,
    required String subtitle,
    required String label,
    required String image,
  }) {return GestureDetector(
      onTap: () {
        print('Offer tapped: $title');
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(color: Colors.purple, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );}
}









