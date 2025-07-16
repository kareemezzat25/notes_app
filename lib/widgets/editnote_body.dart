import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_textForm_field.dart';

class EditNoteBody extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  const EditNoteBody({
    super.key,
    required this.titleController,
    required this.contentController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        children: [
          CustomTextFormField(labelText: "Title", controller: titleController),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Content",
            maxLines: 5,
            controller: contentController,
          ),
        ],
      ),
    );
  }
}
