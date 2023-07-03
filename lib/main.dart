
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_simulator/src/Utils/ColorConstants.dart';
import 'package:or_simulator/src/cores/routes/routeNames.dart';
import 'package:or_simulator/src/view/SplashScreen/SplashScreen.dart';
import 'package:or_simulator/src/view/screens/homeScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'src/cores/routes/appRoutes.dart';

// import 'package:flutter_voip_kit/app_routes.dart';
// import 'package:flutter_voip_kit/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
      return GetMaterialApp(

        theme: ThemeData(primarySwatch: Colors.deepPurple,scaffoldBackgroundColor: Colors.black,    textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: whiteColor),
          ),
        ),),
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes,

        initialRoute: AppRoutes.splashScreen,
        // home:  SplashScreen(),
      );
    });
  }
}
