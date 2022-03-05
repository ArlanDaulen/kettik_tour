import 'package:flutter/cupertino.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:rive/rive.dart';

class TourhunterProvider extends BaseBloc {
  late RiveAnimationController tourHunterAnimationController;

  init(BuildContext context) async {
    setLoading(true);
    SizeConfig().init(context);
    tourHunterAnimationController = OneShotAnimation(
      'Animation 1',
      autoplay: false,
    );

    setLoading(false);
    notifyListeners();
  }

  void changeTourHunterAnimation() {
    if (tourHunterAnimationController.isActive) {
      tourHunterAnimationController.isActive = false;
    } else {
      tourHunterAnimationController.isActive = true;
    }
  }
}
