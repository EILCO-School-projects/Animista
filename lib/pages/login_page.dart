import 'package:animista/api/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  final authService = GetIt.I<AuthService>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login-wallpaper.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Image.asset('assets/images/logo.png')),
                    Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                            width: screenWidth * 0.60,
                            height: 45,
                            child: SignInButton(Buttons.google,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                text: "Continue with Google",
                                onPressed: () async {
                              await authService.signInWithGoogle();
                            }))),
                  ])),
        ],
      ),
    );
  }
}
