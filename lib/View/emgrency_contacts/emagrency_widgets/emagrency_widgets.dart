import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/ViewModel/Controller/category_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmagrencyWidgets extends StatefulWidget {
  const EmagrencyWidgets({super.key});

  @override
  State<EmagrencyWidgets> createState() => _EmagrencyWidgetsState();
}

class _EmagrencyWidgetsState extends State<EmagrencyWidgets> {
  final DashboardController controller = Get.put(DashboardController());
  final RxList<String> selectedFilters = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'quickAccess'.tr,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              fontFamily: 'Raleway'),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                margin:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Service ${index + 1}'),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        ambulence,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 15),

        Obx(() => Row(
            children: [
              _buildFilterChip(Icons.location_on, "Near me"),
              const SizedBox(width: 8),
              _buildFilterChip(Icons.access_time, "Open 24×7"),
              const SizedBox(width: 8),
              _buildFilterChip(Icons.star, "Rating"),
            ],
          ),
        ),

        const SizedBox(height: 16),

        _buildHospitalCard(
          name: "Apex Hospital",
          distance: "2.1 km away",
          isOpen: "Open 24×7",
          rating: 5,
        ),

        const SizedBox(height: 12),

        _buildHospitalCard(
          name: "Fortis DTM",
          distance: "2.1 km away",
          isOpen: "Open 24×7",
          rating: 5,
        ),
      ],
    );
  }

  Widget _buildFilterChip(IconData icon, String label) {
    final isSelected = selectedFilters.contains(label);
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          selectedFilters.remove(label);
        } else {
          selectedFilters.add(label);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color:
            isSelected ?  primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 16,
                color: isSelected ? Colors.white : Colors.black54),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHospitalCard({
    required String name,
    required String distance,
    required String isOpen,
    required int rating,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600)),

          const SizedBox(height: 4),

          Row(
            children: List.generate(
              rating,
                  (index) =>
              const Icon(Icons.star, size: 18, color: Colors.amber),
            ),
          ),

          const SizedBox(height: 6),

          Text("$distance   |   $isOpen",
              style:
              TextStyle(fontSize: 13, color: Colors.grey.shade700)),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  icon:
                  const Icon(Icons.location_on, color: Colors.green),
                  label: const Text("Get Direction",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.call, color: Colors.white),
                  label: const Text("Call Now",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
