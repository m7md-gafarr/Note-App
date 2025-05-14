part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

/// Initial state when the note has not been added yet
final class AddNoteInitial extends AddNoteState {}

/// State when the note is being loaded (e.g., during a network call or processing)
final class AddNoteLoading extends AddNoteState {}

/// State when the note is successfully added
final class AddNoteSuccess extends AddNoteState {}

/// State when there is a failure while adding the note
final class AddNoteFailure extends AddNoteState {
  final String errorMessage;

  // Constructor with the error message
  AddNoteFailure(this.errorMessage);
}
