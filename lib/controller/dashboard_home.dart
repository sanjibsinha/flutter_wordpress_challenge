import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../view/categories/posts_by_category_id_one.dart';

import 'dashboard_drawer.dart';
import '../view/latest_posts.dart';
import '../view/categories/posts_by_category_id_two.dart';
import '../view/categories/posts_by_category_id_three.dart';
import '../view/categories/posts_by_category_id_four.dart';
import '../view/categories/test_page.dart';

class DashBoardHome extends StatefulWidget {
  const DashBoardHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardHome> createState() => _DashBoardHomeState();
}

class _DashBoardHomeState extends State<DashBoardHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> topTabs = <Tab>[
    const Tab(child: Text('LATEST')),
    const Tab(child: Text('OVERALL')),
    const Tab(child: Text('BUSINESS')),
    const Tab(child: Text('ENTERTAINMENT')),
    const Tab(child: Text('FASHION')),
    const Tab(child: Text('ALL CATEGORIES')),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(const Duration(microseconds: 100), () {
      _tabController?.index = 0;
    });

    return _tabController?.index == 0;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text(
              'Flutter WordPress Challenge',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            actions: [
              Container(
                child: IconButton(
                  icon: const Icon(Icons.search),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink[300],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink[300],
                ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              tabs: topTabs,
              isScrollable: true,
            ),
          ),
          endDrawer: Container(
            padding: const EdgeInsets.all(5.0),
            child: const DashBoardDrawer(),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              /// all categories displayed on tabs
              ///
              LatestPosts(),
              PostsByCategoryIDOne(),
              PostsByCategoryIDTwo(),
              PostsByCategoryIDThree(),
              PostsByCategoryIDFour(),
              TestPage(),
            ],
          ),
        ),
      ),
    );
  }
}
