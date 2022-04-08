import 'package:flutter/material.dart';
import 'package:flutter_wordpress_challenge/model/happy_theme.dart';

import '../model/post.dart';

/// added content

class FlutterWordPressHomePage extends StatefulWidget {
  const FlutterWordPressHomePage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<FlutterWordPressHomePage> createState() =>
      _FlutterWordPressHomePageState();
}

class _FlutterWordPressHomePageState extends State<FlutterWordPressHomePage> {
  @override
  void initState() {
    super.initState();
    Post().getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    Post posts = Post();
    return Scaffold(
      backgroundColor: HappyTheme.shrineErrorRed,
      appBar: AppBar(
        backgroundColor: HappyTheme.shrineBrown600,
        title: Text(
          widget.title,
          style: HappyTheme.appbarStyle,
        ),
      ),
      body: Center(
        child: Container(
          color: HappyTheme.shrinePink300,
          margin: const EdgeInsets.all(8.0),
          child: FutureBuilder<List>(
            future: posts.getAllPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No Post available.'),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10.0,
                      shadowColor: HappyTheme.shrineErrorRed,
                      color: HappyTheme.inactiveCoor,
                      child: ListTile(
                        title: Row(
                          children: [
                            /* Expanded(
                              child: Image.network(snapshot.data![index]
                                      ['_embeded']['wp:featuredmedia'][0]
                                  ['source_url']),
                            ), */
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  snapshot.data![index]['title']['rendered'],
                                  style: HappyTheme.answerStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data![index]['content']['rendered']
                                .toString()
                                .replaceAll('<p>', '')
                                .replaceAll('</p>', '')
                                .replaceAll('<strong>', '')
                                .replaceAll('</strong>', ''),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
