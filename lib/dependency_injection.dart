import 'package:deforestation_detection_admin/converters/entities/group_from_dto_factory.dart';
import 'package:deforestation_detection_admin/converters/entities/group_to_dto_factory.dart';
import 'package:deforestation_detection_admin/converters/entities/user_from_dto_factory.dart';
import 'package:deforestation_detection_admin/converters/entities/user_to_dto_factory.dart';
import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/gateways/api_authentication_gateway.dart';
import 'package:deforestation_detection_admin/data/gateways/api_group_gateway.dart';
import 'package:deforestation_detection_admin/data/gateways/api_provider.dart';
import 'package:deforestation_detection_admin/data/gateways/api_user_gateway.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/data/repositories/api_group_repository.dart';
import 'package:deforestation_detection_admin/data/repositories/api_user_repository.dart';
import 'package:deforestation_detection_admin/data/services/api_login_service.dart';
import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/domain/repositories/group_repository.dart';
import 'package:deforestation_detection_admin/domain/repositories/user_repository.dart';
import 'package:deforestation_detection_admin/domain/services/login_service.dart';
import 'package:deforestation_detection_admin/domain/use_cases/group/create_group_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/group/delete_group_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/group/get_groups_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/group/update_group_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/login/login_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/user/create_user_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/user/delete_user_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/user/get_users_use_case.dart';
import 'package:deforestation_detection_admin/domain/use_cases/user/update_user_use_case.dart';
import 'package:deforestation_detection_admin/presentation/blocs/groups/groups_bloc.dart';
import 'package:deforestation_detection_admin/presentation/blocs/login/login_bloc.dart';
import 'package:deforestation_detection_admin/presentation/blocs/users/users_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<ApiProvider>(() => ApiProvider());

  sl.registerLazySingleton<Factory<User, UserDto>>(() => UserFromDtoFactory());

  sl.registerLazySingleton<ApiAuthenticationGateWay>(
      () => ApiAuthenticationGateWay(sl.get()));
  sl.registerLazySingleton<LoginService>(
      () => ApiLoginService(sl.get(), sl.get()));
  sl.registerLazySingleton<LoginUseCase>(() => ApiLoginUseCase(sl.get()));
  sl.registerLazySingleton<LoginBloc>(() => LoginBloc(sl.get()));

  sl.registerLazySingleton<ApiUserGateWay>(() => ApiUserGateWay(sl.get()));
  sl.registerLazySingleton<Factory<UserDto, User>>(() => UserToDtoFactory());
  sl.registerLazySingleton<UserRepository>(
      () => ApiUserRepository(sl.get(), sl.get(), sl.get()));
  sl.registerLazySingleton<GetUsersUseCase>(() => ApiGetUsersUseCase(sl.get()));
  sl.registerLazySingleton<CreateUserUseCase>(
      () => ApiCreateUserUseCase(sl.get()));
  sl.registerLazySingleton<UpdateUserUseCase>(
      () => ApiUpdateUserUseCase(sl.get()));
  sl.registerLazySingleton<DeleteUserUseCase>(
      () => ApiDeleteUserUseCase(sl.get()));
  sl.registerLazySingleton<UsersBloc>(
      () => UsersBloc(sl.get(), sl.get(), sl.get(), sl.get()));

  sl.registerLazySingleton<ApiGroupGateWay>(() => ApiGroupGateWay(sl.get()));
  sl.registerLazySingleton<Factory<Group, GroupDto>>(
      () => GroupFromDtoFactory(sl.get()));
  sl.registerLazySingleton<Factory<GroupDto, Group>>(
      () => GroupToDtoFactory(sl.get()));
  sl.registerLazySingleton<GroupRepository>(
      () => ApiGroupRepository(sl.get(), sl.get(), sl.get()));
  sl.registerLazySingleton<GetGroupsUseCase>(
      () => ApiGetGroupsUseCase(sl.get()));
  sl.registerLazySingleton<CreateGroupUseCase>(
      () => ApiCreateGroupUseCase(sl.get()));
  sl.registerLazySingleton<UpdateGroupUseCase>(
      () => ApiUpdateGroupUseCase(sl.get()));
  sl.registerLazySingleton<DeleteGroupUseCase>(
      () => ApiDeleteGroupUseCase(sl.get()));
  sl.registerLazySingleton<GroupsBloc>(
      () => GroupsBloc(sl.get(), sl.get(), sl.get(), sl.get()));
}
