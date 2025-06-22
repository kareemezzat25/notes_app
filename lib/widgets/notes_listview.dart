import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/resources/app_colors.dart';
import 'package:notes_app/cubits/read_notes/notes_cubit.dart';
import 'package:notes_app/cubits/read_notes/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NotesCubit>(context).readNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        if (notes.isEmpty) {
          return Center(
            child: Text(
              "There Is No Notes Exist!",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor,
              ),
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return NoteItem(note: notes[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: notes.length,
          );
        }
      },
    );
  }
}
