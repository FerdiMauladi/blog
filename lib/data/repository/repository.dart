import 'package:blog/data/model/login_model.dart';
import 'package:blog/data/model/post_model.dart';

abstract class Repository {
  Future<LoginModel> login(String username, String password);
  Future register(
      {required String email, required String password, required String name, required String username});
  Future logout();
  Future<List<PostModel>> getPost();
  Future<PostModel> getPostId(String token, String id);
  Future<PostModel> deletePostId(String token, String id);
  Future<PostModel> postBlog({required PostModel postModel, required String token});
  Future<PostModel> updateBlog({required PostModel postModel, required String token, required String id});
}