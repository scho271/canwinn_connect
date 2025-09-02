import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/View/health_care/widgets/health_card_widgets.dart';
import 'package:canwinn_project/View/health_care/widgets/vouchers_screens.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart' show Obx;

class HealthCare extends StatefulWidget {
  const HealthCare({super.key});

  @override
  State<HealthCare> createState() => _HealthCareState();
}

class _HealthCareState extends State<HealthCare> {
  final HospitalController controller = Get.put(HospitalController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            SizedBox(height: 10,),
            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
              ),
            ),),
            SizedBox(height: 10,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap:() {
                      Get.to(()=>VoucherScreen());
                    },
                    child: HospitalCard());
              },
            )


          ],
        ),
      ),
      ),
    );
  }
}
