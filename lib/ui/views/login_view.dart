import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/core/viewmodels/login_viewmodel.dart';
import 'package:providertest/di/setup_locator.dart';
import 'package:providertest/ui/shared/app_color.dart';
import 'package:providertest/ui/views/base_view.dart';
import 'package:providertest/ui/widget/login_header.dart';
import 'package:providertest/util/view_state.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => locator<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(
                    validationMessage: model.errorMessage,
                    controller: _controller),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(_controller.text);
                          if (loginSuccess) {
                            Navigator.pushNamed(context, '/');
                          }
                        },
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
