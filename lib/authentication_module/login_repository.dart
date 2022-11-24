import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<bool> hasLoggedUSer();
  Future<void> login();
  Future<void> recoveryPassword({required String userName});
  Future<void> createAccount();
}

class AuthRepositoryImpl extends AuthRepository {
  final Dio client;

  AuthRepositoryImpl(this.client);
  @override
  Future<void> createAccount() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<bool> hasLoggedUSer() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 1));
    await client.get(
      '/login',
      options: Options(
        headers: {
          'userName': 'username',
          'password': 'password',
        },
      ),
    );
  }

  @override
  Future<void> recoveryPassword({required String userName}) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
