import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: darkBorderColor),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 20.h),
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600,color: normalTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
