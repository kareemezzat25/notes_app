abstract class CreateNoteStates {}

class CreateNoteInitial extends CreateNoteStates {}

class CreateNoteLoading extends CreateNoteStates {}

class CreateNoteSuccess extends CreateNoteStates {}

class CreateNoteFailure extends CreateNoteStates {
  String? message;
  CreateNoteFailure({this.message});
}
