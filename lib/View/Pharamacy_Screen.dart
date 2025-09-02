import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart' show HospitalController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PharmacyScreen extends StatefulWidget {
  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  final HospitalController controller = Get.put(HospitalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
       leading: IconButton(onPressed:(){
         Get.back();
       }, icon:Icon(Icons.arrow_back_ios_rounded)),
        title: Text("24×7 Pharmacy", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 6),
                Expanded(
                  child: Obx(() => DropdownButton<String>(
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
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16,),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF9F1FF),
                border: Border.all(width: 1,color: Color(0xFFDEDEDE)),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Icon(Icons.add_photo_alternate,color: Color(0xFFD9D9D9),size: 50,),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("🏥  ABC Pharmacy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_pin, size: 18, color: Colors.red),
                      SizedBox(width: 4),
                      Text("1.2 km away  |  Open 24×7  |  ⭐ 4.6", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text("🍬 Available Services :", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text("Home Delivery ✅", style: TextStyle(fontSize: 14)),
                      SizedBox(width: 16),
                      Text("Prescription Upload ✅", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward,color: Colors.white,),
                          label: Text("Order Now", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.call,color: Colors.white,),
                          label: Text("Call Now", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
