import 'package:douban_try01/views/movie/movie_page.dart';
import 'package:flutter/material.dart';

class FlutterTabBarView extends StatelessWidget{
  final TabController tabController;
  FlutterTabBarView({Key key, @required this.tabController}) :super(key:key);
  @override
  Widget build(BuildContext context) {
    var viewList = [
      MoviePage(key: PageStorageKey<String>('MoviePage'),),
      Page1(),
      Page2(),
      Page3(),
      Page4(),
      Page5(),
    ];
    return TabBarView(
      children: viewList,
      controller: tabController,
    );
  }
  
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page1');

    return Center(
      child: Text('电视'),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page2');
    return Center(
      child: Text('综艺'),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page3');
    return Center(
      child: Text('读书'),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page4');
    return Center(
      child: Text('音乐'),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page5');
    return Center(
      child: Text('同城'),
    );
  }
}