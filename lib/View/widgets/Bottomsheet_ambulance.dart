import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final pickupAddress = TextEditingController();
  final patientName = TextEditingController();
  final contactNumber = TextEditingController();
  final condition = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  var selectedOption = ''.obs;
  var selectedDate = Rxn<DateTime>();
  var selectedTime = Rxn<TimeOfDay>();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Patient name is required";
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Only alphabets are allowed";
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Contact number is required";
    }
    if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
      return "Enter valid 10 digit number";
    }
    return null;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      selectedDate.value = picked;
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      selectedTime.value = picked;
      timeController.text = picked.format(context);
    }
  }
}

void showBookingBottomSheet(BuildContext context) {
  final controller = Get.put(BookingController());

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Form(
              key: controller.formKey,
              child: ListView(
                controller: scrollController,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Booking Form",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  bookingTextField("📍 Pickup Address",
                      controller: controller.pickupAddress,
                      validator: (val) =>
                      val == null || val.isEmpty ? "Address required" : null),
                  bookingTextField("👤 Patient Name",
                      controller: controller.patientName,
                      validator: controller.validateName),

                  bookingTextField("☎️ Contact Number",
                      controller: controller.contactNumber,
                      keyboardType: TextInputType.phone,
                      validator: controller.validatePhone),

                  bookingTextField("💬 Medical Condition",
                      controller: controller.condition,
                      validator: (val) => val == null || val.isEmpty
                          ? "Condition required" : null),

                  const SizedBox(height: 8),
                  Obx(() => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                    hint: const Text("📅 Date/Time Option"),
                    value: controller.selectedOption.value.isEmpty
                        ? null
                        : controller.selectedOption.value,
                    items: ['As Soon as Possible', 'Schedule']
                        .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedOption.value = value ?? '';
                      if (value != 'Schedule') {
                        controller.selectedDate.value = null;
                        controller.selectedTime.value = null;
                        controller.dateController.clear();
                        controller.timeController.clear();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select an option";
                      }
                      return null;
                    },
                  )),

                  const SizedBox(height: 10),
                  Obx(() => controller.selectedOption.value == 'Schedule'
                      ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: controller.dateController,
                          readOnly: true,
                          onTap: () => controller.selectDate(context),
                          validator: (val) => val == null || val.isEmpty
                              ? "Date required"
                              : null,
                          decoration: InputDecoration(
                            hintText: "📅 Select Date",
                            suffixIcon: const Icon(Icons.calendar_today),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      // Time Picker
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: controller.timeController,
                          readOnly: true,
                          onTap: () => controller.selectTime(context),
                          validator: (val) => val == null || val.isEmpty
                              ? "Time required"
                              : null,
                          decoration: InputDecoration(
                            hintText: "⏰ Select Time",
                            suffixIcon: const Icon(Icons.access_time),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                      : const SizedBox()),

                  const SizedBox(height: 20),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Confirm Booking",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

// Common TextField Widget
Widget bookingTextField(String hint,
    {TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      String? Function(String?)? validator}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}