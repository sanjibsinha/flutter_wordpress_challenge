import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<dynamic, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post detail'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              data['title']['rendered'],
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              data['content']['rendered']
                  .toString()
                  .replaceAll('<p>', '')
                  .replaceAll('</p>', '')
                  .replaceAll('<strong>', '')
                  .replaceAll('</strong>', ''),
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
