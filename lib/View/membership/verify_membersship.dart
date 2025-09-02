import 'package:canwinn_project/View/membership/veify_success_screens.dart';
import 'package:canwinn_project/View/personal_profile_screens.dart';
import 'package:canwinn_project/View/widgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Constants/color_constants.dart';
import '../../ViewModel/Controller/add_membercontroller.dart';


class VerifyMemberFrom extends StatefulWidget {
  const VerifyMemberFrom({super.key});

  @override
  State<VerifyMemberFrom> createState() => _VerifyMemberFromState();
}

class _VerifyMemberFromState extends State<VerifyMemberFrom> {
  final AddMemberController addMemberController = Get.put(AddMemberController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:white,
          title: Text("Verify_Member".tr),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Aadhaar_Number".tr, style: _labelStyle()),
                  SizedBox(height: 9),
                  InputField(
                    controller: addMemberController.aadhaarNumberController,
                    labelText: "",
                    hintText: "Enter_aadhar".tr,
                    textInputType: TextInputType.number,
                    textCapitalization: TextCapitalization.sentences,
                    data: "aadhaar",
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(12),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Aadhaar number cannot be empty";
                      }
                      if (value.length < 12) {
                        return "Aadhaar number must be 12 digits";
                      }
                      final aadhaarRegex = RegExp(r'^[2-9]{1}[0-9]{11}$');
                      if (!aadhaarRegex.hasMatch(value)) {
                        return "Invalid Aadhaar number";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 9),
                  Text("Pan_Card".tr, style: _labelStyle()),
                  SizedBox(height: 9),
                  InputField(
                    controller: addMemberController.panCardController,
                    labelText: "",
                    forceUpperCase: true,
                    hintText: "Enter_your_pan".tr,
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    data: "pan",
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp("[A-Z0-9]")),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "PAN cannot be empty";
                      }
                      if (value.length != 10) {
                        return "PAN must be exactly 10 characters";
                      }
                      final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
                      if (!panRegex.hasMatch(value)) {
                        return "Invalid PAN format";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 9),
                  Text("Voter_Id".tr, style: _labelStyle()),
                  SizedBox(height: 9),
                  InputField(
                    controller: addMemberController.voterIdController,
                    labelText: "",
                    hintText: "enter_vid".tr,
                    textInputType: TextInputType.text,
                    forceUpperCase: true,
                    textCapitalization: TextCapitalization.sentences,
                    data: "voter_id",
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp("[A-Z0-9]")),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Voter ID cannot be empty";
                      }
                      if (value.length != 10) {
                        return "Voter ID must be exactly 10 characters";
                      }
                      final voterRegex = RegExp(r'^[A-Z]{3}[0-9]{7}$');
                      if (!voterRegex.hasMatch(value)) {
                        return "Invalid Voter ID format";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 25.h),
                  SizedBox(
                    width: double.infinity,
                    height: 45.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(VerifySuccessScreen());
                        // Get.to(PersonalProfileScreen());
                        // final isValid = _formKey.currentState!.validate();
                        // if (isValid) {
                        //   addMemberController.verifyMember();
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:switchColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "verify".tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: white,
                            ),
                          ),
                          SizedBox(width: 5),
                          SvgPicture.asset(
                            "assets/svg/done_all.svg",
                            color:white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
    );
  }
}