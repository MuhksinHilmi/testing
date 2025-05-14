import 'package:note/core/network/api_client.dart';
import 'package:note/core/network/endpoints.dart';
import 'package:note/data/models/response/post_response.dart';
import 'dart:convert';

class PostProvider {
  final ApiClient _client;

  PostProvider(this._client);

  Future<List<PostResponse>> fetchPosts() async {
    final response = await _client.get(Endpoints.posts);
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((post) => PostResponse.fromJson(post))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<PostResponse>> submitPosts() async {
    final response = await _client.post(Endpoints.posts, body: {});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((post) => PostResponse.fromJson(post))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
