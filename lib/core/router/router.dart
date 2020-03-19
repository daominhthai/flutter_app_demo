import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/ui/views/home_view.dart';
import 'package:flutter_app_demo/ui/views/login_view.dart';
import 'package:flutter_app_demo/ui/views/register_view.dart';
import 'package:flutter_app_demo/ui/views/splash_screen.dart';

class Router {
  static const String main = '/';
  static const String home = 'home';
  static const String splash = 'splash';
  static const String login = 'login';
  static const String register = 'register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => route(settings),
        settings: RouteSettings(name: settings.name));
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return SplashScreen();
      case home:
        return HomeView();
      case login:
        return LoginView();
      case register:
        return RegisterView();
      default:
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
