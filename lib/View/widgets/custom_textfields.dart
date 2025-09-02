import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    this.labelText,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.readOnly = false,
    this.controller,
    this.enable = false,
    this.data,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength = 100,
    this.maxLine = 1,
    this.showCounter = false,
    this.validator,
    this.onChanged,
    this.forceUpperCase = false,
    this.inputFormatters,
    this.onTap,
  }) : super(key: key);

  final String? labelText;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? data;
  final bool enable;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int maxLength;
  final int maxLine;
  final bool readOnly;
  final bool showCounter;
  final String? Function(String?)? validator;
  final bool forceUpperCase;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLine,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: obscureText,
      cursorColor: Colors.black,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontFamily: 'Roboto',
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      textCapitalization:
      forceUpperCase ? TextCapitalization.characters : textCapitalization,
      inputFormatters: [
        if (forceUpperCase) UpperCaseTextFormatter(),
        if (inputFormatters != null) ...inputFormatters!,
      ],
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:borderColor,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(
            color:borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(
            color:borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(
            color:redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(
            color:redColor,
          ),
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
        counterText: showCounter ? null : '',
      ),
      validator: validator ??
              (value) {
            if (value == null || value.isEmpty) {
              return '$data cannot be empty';
            }
            if (data == 'mobile') {
              if (value.length < 10) {
                return "Invalid mobile number";
              }
              return null;
            }
            if (data == 'pin') {
              if (value.length < 6) {
                return "Invalid pin code";
              }
              return null;
            }
            return null;
          },
    );
  }
}
