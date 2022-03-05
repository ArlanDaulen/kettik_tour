import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/index/provider/index_provider.dart';
import 'package:kettik_diplom/pages/my_tour/ui/my_tour.dart';
import 'package:kettik_diplom/pages/profile/ui/profile.dart';
import 'package:kettik_diplom/pages/search/ui/search.dart';
import 'package:kettik_diplom/pages/touthunter/ui/tourhunter.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
      onReady: (p0) => p0.init(context),
      model: IndexProvider(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: _body[model.bottomIndex],
            // body: ValueListenableBuilder<int>(
            //   valueListenable: model.controller.bottomNavigationBar.tabNotifier,
            //   builder: (context, tabIndex, child) => _body[tabIndex],
            // ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColors.primaryColor,
              selectedFontSize: getProportionateScreenHeight(24),
              unselectedFontSize: getProportionateScreenWidth(20),
              unselectedItemColor: AppColors.systemBlackColor,
              showUnselectedLabels: true,
              currentIndex: model.bottomIndex,
              items: model.items!,
              onTap: (index) => model.setBottomIndex(index, context),
            ),
            // bottomNavigationBar: ScrollBottomNavigationBar(
            //   currentIndex: model.bottomIndex,
            //   iconSize: 20,
            //   // selectedItemColor: const Color(0xff6925A6),
            //   onTap: (index) {
            //     model.setBottomIndex(index);
            //   },
            //   controller: model.controller,
            //   items: _items,
            // ),
          ),
        );
      },
    );
  }
}

var _body = [
  SearchScreen(),
  const TourhunterPage(),
  const MyTourScreen(),
  const ProfileScreen()
];
