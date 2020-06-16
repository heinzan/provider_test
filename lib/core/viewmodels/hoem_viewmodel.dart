import 'package:providertest/core/models/post_vo.dart';
import 'package:providertest/core/viewmodels/base_viewmodel.dart';
import 'package:providertest/di/setup_locator.dart';
import 'package:providertest/services/network/api.dart';
import 'package:providertest/util/view_state.dart';

class HomeViewModel extends BaseViewModel{
  Api _api = locator<Api>();

  List<PostVo> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }

}