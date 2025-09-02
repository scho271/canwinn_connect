import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/helper/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateUser();
  }

  void _navigateUser() async {
    await Future.delayed(Duration(seconds: 2));

    final token = StorageHelper.getToken();
    print("Token:---${token}");

    if (token != null && token.isNotEmpty) {
      Get.offNamed('/bootom');
    } else {
      Get.offNamed('/Login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(canWinns, width: 256.59, height: 336)],
        ),
      ),
    );
  }
}
