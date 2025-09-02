import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:flutter/material.dart';
import '../../Constants/color_constants.dart';
import '../Constants/font_constants.dart';

class ApplianceRepairScreen extends StatefulWidget {
  const ApplianceRepairScreen({super.key});

  @override
  State<ApplianceRepairScreen> createState() => _ApplianceRepairScreenState();
}

class _ApplianceRepairScreenState extends State<ApplianceRepairScreen> {
  String? selectedService;

  final List<String> services = [
    'Refrigerator Repair',
    'Washing Machine',
    'Ac',
    'Microwave'
  ];

  bool get isServiceSelected => selectedService != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        title: const Text(
          'Appliance Repair',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 6),
                Text(
                  'Schotest F-259 Ansal Corporate Plaza...',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search for appliance or service...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.teal,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '20% off\nToday\'s Special!',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Get discount for every service.\nOnly valid for today',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(discountApplicance),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Popular Services'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text('Select Service'),
                  value: selectedService,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedService = value;
                    });
                  },
                  items: services.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (!isServiceSelected) ...[
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                        child: Image.asset(pickServiceFirst,),
                      ),
                    const SizedBox(height: 10),
                    const Text(
                      'Pick a service first to view details and schedule.',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ] else ...[
              // Sample Service Card UI
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[300],
                        child: Image.asset(pickServiceFirst, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Automatic top load machine check-up'),
                          Text('Starts at ₹199', style: TextStyle(color: Colors.grey)),
                          Row(
                            children: [
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              SizedBox(width: 4),
                              Text('4.5')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Book Now',style: mostly,),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
