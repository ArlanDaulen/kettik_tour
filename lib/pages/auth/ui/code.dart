import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/auth/provider/code_provider.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<CodeProvider>(
        builder: (context, model, child) {
          return Container();
        },
        model: CodeProvider());
  }
}
