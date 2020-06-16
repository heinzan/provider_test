import 'dart:async';

import 'package:providertest/core/models/user_vo.dart';
import 'package:providertest/di/setup_locator.dart';
import 'package:providertest/services/network/api.dart';

class AuthService {
  Api _api = locator<Api>();
  StreamController<UserVo> userController = StreamController<UserVo>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
