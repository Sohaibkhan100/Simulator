
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:or_simulator/src/controller/randomResultScreenController.dart';
import 'package:or_simulator/src/view/components/MGSdialogContainer.dart';
import 'package:or_simulator/src/view/screens/randomDataScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/button.dart';
import '../components/dialogBoxContainer.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerlamda = TextEditingController();
    TextEditingController controllermiu = TextEditingController();
    TextEditingController controllerServers = TextEditingController();
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());
    TextEditingController controllerLambda = TextEditingController();
    TextEditingController upper = TextEditingController();
    TextEditingController lower = TextEditingController();
    TextEditingController server = TextEditingController();
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
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 25.h,),
                        InkWell(
                          child: CommonOptionButton(buttonName: "M/M/S"),
                          onTap: () {
                            Get.defaultDialog(
                              backgroundColor: Color(0xff292e2a),
                                title: 'M/M/Servers(s)',
                                titleStyle: TextStyle(color: Colors.white),
                                content: DialogBoxContainer(
                                  controller1: controllerlamda,
                                  controller2: controllermiu,
                                  controller3: controllerServers,
                                  tap: () {
                                    randomResultScreenController.mean.value =
                                        double.parse(controllerlamda.text.toString());
                                    randomResultScreenController.meanService.value =
                                        double.parse(controllermiu.text.toString());
                                    randomResultScreenController.servers.value =
                                    int.tryParse(controllerServers.text.toString())!;
                                    randomResultScreenController
                                        .calculateProbablityUsingPoisson();

                                    randomResultScreenController
                                        .interArrivalTimeCalculator();
                                    randomResultScreenController.calculateArrivalList();
                                    randomResultScreenController.serviceTimeCalculator();
                                    if (randomResultScreenController.servers.value == 1) {
                                      randomResultScreenController
                                          .calculateUpdatedArrivalTimes();
                                      randomResultScreenController
                                          .calculateTurnAroundTimeforSingle();
                                      randomResultScreenController.calculateWaitTime();
                                      randomResultScreenController.calculateResponseTime();
                                      randomResultScreenController.initializeGantChart();
                                    }
                                    if (randomResultScreenController.servers.value == 2) {
                                      randomResultScreenController
                                          .calculateStartAndEndTime();
                                      randomResultScreenController
                                          .calculateTurnAroundTimeforDouble();
                                      randomResultScreenController.calculateWaitTime();
                                      randomResultScreenController.calculateResponseTime();
                                      randomResultScreenController.initializeGantChart();
                                    }
                                    print(randomResultScreenController.endTimeList);
                                    print(randomResultScreenController.arrivalList);
                                    Get.to(const RandomDataScreen());
                                  },
                                ));
                          },
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                            onTap: (){
                              Get.defaultDialog(
                                backgroundColor: Color(0xff292e2a),

                                  title: "M/G/S",
                                  titleStyle: TextStyle(color: Colors.white),
                                  content: MGSdefaultDialog(
                                    controller1: controllerLambda, controller2: upper, controller3: lower, controller4: server,
                                    tap: (){
                                      randomResultScreenController.mean.value =
                                          double.parse(controllerLambda.text.toString());

                                      randomResultScreenController.upperLimit.value =
                                          int.parse(upper.text.toString());

                                      randomResultScreenController.lowerLimit.value = int.parse(lower.text.toString());
                                      randomResultScreenController.servers.value =
                                      int.tryParse(server.text.toString())!;

                                      print(randomResultScreenController.lowerLimit.toString());
                                      print(randomResultScreenController.lowerLimit.toString());
                                      print(randomResultScreenController.arrivalList);
                                      print(randomResultScreenController.serviceList);


                                      randomResultScreenController
                                          .calculateProbablityUsingPoisson();
                                      randomResultScreenController
                                          .interArrivalTimeCalculator();
                                      randomResultScreenController.calculateArrivalList();
                                      // randomResultScreenController.serviceTimeCalculator();
                                      randomResultScreenController.calculateMGserviceTime();
                                      if (randomResultScreenController.servers.value == 1) {
                                        randomResultScreenController
                                            .calculateUpdatedArrivalTimes();
                                        randomResultScreenController
                                            .calculateTurnAroundTimeforSingle();
                                        randomResultScreenController.calculateWaitTime();
                                        randomResultScreenController.calculateResponseTime();
                                        randomResultScreenController.initializeGantChart();
                                      }
                                      if (randomResultScreenController.servers.value == 2) {
                                        randomResultScreenController
                                            .calculateStartAndEndTime();
                                        randomResultScreenController
                                            .calculateTurnAroundTimeforDouble();
                                        randomResultScreenController.calculateWaitTime();
                                        randomResultScreenController.calculateResponseTime();
                                        randomResultScreenController.initializeGantChart();
                                      }
                                      print(randomResultScreenController.endTimeList);
                                      print(randomResultScreenController.arrivalList);
                                      Get.to(const RandomDataScreen());


                                      Get.to( const RandomDataScreen());

                                    },
                                  )
                              );

                              // Get.to(MGSoptions());
                            },
                            child: CommonOptionButton(buttonName: "M/G/S")),
                        SizedBox(
                          height: 2.h,
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
