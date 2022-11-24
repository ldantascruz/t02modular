import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_ap/app_controller.dart';
import 'package:modular_ap/authentication_module/authentication_module.dart';

import 'home_module/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<AppController>(
          (i) => AppController(),
        ),
        Bind.singleton<Dio>(
          (i) => Dio(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthenticationModule(),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
