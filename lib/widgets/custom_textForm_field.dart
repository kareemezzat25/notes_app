import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/resources/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final int? maxLines;
  TextEditingController controller;
  CustomTextFormField({
    super.key,
    required this.labelText,
    this.maxLines = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$labelText is required";
        }
        return null;
      },
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,

        labelStyle: GoogleFonts.inter(
          fontSize: 18,
          color: AppColors.whiteColor,
        ),
        border: outlineBorder(),
        focusedBorder: outlineBorder(),
        enabledBorder: outlineBorder(),
      ),
    );
  }
}

OutlineInputBorder outlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: AppColors.whiteColor),
  );
}
