import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/resources/app_colors.dart';
import 'package:notes_app/cubits/create_note/create_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_textForm_field.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
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
            CustomTextFormField(
              labelText: "Title",
              controller: titleController,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              labelText: "Content",
              maxLines: 5,
              controller: contentController,
            ),
            SizedBox(height: 32),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<CreateNoteCubit>(context).createNote(
                    NoteModel(
                      titleNote: titleController.text,
                      content: contentController.text,
                      date: DateTime.now().toString(),
                    ),
                  );
                  log("Added");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
