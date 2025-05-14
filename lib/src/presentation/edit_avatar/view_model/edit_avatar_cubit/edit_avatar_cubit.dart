import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'edit_avatar_state.dart';

class EditAvatarCubit extends Cubit<EditAvatarState> {
  EditAvatarCubit() : super(EditAvatarInitial());

  // Store the avatar path
  String? avatarPath;

  // Method to save the avatar path and emit success state
  Future<void> saveAvatar(String path) async {
    emit(EditAvatarLoading());

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("avatarPath", path); // Save avatar path

      emit(EditAvatarSuccess());
    } catch (error) {
      // Handle error if needed (e.g., emit an error state)
      emit(EditAvatarError(error.toString()));
    }
  }

  // Method to load the saved avatar path
  Future<void> loadAvatar() async {
    emit(EditAvatarLoading());

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      avatarPath = prefs.getString("avatarPath");

      if (avatarPath != null) {
        emit(EditAvatarSuccess());
      } else {
        // Handle the case when no avatar path is found (optional)
        emit(EditAvatarNoAvatar());
      }
    } catch (error) {
      // Handle error if needed (e.g., emit an error state)
      emit(EditAvatarError(error.toString()));
    }
  }
}
