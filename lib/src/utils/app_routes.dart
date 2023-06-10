import 'package:financial_app/src/view/landing/landing_screen.dart';
import 'package:financial_app/src/view/login/login_screen.dart';
import 'package:financial_app/src/view/sign-up/sign_up_screen.dart';

var appRoutes = {
  LandingScreen.route: (context) => const LandingScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  SignUpScreen.route: (context) => const SignUpScreen(),
};
