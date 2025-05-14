import 'package:note/data/models/response/post_response.dart';
import 'package:note/data/providers/post_provider.dart';

class PostRepository {
  final PostProvider _provider;

  PostRepository(this._provider);

  Future<List<PostResponse>> getPosts() async {
    return await _provider.fetchPosts();
  }

  Future<List<PostResponse>> submitPosts() async {
    return await _provider.submitPosts();
  }
}
