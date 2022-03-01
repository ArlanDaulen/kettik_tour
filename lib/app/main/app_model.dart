import 'dart:async';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_bloc.dart';
import 'package:kettik_diplom/pages/auth/ui/login.dart';
import 'package:kettik_diplom/pages/index/ui/index.dart';
import 'package:kettik_diplom/pages/onboarding/provider/onboarding_provider.dart';
import 'package:kettik_diplom/pages/onboarding/ui/onboarding.dart';
import 'package:kettik_diplom/shared/size_config.dart';

import 'user_data.dart';

class MyAppModel extends BaseBloc {
  final UserData _userData = UserData();
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();
  var _isAuthenticated = false;
  var _isOnboardingSkipped = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isOnboardingSkipped => _isOnboardingSkipped;

  init() async {
    log('init called');
    await checkOnboardinIsSkipped();
    var result = await Connectivity().checkConnectivity();
    log('result from init is: $result');
    connectionStatusController.add(result);
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      log('Internet result is: $result');
      connectionStatusController.add(result);
    });
  }

  Future<void> checkOnboardinIsSkipped() async {
    _isOnboardingSkipped = await _userData.getUserOnboardingSkipped();
  }

  Future<void> checkAuth() async {
    String? token = await _userData.getToken();
    log('token from init is $token');
    _isAuthenticated = token != "";
  }

  Widget getHomeScreen() {
    log("isAuthed: $isAuthenticated");
    if (!_isAuthenticated) {
      return const LoginScreen();
    }
    if (isOnboardingSkipped) {
      return const IndexScreen();
    }
    return const OnboardingScreen();
  }
}
