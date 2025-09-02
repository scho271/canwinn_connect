import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/View/medical_services/process_pay/process_pay.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "When will you arrive ?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Schedule for Later",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                const Text("Select your preferred day & time",
                    style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 12),

                // Days Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dayCard("Tue", "26", true),
                    dayCard("Wed", "27", false),
                    dayCard("Thu", "28", false),
                  ],
                ),

                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),

                const Text("Select start time of service",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 12),

                // Time Slots
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    timeSlot("01:30 PM"),
                    timeSlot("02:00 PM"),
                    timeSlot("02:30 PM"),
                    timeSlot("03:00 PM"),
                    timeSlot("03:30 PM"),
                    timeSlot("04:00 PM"),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                    Get.to(ProcessPay());
                    },
                    child: const Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget dayCard(String day, String date, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? Colors.purple : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
        color: selected ? Colors.purple.shade50 : Colors.white,
      ),
      child: Column(
        children: [
          Text(day,
              style: TextStyle(
                  color: selected ? Colors.purple : Colors.black,
                  fontWeight: FontWeight.w600)),
          Text(date,
              style: TextStyle(
                  color: selected ? Colors.purple : Colors.black,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  static Widget timeSlot(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Text(time),
    );
  }
}
