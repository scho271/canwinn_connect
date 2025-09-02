import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownTextField extends StatelessWidget {
  final String hint;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Color? iconColor;
  final Color? backgroundCol;
  final String? Function(String?)? validator;

  const DropdownTextField({
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.hintColor,
    this.iconColor,
    this.backgroundCol,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundCol ?? const Color(0xFFF4F0FF),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 50,
      child: DropdownButtonFormField<String>(
        value: (value != null && value!.isNotEmpty && items.contains(value))
            ? value
            : null,
        validator: validator, // <-- Apply here
        hint: Text(
          hint,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: hintColor ?? Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        isExpanded: true,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            borderSide: BorderSide(color:borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            borderSide: BorderSide(color:borderColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            borderSide: BorderSide(color:redColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            borderSide: BorderSide(color:redColor),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: iconColor ?? blackColor,
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 16)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

