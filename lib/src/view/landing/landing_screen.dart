import 'dart:ui';

import 'package:financial_app/src/view/login/login_screen.dart';
import 'package:financial_app/src/view/sign-up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_elevated_button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static const route = '/';

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQueryData.fromView(View.of(context)).size.width;
    double height = MediaQueryData.fromView(View.of(context)).size.height;

    return SafeArea(
      child: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/bg_landing.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRect(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 200,
              ),
              width: width,
              height: height,
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthElevatedButton(
                            text: 'Entrar',
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.route);
                            },
                          ),
                          const SizedBox(height: 30),
                          AuthElevatedButton(
                            text: 'Cadastre-se!',
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(SignUpScreen.route);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
