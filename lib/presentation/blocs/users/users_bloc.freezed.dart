// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UsersBlocEventTearOff {
  const _$UsersBlocEventTearOff();

  GetUsersEvent getUsers() {
    return const GetUsersEvent();
  }
}

/// @nodoc
const $UsersBlocEvent = _$UsersBlocEventTearOff();

/// @nodoc
mixin _$UsersBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUsersEvent value) getUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUsersEvent value)? getUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersBlocEventCopyWith<$Res> {
  factory $UsersBlocEventCopyWith(
          UsersBlocEvent value, $Res Function(UsersBlocEvent) then) =
      _$UsersBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UsersBlocEventCopyWithImpl<$Res>
    implements $UsersBlocEventCopyWith<$Res> {
  _$UsersBlocEventCopyWithImpl(this._value, this._then);

  final UsersBlocEvent _value;
  // ignore: unused_field
  final $Res Function(UsersBlocEvent) _then;
}

/// @nodoc
abstract class $GetUsersEventCopyWith<$Res> {
  factory $GetUsersEventCopyWith(
          GetUsersEvent value, $Res Function(GetUsersEvent) then) =
      _$GetUsersEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetUsersEventCopyWithImpl<$Res>
    extends _$UsersBlocEventCopyWithImpl<$Res>
    implements $GetUsersEventCopyWith<$Res> {
  _$GetUsersEventCopyWithImpl(
      GetUsersEvent _value, $Res Function(GetUsersEvent) _then)
      : super(_value, (v) => _then(v as GetUsersEvent));

  @override
  GetUsersEvent get _value => super._value as GetUsersEvent;
}

/// @nodoc
class _$GetUsersEvent extends GetUsersEvent with DiagnosticableTreeMixin {
  const _$GetUsersEvent() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsersBlocEvent.getUsers()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UsersBlocEvent.getUsers'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetUsersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsers,
  }) {
    return getUsers();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsers,
    required TResult orElse(),
  }) {
    if (getUsers != null) {
      return getUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUsersEvent value) getUsers,
  }) {
    return getUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUsersEvent value)? getUsers,
    required TResult orElse(),
  }) {
    if (getUsers != null) {
      return getUsers(this);
    }
    return orElse();
  }
}

abstract class GetUsersEvent extends UsersBlocEvent {
  const factory GetUsersEvent() = _$GetUsersEvent;
  const GetUsersEvent._() : super._();
}
