import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_ap/authentication_module/login_repository.dart';
import 'package:modular_ap/authentication_module/pages/create_account/create_account_controller.dart';
import 'package:modular_ap/authentication_module/pages/create_account/create_account_page.dart';
import 'package:modular_ap/authentication_module/pages/login/login_controller.dart';
import 'package:modular_ap/authentication_module/pages/login/login_page.dart';
import 'package:modular_ap/authentication_module/pages/recovery_password/recovery_password_controller.dart';
import 'package:modular_ap/authentication_module/pages/recovery_password/recovery_password_page.dart';
import 'package:modular_ap/authentication_module/pages/splash/splash_page.dart';

import 'pages/splash/splash_controller.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //Repository
        Bind.factory<AuthRepository>(
          (i) => AuthRepositoryImpl(
            i.get<Dio>(),
          ),
        ),
        Bind.factory(
          (i) => SplashController(
            i.get<AuthRepository>(),
          ),
        ),
        Bind.lazySingleton(
          (i) => LoginController(
            i.get<AuthRepository>(),
          ),
        ),
        Bind.factory(
          (i) => CreateAccountController(
            i.get<AuthRepository>(),
          ),
        ),
        Bind.factory(
          (i) => RecoveryPasswordController(
            i.get<AuthRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const SplashPage(),
        ),
        ChildRoute(
          '/login',
          child: (_, args) => const LoginPage(),
        ),
        ChildRoute(
          '/create_account',
          child: (_, args) => const CreateAccountPage(),
        ),
        ChildRoute(
          '/recovery_password',
          child: (_, args) => const RecoveryPasswordPage(),
        ),
      ];
}
