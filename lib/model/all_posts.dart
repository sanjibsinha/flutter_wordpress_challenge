import 'dart:convert';
import 'package:http/http.dart' as http;

/// fourth and fifth steps to test latest post by category ID

class AllPosts {
  String baseURLForAllPosts =
      'http://news.sanjibsinha.com/wp-json/wp/v2/posts?_embed';

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
}
