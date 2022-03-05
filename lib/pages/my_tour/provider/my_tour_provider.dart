import 'package:flutter/cupertino.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:rive/rive.dart';

class MyTourProvider extends BaseBloc {
  late RiveAnimationController myTourAnimationController;

  init(BuildContext context) async {
    setLoading(true);
    myTourAnimationController = OneShotAnimation(
      'jump',
      autoplay: false,
    );
    setLoading(false);
    notifyListeners();
  }

  void changeMyTourAnimation() {
    if (myTourAnimationController.isActive) {
      myTourAnimationController.isActive = false;
    } else {
      myTourAnimationController.isActive = true;
    }
  }

}
