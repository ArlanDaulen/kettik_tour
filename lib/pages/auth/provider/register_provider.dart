import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterProvider extends BaseBloc {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController rePasswordCtrl = TextEditingController();
  bool isObscureText = true;

  var phoneFormatter = MaskTextInputFormatter(
      mask: '(###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool isButtonEnabled = false;
  Size? size;

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    size = MediaQuery.of(context).size;
    setLoading(false);
  }

  void checkForm() {}

  void toVerification(BuildContext context) {}

  void setReverisObscured() {
    isObscureText = !isObscureText;
    notifyListeners();
  }
}
