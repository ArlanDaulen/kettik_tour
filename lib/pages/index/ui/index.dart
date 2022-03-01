import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/index/provider/index_provider.dart';
import 'package:kettik_diplom/pages/liked/ui/liked.dart';
import 'package:kettik_diplom/pages/my_tour/ui/my_tour.dart';
import 'package:kettik_diplom/pages/profile/ui/profile.dart';
import 'package:kettik_diplom/pages/search/ui/search.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
        onReady: (p0) => p0.init(context),
        builder: (context, model, child) {
          return Scaffold(
            body: ValueListenableBuilder<int>(
                valueListenable:
                    model.controller.bottomNavigationBar.tabNotifier,
                builder: (context, tabIndex, child) => _body[tabIndex]),
            bottomNavigationBar: SizedBox(
              height: 40,
              child: ScrollBottomNavigationBar(
                currentIndex: model.bottomIndex,
                iconSize: 40,
                onTap: (index) {
                  model.setBottomIndex(index);
                },
                controller: model.controller,
                items: _items,
              ),
            ),
          );
        },
        model: IndexProvider());
  }
}

var _body = const [
  SearchScreen(),
  LikedScreen(),
  MyTourScreen(),
  ProfileScreen()
];

var _items = const [
  BottomNavigationBarItem(
      icon: Icon(Icons.search, color: Colors.red), label: ""),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety_rounded,
      ),
      label: ""),
  BottomNavigationBarItem(icon: Icon(Icons.bug_report), label: ""),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
];
