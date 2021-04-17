import 'package:deforestation_detection_admin/converters/entities/user_from_dto_factory.dart';
import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/gateways/api_user_gateway.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/data/repositories/api_user_repository.dart';
import 'package:deforestation_detection_admin/domain/repositoies/user_repository.dart';
import 'package:deforestation_detection_admin/domain/use_cases/user/get_users_use_case.dart';
import 'package:deforestation_detection_admin/presentation/blocs/users/users_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/entities/user.dart';

final GetIt sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<Factory<User, UserDto>>(() => UserFromDtoFactory());
  sl.registerLazySingleton<ApiUserGateWay>(() => ApiUserGateWay());
  sl.registerLazySingleton<UserRepository>(
      () => ApiUserRepository(sl.get(), sl.get()));
  sl.registerLazySingleton<GetUsersUseCase>(() => ApiGetUsersUseCase(sl.get()));
  sl.registerLazySingleton<UsersBloc>(() => UsersBloc(sl.get()));
}
