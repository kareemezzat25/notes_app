import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_textForm_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key});

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
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
          children: [
            CustomTextFormField(
              labelText: "Title",
              controller: titleController,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              labelText: "Content",
              maxLines: 5,
              controller: contentController,
            ),
          ],
        ),
      ),
    );
  }
}
