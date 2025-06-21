import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/resources/app_colors.dart';

import 'package:notes_app/widgets/custom_button.dart';

import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Text(
            "Add Note",
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 16),
          CustomTextField(labelText: "Title"),
          SizedBox(height: 16),
          CustomTextField(labelText: "Content", maxLines: 5),
          SizedBox(height: 32),
          CustomButton(),
        ],
      ),
    );
  }
}
