import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/editnote_body.dart';

class EditNoteView extends StatelessWidget {
  static const String routeName = "EditNoteView";
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "EditNote", icon: Icons.check),
      body: EditNoteBody(),
    );
  }
}
