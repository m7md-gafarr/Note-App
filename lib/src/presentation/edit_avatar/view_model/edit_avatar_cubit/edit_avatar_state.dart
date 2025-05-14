part of 'edit_avatar_cubit.dart';

@immutable
abstract class EditAvatarState {}

final class EditAvatarInitial extends EditAvatarState {}

final class EditAvatarLoading extends EditAvatarState {}

final class EditAvatarSuccess extends EditAvatarState {}

final class EditAvatarNoAvatar extends EditAvatarState {}

final class EditAvatarError extends EditAvatarState {
  String errorMessage;
  EditAvatarError(this.errorMessage);
}
