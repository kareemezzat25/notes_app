import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String titleNote;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;

  NoteModel({
    required this.titleNote,
    required this.content,
    required this.date,
  });
}
