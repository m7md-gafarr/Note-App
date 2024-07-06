import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'edit_avatar_state.dart';

class EditAvatarCubit extends Cubit<EditAvatarState> {
  EditAvatarCubit() : super(EditAvatarInitial());
  String? Path;

  EditAndAddAvatar(String path) async {
    emit(EditAvatarLoading());

    SharedPreferences Prefs = await SharedPreferences.getInstance();
    Prefs.setString("avatarpath", path);

    emit(EditAvatarSuccess());
  }

  ShowAvatar() async {
    emit(EditAvatarLoading());

    SharedPreferences Prefs = await SharedPreferences.getInstance();
    Path = Prefs.getString("avatarpath")!;

    emit(EditAvatarSuccess());
  }
}
