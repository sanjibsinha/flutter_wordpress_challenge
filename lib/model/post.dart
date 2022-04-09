import 'dart:convert';
import 'package:http/http.dart' as http;

/// fourth test to test latest post by category ID

class Post {
  String baseURLForAllPosts =
      'http://news.sanjibsinha.com/wp-json/wp/v2/posts?_embed';

  String latestPostsByCategoryID =
      'http://news.sanjibsinha.com/wp-json/wp/v2/latest-posts/';

  Future<List> getAllPosts() async {
    try {
      var response = await http.get(Uri.parse(baseURLForAllPosts));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      throw '$e';
    }
  }

  Future<List> getPostsByCategoryID(int id) async {
    String latestPosts = '$latestPostsByCategoryID/$id';
    try {
      var response = await http.get(Uri.parse(latestPosts));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      throw '$e';
    }
  }
}
