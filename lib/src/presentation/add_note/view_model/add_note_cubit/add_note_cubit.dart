import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app/src/core/utils/constant.dart';
import 'package:note_taking_app/src/data/model/NoteModel.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  /// Adds a new note to the Hive database
  Future<void> addNote({required Notemodel noteModel}) async {
    emit(AddNoteLoading());

    try {
      // Open the Hive box and add the note model
      var box = await Hive.openBox<Notemodel>(hiveBox);
      await box.add(noteModel);

      // Emit success state after note is added
      emit(AddNoteSuccess());
    } catch (e) {
      // Emit failure state if an error occurs
      emit(AddNoteFailure(e.toString()));
    }
  }
}
