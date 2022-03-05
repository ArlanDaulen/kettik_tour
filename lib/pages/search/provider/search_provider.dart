import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/pages/search/ui/recomendation_dialog.dart';
import 'package:kettik_diplom/pages/search/ui/search_dialog.dart';
import 'package:kettik_diplom/pages/search/ui/widgets/bottom_sheets.dart';
import 'package:kettik_diplom/shared/theme.dart';

class SearchProvider extends BaseBloc {
  Size? size;
  bool isSearchTours = true;
  List<bool> isSelected = [true, false];

  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 0)).then(
      (_) => BottomSheets().showSearchBottomSheet(context),
    );
    size = MediaQuery.of(context).size;
    setLoading(false);
    // await showModalBottomSheet(
    //     context: context, builder: (context) => SearchDialog());
  }

  toggled(int index) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = true;
      } else {
        isSelected[buttonIndex] = false;
      }
    }
    notifyListeners();
  }

  // setIsSearchTours(BuildContext context, bool value) {
  //   print("is search page$value");

  //   showModalBottomSheet(
  //       context: context,
  //       // isDismissible: false,
  //       builder: (context) => value ? SearchDialog() : RecomendationDialog());
  //   isSearchTours = value;
  //   notifyListeners();
  // }
}
