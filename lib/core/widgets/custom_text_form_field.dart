import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/colors.dart';
import 'package:fruits_dashboard/core/utils/text_styles.dart';


class CustomTextFormField extends StatelessWidget {
   CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon, this.onSaved,  this.obscureText=false,this.Controller, this.maxLines});
  final String hintText;
  final TextInputType textInputType;
  final int? maxLines ;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextEditingController? Controller ;
  

  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: Controller,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: getFont14TextStyle(context,
            fontWeight: FontWeight.bold, color: const Color(0xFF949D9E)),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.darkColor)); // Color(0xFFE6E9E9)
  }
}
