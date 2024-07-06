import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_avatar_state.dart';

class EditAvatarCubit extends Cubit<EditAvatarState> {
  EditAvatarCubit() : super(EditAvatarInitial());
  String? path;
  EditAvatarFun() {
    emit(EditAvatarSuccess());
  }
}
