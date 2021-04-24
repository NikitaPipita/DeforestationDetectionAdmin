import 'package:deforestation_detection_admin/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();

  Future<User> getUser(int id);

  Future<void> createUser(User user);

  Future<void> updateUser(User user);

  Future<void> deleteUser(int id);
}