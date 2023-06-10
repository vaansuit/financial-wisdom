import 'dart:ui';

import 'package:financial_app/src/view/home/home_screen.dart';
import 'package:financial_app/src/view/sign-up/sign_up_screen.dart';
import 'package:financial_app/src/view/widgets/auth_elevated_button.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const route = '/loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQueryData.fromView(View.of(context)).size.width;
    double height = MediaQueryData.fromView(View.of(context)).size.height;

    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg_landing.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ClipRect(
            child: SingleChildScrollView(
              child: FittedBox(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 150,
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
                              AuthTextFormField(
                                icon: const Icon(
                                  Icons.email,
                                ),
                                hintText: 'Email',
                              ),
                              const SizedBox(height: 30),
                              AuthTextFormField(
                                icon: const Icon(
                                  Icons.visibility_off,
                                ),
                                hintText: 'Senha',
                                obscureText: true,
                              ),
                              const SizedBox(height: 30),
                              AuthElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(HomeScreen.route);
                                },
                                text: 'Entrar',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 20,
                                    ),
                                    width: width * 0.8,
                                    height: 5,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Não tem uma conta?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(SignUpScreen.route);
                                    },
                                    child: const Text(
                                      'Cadastre-se!',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
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
        ),
      ),
    );
  }
}
