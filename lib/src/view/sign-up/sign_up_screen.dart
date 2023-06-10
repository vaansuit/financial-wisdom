import 'dart:ui';

import 'package:financial_app/src/view/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_elevated_button.dart';
import '../widgets/auth_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const route = '/signUpScreen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    vertical: 60,
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
                              Text(
                                'Crie sua conta!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 183, 1,
                                            158), // Base blue color
                                        Colors
                                            .white, // Lighter color towards the right
                                      ],
                                    ).createShader(
                                      const Rect.fromLTWH(200, 0, 30, 0),
                                    ),
                                ),
                              ),
                              AuthTextFormField(
                                icon: const Icon(
                                  Icons.email,
                                ),
                                hintText: 'Nome de usuário',
                              ),
                              const SizedBox(height: 30),
                              AuthTextFormField(
                                icon: const Icon(
                                  Icons.visibility_off,
                                ),
                                hintText: 'Email',
                                obscureText: true,
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
                              AuthTextFormField(
                                icon: const Icon(
                                  Icons.visibility_off,
                                ),
                                hintText: 'Confirmar Senha',
                                obscureText: true,
                              ),
                              const SizedBox(height: 30),
                              AuthElevatedButton(
                                onPressed: () {},
                                text: 'Registrar',
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
                                    'Já tem uma conta?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(LoginScreen.route);
                                    },
                                    child: const Text(
                                      'Faça-login!',
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
