import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/domain/use_cases/user/get_users_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'users_bloc_event.dart';
part 'users_bloc_state.dart';
part 'users_bloc_status.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final GetUsersUseCase _getUsersUseCase;

  UsersBloc(
    this._getUsersUseCase,
  ) : super(const UsersBlocState(UsersBlocStatus.Loading)) {
    add(const GetUsersEvent());
  }

  @override
  Stream<UsersBlocState> mapEventToState(UsersBlocEvent event) => event.when(
        getUsers: _getUsers,
      );

  Stream<UsersBlocState> _getUsers() async* {
    yield _loadingState();
    yield await _getUsersUseCase
        .getUsers(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdXVpZCI6ImM5MDFkYmQ3LWYwMDgtNGNiMy04NTliLThlNzA1NjU3MTgxNCIsImF1dGhvcml6ZWQiOnRydWUsImV4cCI6MTYxODY3MjY2MSwidXNlcl9pZCI6NH0.ZMMJ6VCDG6w6cY4sd9bqrD9SL8n9eQyJGSkYHiDs1zc')
        .then((List<User> users) =>
            UsersBlocState(UsersBlocStatus.Loaded, users: users))
        .catchError(_errorState);
  }

  UsersBlocState _loadingState() => UsersBlocState(
        UsersBlocStatus.Loading,
        users: state.users,
      );

  UsersBlocState _errorState(Object error) => UsersBlocState(
        UsersBlocStatus.Error,
        users: state.users,
        error: error,
      );
}
