import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/auth/provider/login_provider.dart';
import 'package:kettik_diplom/pages/auth/provider/register_provider.dart';
import 'package:kettik_diplom/pages/auth/ui/register.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';
import 'package:kettik_diplom/shared/ui_helper.dart';
import 'package:kettik_diplom/shared/utils.dart';
import 'package:kettik_diplom/widgets/custom_container.dart';
import 'package:kettik_diplom/widgets/default_button.dart';
import 'package:kettik_diplom/widgets/loading_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<LoginProvider>(
        onReady: (_) => _.init(context),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UIHelper.verticalSpace(
                        getProportionateScreenHeight(190),
                      ),
                      Text(
                        'Добро пожаловать!',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenWidth(24),
                            color: AppColors.systemBlackColor),
                      ),
                      UIHelper.verticalSpace(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Введите ваш номер телефона для входа.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: AppColors.systemDarkGrayColor,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(30),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: CustomContainer(
                          child: TextField(
                            controller: model.loginCtrl,
                            onChanged: (String value) {
                              model.checkForm();
                            },
                            keyboardType: TextInputType.text,
                            cursorColor: AppColors.systemBlackColor,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person,
                                  color: AppColors.primaryColor),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: CustomContainer(
                          child: TextField(
                            controller: model.passwordCtrl,
                            onChanged: (String value) {
                              model.checkForm();
                            },
                            keyboardType: TextInputType.number,
                            obscureText: model.isObscureText,
                            obscuringCharacter: "*",
                            cursorColor: AppColors.systemBlackColor,
                            // inputFormatters: [model.phoneFormatter],
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    model.setReverisObscured();
                                  },
                                  icon: Icon(Icons.remove_red_eye_rounded,
                                      color: model.isObscureText
                                          ? AppColors.primaryColor
                                          : AppColors.systemRedColor)),
                              prefixIcon: const Icon(Icons.security,
                                  color: AppColors.primaryColor),
                              hintText: '********',
                              hintStyle: const TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  floatingActionButton: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegisterScreen()));
                          },
                          child: Text("Зарегистрироваться".toUpperCase())),
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      DefaultButton(
                        width: model.size!.width * 0.9,
                        color: model.isButtonEnabled
                            ? null
                            : AppColors.inactiveColor,
                        text: 'Дальше',
                        press: model.isButtonEnabled
                            ? () {
                                model.toVerification(context);
                              }
                            : () {
                                showCustomToast(
                                  "Номер телефона пустой или не совпадает формату",
                                );
                              },
                      ),
                    ],
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                );
        },
        model: LoginProvider());
  }
}
