import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  String baseURL =
      'http://news.sanjibsinha.com/wp-json/wp/v2/posts?_embed';

  Future<List> getAllPosts() async {
    try {
      var response = await http.get(Uri.parse(baseURL));
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
