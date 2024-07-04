import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app/const/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  EditNote({required Notemodel notemodel, required int index}) async {
    emit(EditNoteLoading());

    try {
      //
      var box = Hive.box<Notemodel>(hiveBox);
      await box.putAt(index, notemodel);
      emit(EditNoteSuccess());
      //
    } catch (e) {
      emit(EditNoteFailear(e.toString()));
    }
  }
}
