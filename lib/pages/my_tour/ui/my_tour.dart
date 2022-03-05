import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/my_tour/provider/my_tour_provider.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';
import 'package:kettik_diplom/shared/ui_helper.dart';
import 'package:kettik_diplom/widgets/custom_app_bar.dart';
import 'package:rive/rive.dart';

class MyTourScreen extends StatelessWidget {
  const MyTourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<MyTourProvider>(
      onReady: (p0) => p0.init(context),
      model: MyTourProvider(),
      builder: (context, model, child) {
        return Column(
          children: [
            CustomAppBar(title: 'Мой тур'),
            UIHelper.verticalSpace(30),
            SizedBox(
              width: getProportionateScreenWidth(500),
              height: getProportionateScreenHeight(500),
              child: RiveAnimation.asset(
                AppRiveAnimations.onboarding_my_tour_riv,
                onInit: (p0) => model.changeMyTourAnimation(),
                controllers: [model.myTourAnimationController],
              ),
            ),
            UIHelper.verticalSpace(30),
            Text(
              'Здесь булут ваши будущие заказы',
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
