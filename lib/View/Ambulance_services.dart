


import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/Bottomsheet_ambulance.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart' show HospitalController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AmbulanceServiceScreen extends StatefulWidget {
  @override
  _AmbulanceServiceScreenState createState() => _AmbulanceServiceScreenState();
}

class _AmbulanceServiceScreenState extends State<AmbulanceServiceScreen> {
  final HospitalController controller = Get.put(HospitalController());

  final List<String> ambulanceOptions = [
    'Basic Life Support',
    'Advanced Life Support',
    'ICU Ambulance',
    'Neonatal Ambulance'
  ];

  String? selectedAmbulance;
  bool showAmbulanceImage = true;
  bool isTileExpanded = false;
  Key expansionTileKey = UniqueKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon:Icon(Icons.arrow_back_ios_rounded)),
        title: const Text('Ambulance Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Theme(
                 data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  key: expansionTileKey,
                  initiallyExpanded: isTileExpanded,
                  title: Text(
                    selectedAmbulance ?? 'Ambulance Options',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      isTileExpanded = expanded;
                    });
                  },
                  children: ambulanceOptions.map((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          selectedAmbulance = option;
                          showAmbulanceImage = false;
                          isTileExpanded = false;
                          expansionTileKey = UniqueKey();
                        });
                      },
                    );
                  }).toList(),
                )

              ),
            ),

            const SizedBox(height: 20),

            Visibility(
              visible: showAmbulanceImage,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      siren,
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Choose an ambulance type above to\nget started.',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !showAmbulanceImage,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("🚑 ABC Ambulance Services", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Text("4.5", style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text("Fare: ₹450  |  ETA: 10 mins", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_pin, size: 18, color: Colors.red),
                        SizedBox(width: 4),
                        Text("Location: 2.3 km away", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showBookingBottomSheet(context);
                            },
                            icon: Icon(Icons.arrow_forward),
                            label: Text("Book Now", style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Call logic here
                            },
                            icon: Icon(Icons.call),
                            label: Text("Call Now", style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
