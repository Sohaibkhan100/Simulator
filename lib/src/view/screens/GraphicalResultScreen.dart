import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:or_simulator/src/controller/gantChartController.dart';
import 'package:or_simulator/src/controller/randomResultScreenController.dart';
import 'package:or_simulator/src/view/components/LineChart.dart';
import 'package:or_simulator/src/view/components/barGraph.dart';
import 'package:or_simulator/src/view/components/customGantChartMultiServer.dart';
import 'package:or_simulator/src/view/components/customGantChartSingleServer.dart';
import 'package:or_simulator/src/view/components/graphName.dart';
import 'package:or_simulator/src/view/components/statsResult.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphicalResultScreen extends StatelessWidget {
  GraphicalResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChartController chartController = Get.put(ChartController());
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());
    return GetBuilder(
        init: randomResultScreenController,
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: Text(
                  "GantChart",
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                )),
                SizedBox(
                  height: 3.h,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Center(
                    child: randomResultScreenController.servers.value == 2
                        ? MultiServerGanttChart(
                            customers:
                                randomResultScreenController.gantChartData)
                        : SingleServerGanttChart(
                            customers:
                                randomResultScreenController.gantChartData),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Text(
                            "Customer Time Distribution",
                            style: TextStyle(fontSize: 18.sp,color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Container(


                          // height: 40.h,
                          child: PieChart(
                            chartRadius: 220,
                            dataMap: chartController.dataMap,
                            legendOptions: LegendOptions(legendTextStyle: TextStyle(color: Colors.white)),
                            chartValuesOptions: ChartValuesOptions(
                              chartValueBackgroundColor: Colors.white,
                                showChartValuesInPercentage: true),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                // Center(
                //   child: Text(
                //     "Statistical analysis of data",
                //     style: TextStyle(fontSize: 16.sp),
                //   ),
                // ),
                // SizedBox(
                //   height: 3.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     StatsResult(
                //         parameter: "Avg Turn around time",
                //         time: 2,
                //         color: Colors.black),
                //     StatsResult(
                //         parameter: "Avg Wait time",
                //         time: 2,
                //         color: Colors.blue),
                //     StatsResult(
                //         parameter: "Avg Service time",
                //         time: 2,
                //         color: Colors.red),
                //     StatsResult(
                //         parameter: "Avg Inter Arrival time",
                //         time: 2,
                //         color: Colors.green)
                //   ],
                // ),
                // SizedBox(height: 3.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     StatsResult(
                //         parameter: "Avg Wait Time",
                //         time: 2,
                //         color: Colors.black),
                //     StatsResult(
                //         parameter: "Server1 Idle Time",
                //         time: 2,
                //         color: Colors.black),
                //     StatsResult(
                //         parameter: "Server 1 Utilization Time",
                //         time: 2,
                //         color: Colors.green),
                //     StatsResult(
                //         parameter: "Server 2 Idle",
                //         time: 2,
                //         color: Colors.black),
                //     StatsResult(
                //         parameter: "Server 2 Utilization Time",
                //         time: 2,
                //         color: Colors.green)
                //   ],
                // ),
                // SizedBox(height: 2.h),
              ],
            ),
          );
        });
  }
}
