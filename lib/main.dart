import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/core/models/user_vo.dart';
import 'package:providertest/core/viewmodels/login_viewmodel.dart';
import 'package:providertest/di/setup_locator.dart';
import 'package:providertest/services/network/auth_service.dart';
import 'package:providertest/util/routes.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserVo>(
      initialData: UserVo.initial(),
      create: (BuildContext context) =>
      locator<AuthService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
