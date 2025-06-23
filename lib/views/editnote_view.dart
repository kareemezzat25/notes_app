import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/editnote_body.dart';

class EditNoteView extends StatefulWidget {
  static const String routeName = "EditNoteView";
  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late NoteModel note;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    titleController = TextEditingController(text: note.titleNote);
    contentController = TextEditingController(text: note.content);
  }

  void updateNote() {
    note.titleNote = titleController.text;
    note.content = contentController.text;
    note.save();
    BlocProvider.of<NotesCubit>(context).readNotes();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "EditNote",
        icon: Icons.check,
        onPressed: updateNote,
      ),
      body: EditNoteBody(
        titleController: titleController,
        contentController: contentController,
      ),
    );
  }
}
