import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:kettik_diplom/app/main/app_model.dart';
import 'package:kettik_diplom/app/main/navigator_state.dart';
import 'package:kettik_diplom/app/main/no_internet_screen.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/shared/theme.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;

  MyApp({required this.model});

  @override
  Widget build(BuildContext context) {
    return BaseProvider<MyAppModel>(
      model: model,
      builder: (context, model, child) {
        return StreamBuilder<Object>(
          stream: model.connectionStatusController.stream,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Kettik',
              navigatorKey: GlobalVariable.navState,
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                // backgroundColor: Colors.white,
                fontFamily: 'Manrope',
              ),
              home: snapshot.data == ConnectivityResult.none ||
                      snapshot.data == null
                  ? const NoInternetScreen()
                  : model.getHomeScreen(),
            );
          },
        );
      },
    );
  }
}
