part of 'users_bloc.dart';

@immutable
@freezed
abstract class UsersBlocEvent with _$UsersBlocEvent {
  const UsersBlocEvent._();

  const factory UsersBlocEvent.getUsers() = GetUsersEvent;
}