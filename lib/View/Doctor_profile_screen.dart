import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/View/BillPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/image_constants.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          title: const Text('Dr. Aisha Sukhani (MBBS)'),
          leading:IconButton(onPressed: (){
            Get.back();
          }, icon:Icon(Icons.arrow_back_ios_rounded)),
          actions: const [
            Icon(Icons.share),
            SizedBox(width: 12),
            Icon(Icons.bookmark_border),
            SizedBox(width: 12),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(profilePhoto), // Add image
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dr. Aisha Sukhani (MBBS)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Dermatologist',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text('4.5'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text('Railway Road, Aryan Hospital'),
                        const SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Experience ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                text: '15 years   ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Consultation ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                text: '1000/-',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Time Slots
              const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.purple),
                  SizedBox(width: 10),
                  Text(
                    "Time Slot",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Today 20 slots", style: TextStyle(fontSize: 12)),
                  Text("14 May 20 slots", style: TextStyle(fontSize: 12)),
                  Text("14 May 20 slots", style: TextStyle(fontSize: 12)),
                  Text("14 May 20 slots", style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  6,
                  (index) => GestureDetector(
                    onTap: () {
                      print("Tapped slot $index");
                    },
                    child: Container(
                      width: 60,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: otpBorderColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "06:00 PM",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Reviews Section
              const Row(
                children: [
                  Icon(Icons.reviews, color: Colors.amber),
                  SizedBox(width: 8),
                  Text(
                    "Reviews",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildReview("Tejpal", "8 years ago"),
              const SizedBox(height: 12),
              _buildReview("Tejpal", "8 years ago"),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 8,
          color: backGroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(ConfirmClinicVisitScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: otpBorderColor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Book Clinic Visit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: otpBorderColor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Call Clinic",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReview(String name, String timeAgo) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(child: Text(name[0])),
              const SizedBox(width: 10),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(timeAgo, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 4),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
