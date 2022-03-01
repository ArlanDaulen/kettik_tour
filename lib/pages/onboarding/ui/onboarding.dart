// import 'package:animated_onboarding/animated_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/onboarding/provider/onboarding_provider.dart';

import 'animated_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<OnboardingProvider>(
        onReady: (p0) => p0.init(context),
        builder: (context, model, child) {
          return Scaffold(
            body: AnimatedOnboarding(
                pages: model.pages,
                pageController: model.controller,
                onFinishedButtonTap: () {
                  model.setIsOnboardingSkipped(true);
                  model.goToHomeScreen(context);
                },
                topLeftChild: Container(),
                topRightChild: Container()),
          );
        },
        model: OnboardingProvider());
  }
}
