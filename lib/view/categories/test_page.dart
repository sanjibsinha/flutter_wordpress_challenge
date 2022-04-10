import 'package:flutter/material.dart';
import 'package:flutter_wordpress_challenge/model/all_categories.dart';

import '../../model/happy_theme.dart';

/// in sixth step, we will try to get posts by category ID
///

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    //CategoryIDTwo().getAllPostsByCategoryIDTwo();
    AllCategories().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    AllCategories allCategories = AllCategories();
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
            future: allCategories.getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No Categories available.'),
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
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  snapshot.data![index]['name'],
                                  style: HappyTheme.titleStyle,
                                ),
                              ),
                            ),
                          ],
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
