import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap});
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.textFieldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        minimumSize: Size(double.infinity, 60),
      ),
      child: Text(
        "Add",
        style: GoogleFonts.inter(
          fontSize: 20,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
