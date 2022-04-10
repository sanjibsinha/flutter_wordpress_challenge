import 'dart:convert';
import 'package:http/http.dart' as http;

/// fourth and fifth steps to test latest post by category ID

class AllCategories {
  String baseURLForAllCategories =
      'http://news.sanjibsinha.com/wp-json/wp/v2/categories';

  Future<List> getAllCategories() async {
    try {
      var response = await http.get(Uri.parse(baseURLForAllCategories));
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
