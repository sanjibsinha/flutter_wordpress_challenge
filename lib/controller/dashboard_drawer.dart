import 'package:flutter/material.dart';
import '../model/all_pages.dart';
import '../view/page_detail.dart';
//import 'package:flutter_wordpress_api_get_post/services/page.dart';

class DashBoardDrawer extends StatefulWidget {
  const DashBoardDrawer({Key? key}) : super(key: key);

  @override
  _DashBoardDrawerState createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<DashBoardDrawer> {
  AllPages allPages = AllPages();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.pinkAccent[200],
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(5.0),
              child: FutureBuilder<List>(
                future: allPages.getAllPages(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No Page"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Center(
                              child: Text(
                                snapshot.data?[i]['title']['rendered'],
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PageDetail(data: snapshot.data?[i]),
                                ),
                              )
                            },
                          );
                        });
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
            ))
          ],
        ),
      ),
    );
  }
}
