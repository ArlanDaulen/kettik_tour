import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/pages/search/ui/recomendation_dialog.dart';
import 'package:kettik_diplom/pages/search/ui/search_dialog.dart';

class SearchProvider extends BaseBloc {
  Size? size;
  bool isSearchTours = true;

  init(BuildContext context) async {
    setLoading(true);

    size = MediaQuery.of(context).size;
    setLoading(false);
    // await showModalBottomSheet(
    //     context: context, builder: (context) => SearchDialog());
  }

  setIsSearchTours(BuildContext context, bool value) {
    print("is search page$value");

    showModalBottomSheet(
        context: context,
        // isDismissible: false,
        builder: (context) => value ? SearchDialog() : RecomendationDialog());
    isSearchTours = value;
    notifyListeners();
  }
}
