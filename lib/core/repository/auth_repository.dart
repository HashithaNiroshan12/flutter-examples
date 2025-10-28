import 'package:version_3_22_8/core/domain/model/user.dart';

class AuthRepsotory {
  UserModel? _currentUser;

  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'test@exmaple.com' && password == '1234') {
      _currentUser = UserModel(id: '1', name: 'Test User', email: email);
      return _currentUser!;
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = null;
  }

  UserModel? get currentUser => _currentUser;
}
