import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_ap/authentication_module/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    Modular.dispose<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Modular.get<LoginController>().login(
                user: 'user@example.com',
                password: 'password@password',
              );
              Modular.to.pushReplacementNamed('/home/');
            },
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}
