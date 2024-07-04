part of 'edit_note_cubit.dart';

@immutable
abstract class EditNoteState {}

final class EditNoteInitial extends EditNoteState {}

final class EditNoteLoading extends EditNoteState {}

final class EditNoteSuccess extends EditNoteState {}

final class EditNoteFailear extends EditNoteState {
  String e;
  EditNoteFailear(this.e);
}
