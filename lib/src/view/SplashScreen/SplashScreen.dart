import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:or_simulator/src/controller/SplashController.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  SplashController splashController=Get.put(SplashController());
  @override

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
         color: Colors.black          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.2,
                ),
                Text(
                  "OPERATIONAL\n   RESEARCH",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.merge(TextStyle(
                      fontSize: 3.h,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
                ),
                Container(
                    height: 50.h,
                    width: 60.w
                    ,
                    child: Lottie.asset("assets/images/dlf10_WUQEmDIaSz.json")
                ),
                Text(
                  "Under Supervision\n  DR.Shaista Rais",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.merge(TextStyle(
                      fontSize: 2.5.h,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
                ),
                Icon(Icons.account_balance,color: Colors.white,size: 3.h,)
                // Container(
                //   height: 0.13.sh,
                //   width: 0.13.sw,
                //   child: SpinKitFoldingCube(
                //     color: Colors.white.withOpacity(0.2),
                //     duration: Duration(seconds: 5),
                //   ),
                // )

              ],
            ),
          ),
        )

    );
  }
}
