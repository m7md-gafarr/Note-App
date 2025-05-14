import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app/src/core/utils/constant.dart';
import 'package:note_taking_app/src/data/model/NoteModel.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  /// Edits an existing note in the Hive box at a specific index.
  ///
  /// [notemodel] The updated note data.
  /// [index] The index where the note should be updated in the Hive box.
  Future<void> editNote({
    required Notemodel notemodel,
    required int index,
  }) async {
    emit(EditNoteLoading());

    try {
      var box = Hive.box<Notemodel>(hiveBox);
      await box.putAt(index, notemodel);
      emit(EditNoteSuccess());
    } catch (e) {
      emit(EditNoteFailure(e.toString()));
    }
  }
}
