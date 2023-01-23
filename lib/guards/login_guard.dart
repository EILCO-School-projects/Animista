import 'package:animista/api/services/auth_service.dart';
import 'package:animista/models/user.model.dart';
import 'package:animista/pages/home_page.dart';
import 'package:animista/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoginGuard extends StatelessWidget {
  static const String routeName = '/';
  final authService = AuthService();

  LoginGuard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<AppUser?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final AppUser? user = snapshot.data;
            return user == null ? LoginPage() : const HomePage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
