import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';

class IndexProvider extends BaseBloc {
  int bottomIndex = 0;
  final controller = ScrollController();
  List<BottomNavigationBarItem>? items;

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    items = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.search_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(40),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.search_active_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(40),
        ),
        label: 'Поиск',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.tourhunter_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(50),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.tourhunter_active_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(50),
        ),
        label: 'Турхантер',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.myTour_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(45),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.myTour_active_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(45),
        ),
        label: 'Мой тур',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.profile_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(50),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.profile_active_ic,
          width: getProportionateScreenHeight(50),
          height: getProportionateScreenHeight(50),
        ),
        label: 'Профиль',
      ),
    ];
    setLoading(false);
  }

  setBottomIndex(int index, context) {
    if (bottomIndex == 0) {
      Navigator.pop(context);
    }
    bottomIndex = index;

    notifyListeners();
  }
}
