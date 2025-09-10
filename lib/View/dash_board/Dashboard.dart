import 'package:cached_network_image/cached_network_image.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/applience_repair/home_services/home_services.dart';
import 'package:canwinn_project/View/doctor_appoiments/doctor_appoiments_widgets.dart';
import 'package:canwinn_project/View/emgrency_contacts/emagrency_widgets/emagrency_widgets.dart';
import 'package:canwinn_project/View/hospital_near_me/hospital_near_me.dart';
import 'package:canwinn_project/View/medical_services/widgets/medical_service_widgets.dart';
import 'package:canwinn_project/View/restaurents/restaurents_home.dart';
import 'package:canwinn_project/View/widgets/membership_registers.dart';
import 'package:canwinn_project/View/widgets/searchbar.dart';
import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/View/membership/membership_from.dart';
import 'package:canwinn_project/ViewModel/Controller/category_filter_controller.dart';
import 'package:canwinn_project/domain/repositories/search_repository.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';




class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController controller = Get.put(DashboardController());
  TextEditingController searchController = TextEditingController();
  SearchRepository searchRepository = Get.put(SearchRepository());
  @override


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
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CANWINN CONNECT",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Obx(() => DropdownButtonFormField<String>(
                          value: controller.hospitalController.selectedLocation.value,
                          decoration: const InputDecoration(
                              border: InputBorder.none, isDense: true),
                          items: controller.hospitalController.locations
                              .map((location) {
                            return DropdownMenuItem(
                                value: location, child: Text(location));
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              controller.hospitalController.changeLocation(value);
                            }
                          },
                        )),
                      ],
                    ),
                  ),
                  CircleAvatar(child: Icon(Icons.notifications, color: primaryColor)),
                ],
              ),
              SizedBox(height: 12.sp),
              CustomSearchBar(
                controller: searchController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    searchRepository.searchData(value);
                  } else {
                    searchRepository.clearSearch();
                  }
                },
              ),
              SizedBox(height: 16.sp),
              Obx(() {
                if(!searchRepository.isSearching.value){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegisterMembershipCard(
                        titleText: "registers".tr,
                        subtitleText: "Become a CANWINN Member Today !",
                        buttonText: "register".tr,
                        assetPath: 'assets/images/regisrers.gif',
                        onRegisterTap: () => Get.to(AddMemberShipScreens()),
                      ),
                      SizedBox(height: 5.sp),
                      Text('recent'.tr, style: categories),
                      SizedBox(height: 5.sp),
                      buildAppointmentCard(
                        color: Colors.purple,
                        icon: Icons.calendar_month,
                        title: "Upcoming: Dental",
                        subtitle: "Appointment with Dr. Ravindra N. Jain",
                        time: "Tomorrow, 10 AM",
                      ),
                      const SizedBox(height: 12),
                      buildAppointmentCard(
                        color: Colors.amber.shade700,
                        icon: Icons.build,
                        title: "Home Repairing: Plumber",
                        subtitle: "Appointment with Dr. Ravindra N. Jain",
                        time: "Tomorrow, 10 AM",
                      ),
                      Row(
                        children: [
                          Text("Categories", style: categories),
                          SizedBox(width: 4.sp),
                          const Icon(Icons.arrow_forward_ios_outlined),
                        ],
                      ),
                      Obx(() {
                        if (controller.categoriesController.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (controller.categoriesController.categoriesList.isEmpty) {
                          return const Center(child: Text("No categories found"));
                        } else {
                          final filtered = controller.filteredCategories;
                          return Column(
                            children: [
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.filterOptions.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Obx(() => ChoiceChip(
                                        showCheckmark: false,
                                        label: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.filter_alt, size: 20,
                                              color: controller.selectedChipIndex.value == index
                                                  ? Colors.white
                                                  : Colors.black87,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(controller.filterOptions[index],
                                              style: TextStyle(
                                                color: controller.selectedChipIndex.value == index
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        selected: controller.selectedChipIndex.value == index,
                                        onSelected: (_) => controller.changeFilter(index),
                                        selectedColor: primaryColor,
                                        backgroundColor: Colors.grey[200],
                                      )),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              if (filtered.isEmpty)
                                const Center(
                                  child: Text(
                                    "No categories found for selected filter",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                )
                              else getCategoryContent(filtered[0]),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              radius: 30.sp,
                                              backgroundColor: Colors.white,
                                              child: Image.asset(general,
                                                  fit: BoxFit.contain),
                                            ),
                                          ),
                                          SizedBox(height: 8.sp),
                                          Text(
                                            "General Store",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              radius: 30.sp,
                                              backgroundColor: Colors.white,
                                              child: Image.asset(beautyAndWellness,
                                                  fit: BoxFit.contain),
                                            ),
                                          ),
                                          SizedBox(height: 8.sp),
                                          Text(
                                            "Beauty & \nWellness",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(RestaurentsHomeScreens());
                                            },
                                            child: CircleAvatar(
                                              radius: 30.sp,
                                              backgroundColor: Colors.white,
                                              child: Image.asset(dinner,
                                                  fit: BoxFit.contain),
                                            ),
                                          ),
                                          SizedBox(height: 8.sp),
                                          Text(
                                            "Restaurants",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.sp),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                height: 220,
                                width: 412,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('earn_1000'.tr, style: earn100),
                                    SizedBox(height: 5.sp),
                                    Text('get_a'.tr, style: getaa),
                                    SizedBox(height: 5.sp),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "Refer Now",
                                            style: TextStyle(color: white),
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(refer),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                      }),
                    ],
                  );
                } else if(searchRepository.searchResponseData.isEmpty){
                  return Center(child: Text("No Data Found"),);
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: searchRepository.searchResponseData.length,
                  itemBuilder: (context, index) {
                    final searchData = searchRepository.searchResponseData[index];

                    return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[200],
                                      image: searchData.image != null
                                          ? DecorationImage(
                                        image: NetworkImage(searchData.image.toString()),
                                        fit: BoxFit.cover,
                                      )
                                          : DecorationImage(
                                        image: AssetImage(doctorAppointment),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          searchData.name,
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Vendor: ${searchData.vendor.businessName}",
                                          style: TextStyle(color: Colors.grey[700]),
                                        ),
                                        if (searchData.subcategory != null)
                                          Text(
                                            "Category: ${searchData.subcategory?.name}",
                                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                          ),
                                        if (searchData.description != null)
                                          Text(
                                            searchData.description.toString(),
                                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Price: ₹${searchData.basePrice}",
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "GST: ${searchData.gstPercentage}%",
                                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            if (searchData.durationMinutes != null)
                                              Container(
                                                margin: EdgeInsets.only(right: 6),
                                                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.green[50],
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Text(
                                                  "${searchData.durationMinutes} min",
                                                  style: TextStyle(fontSize: 12, color: Colors.green[800]),
                                                ),
                                              ),
                                            SizedBox(height: 4),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[50],
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                searchData.serviceType.toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue[800]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ])));
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCategoryContent(dynamic category) {
    switch (category.id) {
      case 10:
        return MedicalServiceWidgets();
      case 11:
        return HospitalNearMeWidget(
            categoryId: category.id, categoryName: category.name);
      case 12:
        return DoctorAppointmentScreenWidgets(
            categoryId: category.id, categoryName: category.name);
      case 13:
        return Obx(() {
          final controller = Get.find<DashboardController>();

          if (controller.categoriesController.isLoading.value) {
            return const Center(child: CircularProgressIndicator(strokeWidth: 2));
          } else if (controller.categoriesController.categoriesList.isEmpty) {
            return const Center(
              child: Text(
                "No categories found",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          } else {
            final applianceCategory = controller.categoriesController.categoriesList
                .firstWhere((cat) => cat.name == "Appliance Repair",
                orElse: () => category);

            if (applianceCategory.subcategories?.isEmpty ?? true) {
              return const Center(
                child: Text(
                  "No subcategories found",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              );
            }

            return MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(14.sp),
              crossAxisCount: 2,
              mainAxisSpacing: 16.sp,
              crossAxisSpacing: 16.sp,
              itemCount: applianceCategory.subcategories?.length ?? 0,
              itemBuilder: (context, index) {
                final subcategory = applianceCategory.subcategories![index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => HomeServices(subcategory: subcategory));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.sp),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                    ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18.sp)),
                  child: CachedNetworkImage(
                    imageUrl: AppApiUrl.imagebaseUrl + subcategory.image.toString(),
                    height: 130.sp,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    placeholder: (context, url) => Container(
                      height: 130.sp,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 130.sp,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 10.sp),
                          child: Text(
                            subcategory.name,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
      case 14:
        return EmagrencyWidgets();
      default:
        return HospitalNearMeWidget(
            categoryId: category.id, categoryName: category.name);
    }
  }

  Widget buildAppointmentCard({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
          ),
          Text(time,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: Colors.teal)),
        ],
      ),
    );
  }
}






