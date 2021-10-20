import 'package:creator4all_qrocde/pages/home%20page/home..dart';
import 'package:creator4all_qrocde/pages/login%20page/Login.dart';
import 'package:creator4all_qrocde/shared/models/user.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(
            builder: (_) => HomePge(user: arguments as User));

      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
