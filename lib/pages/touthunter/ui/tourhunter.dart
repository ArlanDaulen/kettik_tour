import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/touthunter/provider/tourhunter_provider.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';
import 'package:kettik_diplom/shared/ui_helper.dart';
import 'package:kettik_diplom/widgets/custom_app_bar.dart';
import 'package:rive/rive.dart';

class TourhunterPage extends StatelessWidget {
  const TourhunterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<TourhunterProvider>(
      onReady: (p0) => p0.init(context),
      model: TourhunterProvider(),
      builder: (context, model, child) {
        return Column(
          children: [
            CustomAppBar(
              title: 'Турхантер',
            ),
            UIHelper.verticalSpace(30),
            SizedBox(
              width: getProportionateScreenWidth(500),
              height: getProportionateScreenHeight(500),
              child: RiveAnimation.asset(
                AppRiveAnimations.onboarding_tourhunter_riv,
                onInit: (p0) => model.changeTourHunterAnimation(),
                controllers: [
                  model.tourHunterAnimationController,
                ],
              ),
            ),
            UIHelper.verticalSpace(33),
            const Text(
              'Турхантер - инструмент для отслеживания\nцен на интересующие вас туры',
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Отмечайте их с помощью'),
                UIHelper.horizontalSpace(
                  getProportionateScreenWidth(20),
                ),
                SvgPicture.asset(
                  AppSvgImages.zhurek_ic,
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                ),
              ],
            ),
            UIHelper.verticalSpace(10),
            const Text(
              'и не упустите свой шанс отдохнуть\nпо лучшей цене',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        );
      },
    );
  }
}
