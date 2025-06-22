import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/create_note/create_notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class CreateNoteCubit extends Cubit<CreateNoteStates> {
  CreateNoteCubit() : super(CreateNoteInitial());

  createNote(NoteModel note) {
    try {
      emit(CreateNoteLoading());
      Box<NoteModel> noteBox = Hive.box<NoteModel>("notes");
      noteBox.add(note);
      emit(CreateNoteSuccess());
    } catch (e) {
      emit(CreateNoteFailure(message: e.toString()));
    }
  }
}
