import 'package:canwinn_project/domain/repositories/auth_repository.dart';
import 'package:canwinn_project/helper/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistersController extends GetxController {
  final LoginRepository loginRepository = LoginRepository();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> registerUser(BuildContext context) async {
    isLoading.value = true;

    final data = {
      "name": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
      "phone_number": numberController.text.trim(),
    };

    try {
      isLoading.value = false;

      Get.toNamed('/Otp', arguments: data);
    } catch (e) {
      isLoading.value = false;
      debugPrint("Registration Error: $e");

      String errorMsg = e.toString().replaceFirst("Exception: ", "");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> sendOtp(BuildContext context) async {
    isLoading.value = true;
    try {
      final response = await loginRepository.sendOtp({
        "phone_number": numberController.text.trim(),
      });

      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Otp Send Successfully: ${response['otp']}"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),
      );

      final data = {
        "name": usernameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
        "phone_number": numberController.text.trim(),
      };

      Get.toNamed('/Otp', arguments: data);
    } catch (ex) {
      isLoading.value = false;
      String errorMsg = ex.toString().replaceFirst("Exception: ", "");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> verfiysOtp(BuildContext context) async {
    isLoading.value = true;

    final verifyData = {
      "phone_number": numberController.text.trim(),
      "otp": otpController.text.trim(),
    };

    final registrationData = {
      "name": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
      "phone_number": numberController.text.trim(),
    };

    try {
      final verifyResponse = await loginRepository.verifyOtp(verifyData);
      if (verifyResponse['message'] == "OTP Verified Successfully") {
        final registerResponse = await loginRepository.registerApi(
          registrationData,
        );

        await StorageHelper.saveUserData(registerResponse);

        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User Registered Successfully"),
            backgroundColor: Colors.green,
          ),
        );

        usernameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        numberController.clear();
        otpController.clear();

        Get.offAllNamed('/Login');
      } else {
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("OTP Verification Failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (ex) {
      isLoading.value = false;
      String errorMsg = ex.toString().replaceFirst("Exception: ", "");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $errorMsg"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> loginUsers(BuildContext context) async {
    isLoading.value = true;

    final loginData = {
      "email": emailController.text.trim(),
      "password": passwordController.text,
    };

    try {
      final response = await loginRepository.loginApi(loginData);
      await StorageHelper.saveUserData(response);

      isLoading.value = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Successful"),
          backgroundColor: Colors.green,
        ),
      );
      Get.offAllNamed('/bootom');
    } catch (ex) {
      isLoading.value = false;

      final errorMsg = ex.toString().replaceFirst("Exception: ", "");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg), backgroundColor: Colors.red),
      );
    }
  }
}
