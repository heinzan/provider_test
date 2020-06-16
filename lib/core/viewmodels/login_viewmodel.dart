import 'package:providertest/core/models/user_vo.dart';
import 'package:providertest/core/viewmodels/base_viewmodel.dart';
import 'package:providertest/di/setup_locator.dart';
import 'package:providertest/services/network/api.dart';
import 'package:providertest/services/network/auth_service.dart';
import 'package:providertest/util/view_state.dart';

class LoginViewModel extends BaseViewModel{
  final AuthService _authenticationService = locator<AuthService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    // Not a number
    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);

    // Handle potential error here too.

    setState(ViewState.Idle);
    return success;
  }
}