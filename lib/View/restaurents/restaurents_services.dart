import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/restaurents/resturents_detatils.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurentsServices extends StatefulWidget {
  const RestaurentsServices({super.key});

  @override
  State<RestaurentsServices> createState() => _RestaurentsServicesState();
}

class _RestaurentsServicesState extends State<RestaurentsServices> {
  final HospitalController controller = Get.put(HospitalController());

  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "Burger Hut",
      "distance": "2.1 km away | Sector 37D",
      "status": "Open 24×7",
      "price": "₹300 for two | Bought Today",
      "discount": " ₹299",
      "image": burggerImage,
    },
    {
      "name": "Pizza Point",
      "distance": "3.5 km away | Sector 21",
      "status": "Open until 11 PM",
      "price": "₹450 for two | Popular Today",
      "discount": "Get 30%",
      "image": burggerImage,
    },
    {
      "name": "Roll Express",
      "distance": "1.2 km away | Sector 45",
      "status": "Open Now",
      "price": "₹150 for two | Trending",
      "discount": "Buy 1 Get 1 Free",
      "image": burggerImage,
    },
  ];

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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Restaurants Services",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Obx(
                          () => DropdownButtonFormField<String>(
                            value: controller.selectedLocation.value,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.notifications, color: Colors.black54),
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search_rounded),
                    hintText: 'search_hospital'.tr,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'filters'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: controller.filters.map((filter) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(filter),
                          selected: controller.selectedFilter.value == filter,
                          onSelected: (val) {
                            controller.changeFilter(filter);
                          },
                          selectedColor: primaryColor.withOpacity(0.2),
                          labelStyle: TextStyle(
                            color: controller.selectedFilter.value == filter ? primaryColor : Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Restaurant Cards
                ListView.builder(
  itemCount: restaurants.length,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemBuilder: (context, index) {
    final data = restaurants[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: (){
          Get.to(RestaurantDetailPage());
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Stack(
            children: [
              /// Content Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Restaurant Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      data["image"],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
        
                  /// Restaurant Info
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
        
                          /// Ratings
                          Row(
                            children: List.generate(
                              5,
                              (star) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
        
                          Text(
                            data["distance"],
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                          ),
                          Text(
                            data["status"],
                            style: TextStyle(color: Colors.green, fontSize: 13),
                          ),
                          Text(
                            data["price"],
                            style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        
              /// 🔥 Discount Badge (Top Right Corner)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    data["discount"], // e.g. "Save 7%"
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
)

            
            ],
          ),
        ),
      ),
    );
  }
}
