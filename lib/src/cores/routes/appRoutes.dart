


import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:or_simulator/src/cores/routes/routeNames.dart';
import 'package:or_simulator/src/view/MyHomeScreen/myhomeScreen.dart';
import 'package:or_simulator/src/view/SplashScreen/SplashScreen.dart';
import 'package:or_simulator/src/view/screens/homeScreen.dart';
class AppRoutes {

  static String homeScreen = "/homeScreen";
  static String myhomeScreen = "/myhomeScreen";
  static String splashScreen = "/splashScreen";


  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: homeScreen,
        page: () => HomeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: myhomeScreen,
        page: () => MyHomeScreen(),
        transition: Transition.fadeIn),

    GetPage(
        name: splashScreen,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),

  ];
}
// class AppRoutes {  static const splashScreen = '/splashScreen';
//
// static final routes = [
//
//     // GetPage(
//     //   name: RouteNames.homeScreen,
//     //   page: () =>  MyHomeScreen(),
//     // ),
//     GetPage(
//       name: splashScreen,
//       page: () =>  SplashScreen(),
//     ),
//
//   ];
// }
