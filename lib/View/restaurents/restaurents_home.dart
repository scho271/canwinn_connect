import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/restaurents/restaurents_details.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RestaurentsHomeScreens extends StatefulWidget {
  const RestaurentsHomeScreens({super.key});

  @override
  State<RestaurentsHomeScreens> createState() => _RestaurentsHomeScreensState();
}

class _RestaurentsHomeScreensState extends State<RestaurentsHomeScreens> {
  final HospitalController controller = Get.put(HospitalController());

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        leading:IconButton(onPressed: (){
          Get.back();
        }, icon:Icon(Icons.arrow_back_ios)) ,
          title: InkWell(
            onTap: (){
            Get.to(() => const RestaurentsDetails());
            },
            child: Text("Restaurent")),
        ),
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
                        Text(
                          "Restaurents",
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Obx(() => DropdownButtonFormField<String>(
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
                            )),
                     
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
              Obx(() => SingleChildScrollView(
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
                  )),
              const SizedBox(height: 16),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                 return InkWell(
                   onTap: (){
                     Get.to(() => const RestaurentsDetails());
                   },
                   child: Card(
                     elevation: 4,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),
                     ),
                     child: IntrinsicHeight(
                       child: Padding(
                         padding: const EdgeInsets.all(8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.stretch,
                           children: [
                             Container(
                               width: 100,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(12),
                                 image: DecorationImage(
                                   image: AssetImage(burggerImage),
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                             const SizedBox(width: 12),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Burger Hut",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Save 7%",
                          style: TextStyle(
                            color: Colors.green[700],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                                   ),
                                   const SizedBox(height: 8),
                                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < 3 ? Icons.star : index == 3 ? Icons.star_half : Icons.star_border,
                            color: Colors.amber[700],
                            size: 16,
                          );
                        }),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "2.1 km away | sector 37D",
                        style: TextStyle(
                          fontSize: 14,
                          color:blackColor,
                        ),
                      ),
                    Text("Open 24x7", style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                      Text("300 for two | Bought Today", style: TextStyle(fontSize: 14, color: Colors.grey[600])),


                    ],
                                   ),
                                   const SizedBox(height: 8),

                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 );

    

              },)
   

            
            ],
          ),
        ),
        
      ),
    );
  }
}