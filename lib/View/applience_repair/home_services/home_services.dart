import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/applience_repair/home_services/home_services_cart.dart';
import 'package:canwinn_project/ViewModel/Controller/get_categories_controller.dart';
import 'package:canwinn_project/modules/categories_module.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canwinn_project/Constants/color_constants.dart';

class HomeServices extends StatefulWidget {
  final Datum? subcategory;

  HomeServices({super.key, this.subcategory});

  @override
  State<HomeServices> createState() => _HomeServicesState();
}

class _HomeServicesState extends State<HomeServices> {
  final CategoriesController categoriesController = Get.put(CategoriesController());
  HomeServicesController controller = Get.put(HomeServicesController());

  @override
  void initState() {
    super.initState();
    if (widget.subcategory != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await categoriesController.getSubCategoriesById(widget.subcategory!.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.subcategory!.name),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon:Icon(Icons.arrow_back_ios_rounded)),
        ),
        bottomNavigationBar: Obx(() {
          double totalBasePrice = 0;
          double totalDiscountPrice = 0;
          for (var item in categoriesController.subcategoriesListDataById) {
            try {
              double basePrice = double.tryParse(item.basePrice ?? '0') ?? 0;
              double gstPercentage = double.tryParse(item.gstPercentage ?? '0') ?? 0;
              totalBasePrice = totalBasePrice+basePrice;
              totalDiscountPrice += basePrice + (basePrice * gstPercentage / 100);
            } catch (e) {
              debugPrint("Error parsing price: $e");
            }
          }

          return InkWell(
            onTap: () {
              Get.to(HomeServicesCart(
                serviceCartData: categoriesController.subcategoriesListDataById,
              ));
            },

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "₹${totalBasePrice.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "₹${totalDiscountPrice.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            'View cart',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                          Icon(Icons.navigate_next, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  if (totalDiscountPrice > 0)
                    Text(
                      "You saved ₹${(totalDiscountPrice - totalBasePrice).toStringAsFixed(0)}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),

        backgroundColor: backGroundColor,
        body: Obx(() {
          if (categoriesController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (categoriesController.subcategoriesListDataById.isEmpty) {
            return Center(child: Text('No data Found'));
          }
          return ListView.builder(
            itemCount: categoriesController.subcategoriesListDataById.length,
            itemBuilder: (context, index) {
              final item = categoriesController.subcategoriesListDataById[index];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        item.image.isNotEmpty
                            ? Image.network(
                          AppApiUrl.imagebaseUrl + item.image,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                            limitedTime,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ) : Image.asset(
                          limitedTime,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          top: 150,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(2, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.subcategory?.name ?? 'Washing Machine Repair',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        item.vendor?.address ?? "Schoetest F-259 Ansal Corporate Plaza...",
                                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    SizedBox(width: 5),
                                    Text('4.76 (11.1 M bookings)'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Super Saving Discounts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.name ?? 'Foam jet services',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                        child:  Text(
                                          "${item.gstPercentage}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      SizedBox(width: 5),
                                      Text('4.76 (11.1 M bookings)'),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        // Base Price
                                        Text(
                                          "₹${item.basePrice ?? '3000'}",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "₹${(() {
                                            try {
                                              double basePrice = double.parse(item.basePrice ?? '3000');
                                              double percentage = double.parse(item.gstPercentage ?? '0');
                                              double finalPrice = basePrice + (basePrice * percentage / 100);
                                              return finalPrice.toStringAsFixed(0);
                                            } catch (e) {
                                              return (item.basePrice ?? '3000');
                                            }
                                          })()}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(width: 8),

                                        // Percentage Label
                                        Text(
                                          "(${item.gstPercentage ?? '0'}% off)",
                                          style: TextStyle(fontSize: 14, color: Colors.red),
                                        ),
                                        SizedBox(width: 16),

                                        Text('|'),
                                        SizedBox(width: 10),

                                        // Duration
                                        Text("${item.durationMinutes ?? 0} mins"),
                                      ],
                                    ),
                                  ),


                                  Obx(() => Theme(
                                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      tilePadding: EdgeInsets.symmetric(horizontal: 0),
                                      childrenPadding: EdgeInsets.zero,
                                      visualDensity: VisualDensity(vertical: -4),
                                      title: Row(
                                        children: [
                                          Text("View More Details"),
                                          Icon(controller.isExpanded.value
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down),
                                        ],
                                      ),
                                      trailing: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          'Add',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      onExpansionChanged: (val) {
                                        Future.delayed(Duration.zero, () {
                                          controller.isExpanded.value = val;
                                        });
                                      },
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Vendor: ${item.vendor?.businessName ?? 'Unknown Vendor'}",
                                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                                ),
                                                if (item.description != null)
                                                  Text(
                                                    "Description: ${item.description}",
                                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                                  ),
                                                Text(
                                                  "Service Type: ${item.serviceType ?? 'General'}",
                                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class HomeServicesController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

}