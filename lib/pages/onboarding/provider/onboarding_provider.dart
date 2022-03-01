// import 'package:animated_onboarding/animated_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kettik_diplom/app/main/user_data.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/pages/index/ui/index.dart';
import 'package:kettik_diplom/pages/onboarding/ui/animated_onboarding.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';

class OnboardingProvider extends BaseBloc {
  Size? size;
  PageController controller = PageController();
  List<OnboardingPage> pages = [];
  final UserData _userData = UserData();

  init(BuildContext context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setPages();
    setLoading(false);
  }

  setPages() {
    pages = [
      OnboardingPage(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SvgPicture.asset(
                AppSvgImages.onboarding_1,
                width: size!.width,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Находите самые горячие туры по выгодной цене",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.systemBlackColor,
                          fontSize: getProportionateScreenHeight(20),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text("Самые топовые туры по всей стране",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.systemDarkGrayColor,
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ),
        color: Colors.white,
      ),
      OnboardingPage(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SvgPicture.asset(
                AppSvgImages.onboarding_2,
                width: size!.width,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Будьте в безопасности во время путешествия",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          // shadows: const <Shadow>[
                          //   Shadow(
                          //     offset: Offset(1.0, 1.0),
                          //     blurRadius: 3.0,
                          //     color: Color.fromARGB(255, 0, 0, 0),
                          //   ),
                          //   Shadow(
                          //     offset: Offset(1.0, 1.0),
                          //     blurRadius: 8.0,
                          //     color: Color.fromARGB(125, 0, 0, 255),
                          //   ),
                          // ],
                          fontSize: getProportionateScreenHeight(20),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text("Сақтықта қорлық жоқ!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // shadows: const <Shadow>[
                          //   Shadow(
                          //     offset: Offset(1.0, 1.0),
                          //     blurRadius: 3.0,
                          //     color: Color.fromARGB(255, 0, 0, 0),
                          //   ),
                          //   Shadow(
                          //     offset: Offset(1.0, 1.0),
                          //     blurRadius: 8.0,
                          //     color: Color.fromARGB(125, 0, 0, 255),
                          //   ),
                          // ],
                          color: Colors.white,
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
        // color: const Color(0xff56adff),
        color: const Color(0xff5e70a0),
      ),
      OnboardingPage(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SvgPicture.asset(
                AppSvgImages.onboarding_3,
                width: size!.width,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("KETTIK!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.systemBlackColor,
                          fontSize: getProportionateScreenHeight(20),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text("Темаго ТЕМА!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.systemDarkGrayColor,
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ),
        color: Colors.blue.withOpacity(0.45),
      ),
    ];
  }

  void goToHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => IndexScreen()), (route) => false);
  }

  void setIsOnboardingSkipped(bool value) {
    _userData.setUserOnboardingSkipped(value);
  }

//TODO check onboarding skipped
//TODO set onboarding skipped
}
