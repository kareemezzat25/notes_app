import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/bloc_observer.dart';
import 'package:notes_app/cubits/read_notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/editnote_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("notes");
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        routes: {
          NotesView.routeName: (context) => NotesView(),
          EditNoteView.routeName: (context) => EditNoteView(),
        },
        initialRoute: NotesView.routeName,
      ),
    );
  }
}
