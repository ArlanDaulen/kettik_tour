import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/shared/size_config.dart';

class IndexProvider extends BaseBloc {
  int bottomIndex = 0;
  final controller = ScrollController();

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }

  setBottomIndex(int index) {
    bottomIndex = index;
    notifyListeners();
  }
}
