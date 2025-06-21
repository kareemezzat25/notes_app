import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/resources/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final int? maxLines;
  const CustomTextField({
    super.key,
    required this.labelText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,

        labelStyle: GoogleFonts.inter(
          fontSize: 18,
          color: AppColors.textFieldColor,
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
