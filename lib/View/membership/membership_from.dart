
import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/View/membership/verify_membersship.dart';
import 'package:canwinn_project/View/widgets/custom_dropdown_textfields.dart';
import 'package:canwinn_project/View/widgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../ViewModel/Controller/add_membercontroller.dart';
import '../../data/locations_handler/locations_handers.dart';



const kGoogleApiKey = "AIzaSyDr5N4xdGBo4uWbqyjWlt6RYWiLbJzfQM0";
final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class AddMemberShipScreens extends StatefulWidget {
  const AddMemberShipScreens({super.key});

  @override
  State<AddMemberShipScreens> createState() => _AddReferalMemberFormState();
}

class _AddReferalMemberFormState extends State<AddMemberShipScreens> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddMemberController addMemberController = Get.put(AddMemberController());

    return SafeArea(
      child: Scaffold(
        backgroundColor:white,
        appBar: AppBar(
          backgroundColor:white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.keyboard_arrow_left_outlined, color:switchColor),
          ),
          title: Text(
            "applay".tr,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Obx(() => GestureDetector(
                    onTap: () => addMemberController.pickImage(context),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: addMemberController.pickedImage.value != null
                          ? FileImage(addMemberController.pickedImage.value!)
                          : null,
                      backgroundColor: Colors.grey[300],
                      child: addMemberController.pickedImage.value == null
                          ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[700])
                          : null,
                    ),
                  )),
                ),
                SizedBox(height: 15),
      
                _label("Full Name"),
                InputField(
                  controller: addMemberController.nameController,
                  hintText: "Enter your full name",
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  data: "name",
                  validator: (value) => value!.isEmpty ? "Name is required" : null,
                ),
      
                _label("Father Name"),
                InputField(
                  controller: addMemberController.fatherNameController,
                  hintText: "Enter your father name",
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  data: "name",
                  validator: (value) => value!.isEmpty ? "Father name is required" : null,
                ),
      
                _label("Email"),
                InputField(
                  controller: addMemberController.emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  data: "email",
                  validator: (value) => value!.isEmpty || !value.contains('@') ? "Valid email is required" : null,
                ),
      
                _label("Mobile No."),
                InputField(
                  controller: addMemberController.phoneController,
                  hintText: "Enter your mobile number",
                  maxLength: 10,
                  textInputType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none,
                  data: "phone",
                  validator: (value) => value!.isEmpty || value.length < 10 ? "Valid mobile number is required" : null,
                ),
      
                _label("Gender"),
                Obx(() => DropdownTextField(
                  backgroundCol: Colors.white,
                  hint: 'Select Gender',
                  items: ['Male', 'Female', 'Other'],
                  value: addMemberController.selectedGender.value.isEmpty
                      ? null
                      : addMemberController.selectedGender.value,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      addMemberController.selectedGender.value = newValue;
                    }
                  },
                )),
      
                _label("Date of Birth"),
                Obx(() => GestureDetector(
                  onTap: () => addMemberController.selectDOB(context),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      addMemberController.selectedDOB.value == null
                          ? "Select your date of birth"
                          : "${addMemberController.selectedDOB.value!.day}/${addMemberController.selectedDOB.value!.month}/${addMemberController.selectedDOB.value!.year}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: addMemberController.selectedDOB.value == null ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                )),
      
                _label("Blood Group"),
                Obx(() => DropdownTextField(
                  backgroundCol: Colors.white,
                  hint: 'Select Blood Group',
                  items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
                  value: addMemberController
                      .selectedBloodGroup.value.isEmpty
                      ? null
                      : addMemberController.selectedBloodGroup.value,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      addMemberController.selectedBloodGroup.value =
                          newValue;
                    }
                  },
                )),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _label("Address"),
                    InkWell(
                      onTap: () async {
                        try {
                          await LocationHandler.determinePosition(context);
                          addMemberController.addressController.text =
                          "${LocationHandler.place?.street ?? ''}, ${LocationHandler.place?.subLocality ?? ''}";
      
                          addMemberController.cityController.text =
                          "${LocationHandler.place?.locality ?? ''}, ${LocationHandler.place?.administrativeArea ?? ''}";
      
                          addMemberController.pinCodeController.text =
                              LocationHandler.place?.postalCode ?? '';
      
                          print("📍 Location set: ${LocationHandler.place?.subLocality}");
                        } catch (e) {
                          Get.snackbar("Location Error", "Unable to fetch current location.");
                        }
                      },
                      child: _label("Current Locations"),
                    ),
      
                  ],
                ),
      
                InputField(
                  controller: addMemberController.addressController,
                  hintText: "Enter your address",
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  data: "address",
                  readOnly: true,
                  onTap: () async {
                    Prediction? p = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: kGoogleApiKey,
                      mode: Mode.overlay,
                      language: "en",
                      components: [Component(Component.country, "in")],
                    );
      
                    if (p != null) {
                      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId!);
                      final fullAddress = detail.result.formattedAddress;
                      if (fullAddress != null) {
                        addMemberController.addressController.text = fullAddress;
                      }
                    }
                  },
                  validator: (value) => value!.isEmpty ? "Address is required" : null,
                ),
      
                _label("City"),
                InputField(
                  controller: addMemberController.cityController,
                  hintText: "Enter your city",
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  data: "city",
                  validator: (value) => value!.isEmpty ? "City is required" : null,
                ),
      
                _label("Pin Code"),
                InputField(
                  controller: addMemberController.pinCodeController,
                  hintText: "Enter your pin code",
                  maxLength: 6,
                  textInputType: TextInputType.number,
                  textCapitalization: TextCapitalization.none,
                  data: "pin_code",
                  validator: (value) => value!.isEmpty || value.length < 6 ? "Valid pin code is required" : null,
                ),
      
                SizedBox(height: 20),
      
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(VerifyMemberFrom());
                      // if (_formKey.currentState!.validate()) {
                      //   addMemberController.addMemberData();
                      // }
                    },
                    icon: Icon(Icons.send, color: Colors.white),
                    label: Text(
                      "Submit",
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: memberBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
