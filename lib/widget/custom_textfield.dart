import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? textFieldHeading;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textFieldHeading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      textFieldHeading == null
          ? Container()
          : Text(
              textFieldHeading!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 22.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
      TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        
        decoration: InputDecoration(
          
            filled: true,
            fillColor: Colors.grey,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: Color(0xFFB6F3B8))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: Color(0xFFB6F3B8))),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: Color(0xFFB6F3B8))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: Color(0xFFB6F3B8))),
            contentPadding: EdgeInsets.only(left: Get.height * .02),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconColor: const Color(0xFFB6F3B8),
            suffixIconColor: const Color(0xFF8A8989)),
      ),
    ]);
  }
}
