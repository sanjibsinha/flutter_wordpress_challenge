import 'package:flutter/material.dart';

import '../../model/category_id_four.dart';
import '../../model/happy_theme.dart';
import '../post_detail.dart';

/// in sixth step, we will try to get posts by category ID
///

class PostsByCategoryIDFour extends StatefulWidget {
  const PostsByCategoryIDFour({Key? key}) : super(key: key);

  @override
  State<PostsByCategoryIDFour> createState() => _PostsByCategoryIDFourState();
}

class _PostsByCategoryIDFourState extends State<PostsByCategoryIDFour> {
  @override
  void initState() {
    super.initState();
    CategoryIDFour().getAllPostsByCategoryIDFour();
  }

  @override
  Widget build(BuildContext context) {
    CategoryIDFour postsOfCategoryIDFour = CategoryIDFour();
    return Scaffold(
      backgroundColor: HappyTheme.shrineErrorRed,
      appBar: AppBar(
        backgroundColor: HappyTheme.shrineBrown600,
        title: Text(
          'Flutter WordPress',
          style: HappyTheme.appbarStyle,
        ),
      ),
      body: Center(
        child: Container(
          color: HappyTheme.shrinePink300,
          margin: const EdgeInsets.all(8.0),
          child: FutureBuilder<List>(
            future: postsOfCategoryIDFour.getAllPostsByCategoryIDFour(),
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
                      child: ListTile(
                        title: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                width: 150,
                                height: 150,
                                child: Image.network(snapshot.data![index]
                                        ['_embedded']['wp:featuredmedia'][0]
                                    ['source_url']),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  snapshot.data![index]['title']['rendered'],
                                  style: HappyTheme.titleStyle,
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
                            style: HappyTheme.contentStyle,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostDetail(
                                data: snapshot.data![index],
                              ),
                            ),
                          );
                        },
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
