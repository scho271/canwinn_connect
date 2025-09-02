import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/View/widgets/custom_dropdown_textfields.dart';
import 'package:canwinn_project/View/widgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalProfileScreen extends StatefulWidget {
  const PersonalProfileScreen({super.key});

  @override
  State<PersonalProfileScreen> createState() => _PersonalProfileScreenState();
}

class _PersonalProfileScreenState extends State<PersonalProfileScreen> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final RxString selectedGender = ''.obs;
  final RxString selectedMarriedStatus = ''.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          title: Text('personal_profile'.tr),
          centerTitle: false,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon:Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("gender".tr, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Obx(() => DropdownTextField(
                  backgroundCol: Colors.white,
                  hint: 'Select Gender',
                  items: ['Male', 'Female', 'Other'],
                  value: selectedGender.value,
                  onChanged: (val) {
                    selectedGender.value = val!;
                  },
                )),
                const SizedBox(height: 10),
                Text('dob'.tr, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        controller: dayController,
                        hintText: "dd",
                        textInputType: TextInputType.number,
                        textCapitalization: TextCapitalization.none,
                        data: "dob",
                        validator: (value) =>
                        value!.isEmpty || value.length != 2 ? "Invalid day" : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InputField(
                        controller: monthController,
                        hintText: "mm",
                        textInputType: TextInputType.number,
                        textCapitalization: TextCapitalization.none,
                        data: "dob",
                        validator: (value) =>
                        value!.isEmpty || value.length != 2 ? "Invalid month" : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InputField(
                        controller: yearController,
                        hintText: "yyyy",
                        textInputType: TextInputType.number,
                        textCapitalization: TextCapitalization.none,
                        data: "dob",
                        validator: (value) =>
                        value!.isEmpty || value.length != 4 ? "Invalid year" : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),


                Text("marital_status".tr,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Obx(() => DropdownTextField(
                  backgroundCol: Colors.white,
                  hint: 'Select Marital Status',
                  items: ['Single', 'Married', 'Divorced'],
                  value: selectedMarriedStatus.value,
                  onChanged: (val) {
                    selectedMarriedStatus.value = val!;
                  },
                )),
                const SizedBox(height: 10),

                Text("mobile_number".tr,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                InputField(
                  controller: mobileController,
                  hintText: "+91-9999999999",
                  maxLength: 10,
                  textInputType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none,
                  data: "phone",
                  validator: (value) =>
                  value!.isEmpty || value.length < 10 ? "Valid mobile number is required" : null,
                ),
                const SizedBox(height: 10),

                Text("address".tr,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                InputField(
                  controller: addressController,
                  hintText: "Enter your full address",
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  data: "address".tr,
                  validator: (value) =>
                  value!.isEmpty || value.length < 5 ? "Address is required" : null,
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF674FA3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:  Text(
                      'save'.tr,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                      color: white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
