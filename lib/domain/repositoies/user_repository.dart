import 'package:deforestation_detection_admin/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers({String? token});

  Future<User> getUser({String? token});

  Future<void> createUser(User user, {String? token});

  Future<void> updateUser(User user, {String? token});

  Future<void> deleteUser(int id, {String? token});
}