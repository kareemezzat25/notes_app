import 'package:flutter/material.dart';
import 'package:notes_app/core/resources/app_colors.dart';
import 'package:notes_app/widgets/addnote_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_listview.dart';

class NotesView extends StatelessWidget {
  static const String routeName = "NotesView";
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notes", icon: Icons.search),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child: NotesListView()),
    );
  }
}
