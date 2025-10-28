import 'package:uuid/uuid.dart';
import 'package:version_3_22_8/features/login/model/models.dart';

class UserRepository {
  User? user;

  UserRepository({this.user});

  Future<User?> getUser() async {
    if (user != null) return user;

    return Future.delayed(const Duration(milliseconds: 300),
        () => user = User(id: const Uuid().v4()));
  }
}
