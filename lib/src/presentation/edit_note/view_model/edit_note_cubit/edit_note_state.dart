part of 'edit_note_cubit.dart';

@immutable
abstract class EditNoteState {}

/// Initial state when no action has been performed yet.
final class EditNoteInitial extends EditNoteState {}

/// Loading state when the note is being edited.
final class EditNoteLoading extends EditNoteState {}

/// Success state after a note has been successfully edited.
final class EditNoteSuccess extends EditNoteState {}

/// Failure state if an error occurs while editing a note.
final class EditNoteFailure extends EditNoteState {
  final String errorMessage;

  /// Constructor to accept the error message.
  EditNoteFailure(this.errorMessage);
}
