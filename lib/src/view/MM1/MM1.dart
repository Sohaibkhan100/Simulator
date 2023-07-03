import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:or_simulator/src/Utils/ColorConstants.dart';
import 'package:or_simulator/src/controller/MyHomeScreenController.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class MM1 extends StatelessWidget {
   MM1({Key? key}) : super(key: key);
   MyHomeScreenController myHomeScreenController = Get.put(MyHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return                                   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // height: 1000.h,
        width: MediaQuery.of(context).size.width*.9,
        color: Colors.deepPurple.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:MediaQuery.of(context).size.width*.1, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Text(
                      "Average Interarrival Time",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.merge(TextStyle(
                          fontSize: 1.5.h)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 100.w,
                  height: 50,
                  decoration: BoxDecoration(
                      color: whiteColor
                          .withOpacity(0.2),
                      borderRadius:
                      BorderRadius.circular(
                          5)),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.white),
                    cursorColor: Colors.white54,
                    controller: myHomeScreenController
                        .averageInterarrivaltimeController,
                    keyboardType:
                    TextInputType.number,
                    textInputAction:
                    TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(
                          horizontal: 20),
                      hintText:
                      "Avg Interarrival Time*",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.merge(
                        TextStyle(
                          color: blackColor,
                          fontSize: 12,
                        ),
                      ),
                      focusedBorder:
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: whiteColor,
                        ),
                      ),
                      enabledBorder:
                      OutlineInputBorder(
                        borderSide: BorderSide(
                            color: whiteColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Text(
                      "Average Service Time",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.merge(TextStyle(
                          fontSize: 1.5.h)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 100.w,
                  height: 50,
                  decoration: BoxDecoration(
                      color: whiteColor
                          .withOpacity(0.2),
                      borderRadius:
                      BorderRadius.circular(
                          5)),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.white),
                    cursorColor: Colors.white54,
                    keyboardType:
                    TextInputType.number,
                    controller: myHomeScreenController
                        .averageServicetimeController,
                    textInputAction:
                    TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(
                          horizontal: 20),
                      hintText: "Avg Service Time*",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.merge(
                        TextStyle(
                          color: blackColor,
                          fontSize: 12,
                        ),
                      ),
                      focusedBorder:
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: whiteColor,
                        ),
                      ),
                      enabledBorder:
                      OutlineInputBorder(
                        borderSide: BorderSide(
                            color: whiteColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    myHomeScreenController.mm1List.clear();
                    myHomeScreenController.update();
                    myHomeScreenController.MM1(
                        averageInterarrivalTime: int
                            .parse(myHomeScreenController
                            .averageInterarrivaltimeController
                            .text),
                        averageServiceTime: int.parse(
                            myHomeScreenController
                                .averageServicetimeController
                                .text),flag: "1");
                    myHomeScreenController.update();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.h,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                        BorderRadius.circular(
                            5)),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          "Calculate",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.merge(TextStyle(
                              fontSize: 16,
                              color:
                              whiteColor)),
                        ),
                        // SizedBox(
                        //   height: 18.h,
                        //   width: 18.h,
                        //   child: CircularProgressIndicator(
                        //     strokeWidth: 3,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                myHomeScreenController.mm1List.length==0?Text(""):
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: myHomeScreenController.mm1List.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 140,
                      crossAxisCount: 2),
                  itemBuilder:
                      (BuildContext context, int index) {
                    return Container(
                        height: 200,
                        child: SfRadialGauge(
                            enableLoadingAnimation: true, animationDuration: 4500,
                            backgroundColor: Colors.white.withOpacity(0.2),

                            axes: <RadialAxis>[
                              RadialAxis(minimum: 0, maximum: 100,
                                  ranges: <GaugeRange>[
                                    GaugeRange(startValue: 0, endValue: 10, color:Colors.green,),
                                    GaugeRange(startValue: 10,endValue: 30,color: Colors.orange),
                                    GaugeRange(startValue: 30,endValue: 100,color: Colors.red)],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(value: myHomeScreenController.mm1List[index],needleColor: Colors.white,   lengthUnit: GaugeSizeUnit.factor,
                                        needleLength: 0.6,
                                        needleStartWidth: 1, needleEndWidth: 3)],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        widget:
                                        Container(child:
                                        Text(myHomeScreenController.mm1List[index].toStringAsFixed(3),
                                            style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.white))),
                                        angle: 90, positionFactor: 0.8
                                    )]
                              )])
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
