import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextField extends StatelessWidget {
final TextEditingController controller;
final String label;
final bool obscureText;
final Widget? prefiximage;
final Widget? suffiximage;
final String? Function(String?) validator;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.label,
    required this.validator,
    this.prefiximage,
    this.suffiximage});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,

      decoration: InputDecoration(
        labelText: label,
        labelStyle: normalUser,
        contentPadding:  EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        prefixIcon: prefiximage!=null
            ?Padding(padding:EdgeInsets.all(12.0),
          child: prefiximage,
        )
        :null,
        suffixIcon: suffiximage!=null
            ?Padding(padding:EdgeInsets.all(12.0),
          child: suffiximage,
        )
            :null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightBorderColor,width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 2),
      borderRadius: BorderRadius.circular(40),
    ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      validator: validator,
    );
  }
}
