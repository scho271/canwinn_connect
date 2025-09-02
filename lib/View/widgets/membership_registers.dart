import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class RegistersMembersShip extends StatefulWidget {
  const RegistersMembersShip({super.key});

  @override
  State<RegistersMembersShip> createState() => _RegistersMembersShipState();
}

class _RegistersMembersShipState extends State<RegistersMembersShip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MemberShip"),
      ),
      body:Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          RegisterMembershipCard(
            titleText: "Register Yourself  To",
            subtitleText: "Become a CANWINN Member Today !",
            buttonText: "Register",
            assetPath: 'assets/images/regisrers.gif',
            onRegisterTap: () {

            },
          )

      ),
    );
  }
}







class RegisterMembershipCard extends StatelessWidget {
  final String? titleText;
  final String? subtitleText;
  final String? buttonText;
  final String assetPath;
  final VoidCallback? onRegisterTap;
  final Color? containerColor;

  const RegisterMembershipCard({
    super.key,
    this.titleText,
    this.subtitleText,
    this.buttonText,
    required this.assetPath,
    this.onRegisterTap,
    this.containerColor,
  });

  Widget _buildAssetImage(String path) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: 80,
        height: 80,
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        path,
        width: 80,
        height: 80,
        fit: BoxFit.contain,
        gaplessPlayback: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: registerMemberShipContainerColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: containerColor ??registerMemberShipContainerColor,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText ?? "registers".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Raleway',
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitleText ?? "become_member".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway',
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onRegisterTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            buttonText ?? "Register",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.keyboard_arrow_right_rounded, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildAssetImage(assetPath),
          ],
        ),
      ),
    );
  }
}
