
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:or_simulator/src/cores/routes/appRoutes.dart';
import 'package:or_simulator/src/view/components/dialogBoxContainer.dart';
import 'package:or_simulator/src/view/components/mainPageContainer.dart';
import 'package:or_simulator/src/view/screens/optionsScreen.dart';
import 'package:or_simulator/src/view/screens/randomDataScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/randomResultScreenController.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());
    TextEditingController controllerlamda = TextEditingController();
    TextEditingController controllermiu = TextEditingController();
    TextEditingController controllerServers = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              // leading: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Lottie.asset("assets/images/lf20_4tyanb7k.json",height: 100,width: 100),
              // ),
              // actions: [Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Lottie.asset("assets/images/lf20_4tyanb7k.json",height: 100,width: 40.w),
              // ),],
              centerTitle: true,
              backgroundColor: Colors.black,
              // pinned: true,
              expandedHeight: 110,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20.0, top: 20, left: 20, right: 20),
                  child: Center(
                    child: Text(
                      "SIMULATOR",
                      style: Theme.of(context).textTheme.bodyLarge?.merge(
                          TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  // child: Image.asset(
                  //   "assets/images/LEIS Logo Landscape 03.png",
                  //   height: 100,
                  //   width: 200,
                  // ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                      (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     SizedBox(height: 25.h,),

                        MainPageContainer(

                          buttonText: "RANDOM",
                          colors: Colors.black,
                          textColors: Colors.white,
                          borderColor: Colors.white,
                          buttonColor: Colors.blue,
                          onTap: () {
                            Get.to(OptionScreen());

                          },
                        ),
                        MainPageContainer(

                          buttonText: "QUEUING MODEL",
                          colors: Colors.black,
                          textColors: Colors.blue,
                          borderColor: Colors.white,
                          buttonColor: Colors.blue,
                          onTap: () {
                            Get.toNamed(AppRoutes.myhomeScreen);
                          },
                        ),

                      ],
                    );
                  },
                ))
          ],
        ),
      ),
    );





  }
}
