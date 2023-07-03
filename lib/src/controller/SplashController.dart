import 'dart:async';

import 'package:get/get.dart';
import 'package:or_simulator/src/cores/routes/appRoutes.dart';
import 'package:or_simulator/src/cores/routes/routeNames.dart';

class SplashController extends GetxController{

  splashMethod() {
    Timer(Duration(seconds: 6), () {
      Get.offAndToNamed(AppRoutes.homeScreen);
    });
  }
  @override
  void onInit() {
splashMethod();
super.onInit();
  }
}