import 'package:flutter/material.dart';


class Routes {
  static const String mainRoute = "/";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";

  static Map<String, WidgetBuilder> get routes {
    return {
      // splash: (context) => const SplashScreen(),
      // signIn: (context) => SignIn(),
      // login: (context) => LoginScreen(),
      // signUp: (context) => SignUp(),
    };
  }
}
