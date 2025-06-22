import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/read_notes/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());
  List<NoteModel>? notes;
  readNotes() {
    Box<NoteModel> notesBox = Hive.box<NoteModel>("notes");
    notes = notesBox.values.toList();
    emit(NotesSuccessState());
  }
}
