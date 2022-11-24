import '../../login_repository.dart';

class LoginController {
  final AuthRepository repository;

  LoginController(this.repository);

  Future<void> login({required String user, required String password}) async {
    await repository.login();
  }
}
