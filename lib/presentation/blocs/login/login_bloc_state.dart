part of 'login_bloc.dart';

@immutable
class LoginBlocState {
  final LoginBlocStatus status;
  final Object? error;

  const LoginBlocState(
      this.status, {
        this.error,
      });
}
