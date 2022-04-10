import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryIDOne {
  String baseUrl =
      "http://news.sanjibsinha.com/wp-json/wp/v2/posts?_embed&categories=1";

  Future<List> getAllPostsByCategoryIDOne() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error("Error Fetching Data");
    }
  }
}
