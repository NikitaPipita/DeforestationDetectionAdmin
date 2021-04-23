import 'package:deforestation_detection_admin/domain/use_cases/login/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';
part 'login_bloc_status.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase)
      : super(const LoginBlocState(LoginBlocStatus.Logout));

  @override
  Stream<LoginBlocState> mapEventToState(LoginBlocEvent event) => event.when(
        login: _login,
      );

  Stream<LoginBlocState> _login(String email, String password) async* {
    yield await _loginUseCase
        .login(email, password)
        .then((_) => const LoginBlocState(LoginBlocStatus.Login))
        .catchError(_errorState);
  }

  LoginBlocState _errorState(Object error) => LoginBlocState(
        LoginBlocStatus.Error,
        error: error,
      );
}
