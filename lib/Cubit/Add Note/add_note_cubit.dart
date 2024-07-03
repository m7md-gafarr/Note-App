import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  AddNote({required Notemodel notemodel}) async {
    emit(AddNoteLoading());

    try {
      //
      var box = Hive.box<Notemodel>(hiveBox);
      await box.add(notemodel);
      emit(AddNoteSuccess());
      //
    } catch (e) {
      emit(AddNoteFailear(e.toString()));
    }
  }
}
