import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginProvider extends BaseBloc {
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool isButtonEnabled = false;
  bool isObscureText = true;
  Size? size;

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    size = MediaQuery.of(context).size;
    setLoading(false);
  }

  setIsButtonEnabled(bool value) {
    isButtonEnabled = value;
    notifyListeners();
  }

  void checkForm() {
    // print("${phoneCtrl.text} is lenth ${phoneCtrl.text.length}");
    // if (phoneCtrl.text.length >= 15 && usernameCtrl.text.length >= 4) {
    //   setIsButtonEnabled(true);
    // } else {
    //   setIsButtonEnabled(false);
    // }
  }

  void toVerification(BuildContext context) {
    //TODO check
    setIsSendRequest(true);

    setIsSendRequest(false);
  }

  void setReverisObscured() {
    isObscureText = !isObscureText;
    notifyListeners();
  }
}
