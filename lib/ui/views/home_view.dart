import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/core/models/post_vo.dart';
import 'package:providertest/core/models/user_vo.dart';
import 'package:providertest/core/viewmodels/hoem_viewmodel.dart';
import 'package:providertest/di/setup_locator.dart';
import 'package:providertest/ui/shared/app_color.dart';
import 'package:providertest/ui/shared/text_style.dart';
import 'package:providertest/ui/shared/ui_helper.dart';
import 'package:providertest/ui/widget/post_list_item.dart';
import 'package:providertest/util/view_state.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeViewState();
  }


}

class HomeViewState extends State<HomeView> {
  HomeViewModel hvm = locator<HomeViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    hvm.getPosts(2);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => hvm,
      child: Consumer<HomeViewModel>(
          builder: (context , model , child){
            return Scaffold(
                backgroundColor: backgroundColor,
                body: model.state == ViewState.Busy
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UIHelper.verticalSpaceLarge(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Welcome ${Provider.of<UserVo>(context).name}',
                        style: headerStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Here are all your posts',
                          style: subHeaderStyle),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Expanded(child: getPostsUi(model.posts)),
                  ],)
            );
          }),
    );

  }

  Widget getPostsUi(List<PostVo> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
        post: posts[index],
        onTap: () {
          Navigator.pushNamed(context, 'post', arguments: posts[index]);
        },
      )
  );
}
