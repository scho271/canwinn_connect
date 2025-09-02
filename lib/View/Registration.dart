import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/Custombutton.dart';
import 'package:canwinn_project/View/widgets/Customtext.dart';
import 'package:canwinn_project/View/widgets/Socialbutton.dart';
import 'package:canwinn_project/ViewModel/Controller/bottom_nav_controller.dart';
import 'package:canwinn_project/ViewModel/Controller/registers_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegistrationScreen> {
  RegistersController registersController = Get.put(RegistersController());
  PasswordController passwordController = Get.put(PasswordController());
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 10,
                width: 40,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(backButton),
                ),
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Image.asset(
                        canWinn,
                        width: 128.29685974121094,
                        height: 168,
                      ),
                      Text('sign_up'.tr, style: BoldText),
                      SizedBox(height: 10.w),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'enter_code'.tr,
                          textAlign: TextAlign.center,
                          style: normalText,
                        ),
                      ),
                      SizedBox(height: 10.w),
                      CustomTextField(
                        controller: registersController.usernameController,
                        obscureText: false,
                        label: 'username'.tr,
                        prefiximage: Image.asset(
                          account,
                          width: 20,
                          height: 20,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'return_username'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.w),
                      CustomTextField(
                        controller: registersController.emailController,
                        obscureText: false,
                        label: 'email'.tr,
                        prefiximage: Image.asset(
                          mailIcon,
                          width: 20,
                          height: 20,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'return_mail'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.w),
                      CustomTextField(
                        controller: registersController.numberController,
                        obscureText: false,
                        label: 'number'.tr,
                        // prefiximage: Image.asset(mailIcon,width: 20,height: 20,),
                        prefiximage: Icon(Icons.phone, color: normalTextColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'return_number'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.w),
                      Obx(
                        () => CustomTextField(
                          controller: registersController.passwordController,
                          obscureText:
                              passwordController.isPasswordHidden.value,

                          label: 'password'.tr,
                          // prefiximage: Image.asset(
                          //   encryptedIcon,
                          //   width: 20,
                          //   height: 20,
                          // ),
                          prefiximage: Icon(Icons.lock),
                          suffiximage: GestureDetector(
                            onTap: passwordController.togglePasswordVisibility,
                            child: Icon(
                              passwordController.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          // suffiximage: Image.asset(
                          //   visibilityIcon,
                          //   width: 20,
                          //   height: 20,
                          // ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'return_password'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Obx(
                        () => CustomTextField(
                          controller:
                              registersController.confirmPasswordController,
                          obscureText:
                              passwordController.isPasswordHidden.value,
                          label: 'password'.tr,
                          prefiximage: Icon(Icons.lock),
                          suffiximage: GestureDetector(
                            onTap: passwordController.togglePasswordVisibility,
                            child: Icon(
                              passwordController.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          // suffiximage: Image.asset(
                          //   visibilityIcon,
                          //   width: 20,
                          //   height: 20,
                          // ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'return_confirm_password'.tr;
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 20.h),
                      CustomButton(
                        text: 'sign_up'.tr,
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            registersController.sendOtp(context);
                            // registersController.registerUser(context);
                          }

                          // Get.toNamed('/Otp');
                        },
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Divider(color: lineColor, thickness: 1),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text('or'.tr, style: normalUser),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Divider(color: lineColor, thickness: 1),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: SocialButton(
                              text: 'google_text'.tr,
                              imagePath: google,
                              onTap: () {},
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: SocialButton(
                              text: 'facebook_text'.tr,
                              imagePath: facebook,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
