import 'package:flutter/material.dart';
import 'package:providertest/ui/views/home_view.dart';
import 'package:providertest/ui/views/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
/*      case 'post':
        return MaterialPageRoute(builder: (_) => PostView());*/
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}