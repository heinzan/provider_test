import 'package:dio/dio.dart';
import 'package:providertest/core/models/post_vo.dart';
import 'package:providertest/core/models/user_vo.dart';

class Api{
  Response response;
  Dio dio = new Dio();
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  Future<UserVo> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await dio.get('$endpoint/users/$userId');

    // Convert and return
    return UserVo.fromJson(response.data);
  }

  Future<List<PostVo>> getPostsForUser(int userId) async {
    var posts = List<PostVo>();
    // Get user posts for id
    var response = await dio.get('$endpoint/posts?userId=$userId');

    // parse into List
    var parsed = response.data as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(PostVo.fromJson(post));
    }

    return posts;
  }
/*
  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    var response = await client.get('$endpoint/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }*/

}