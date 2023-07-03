
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:or_simulator/src/controller/randomResultScreenController.dart';
import 'package:or_simulator/src/view/screens/MGSscreen.dart';
import 'package:or_simulator/src/view/screens/randsimResultScreen.dart';

import 'GraphicalResultScreen.dart';

class RandomDataScreen extends StatelessWidget {
  const RandomDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return DefaultTabController(

        length: 3,
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Colors.black,
            bottom:  TabBar(
              indicatorColor: Colors.deepPurple,

              // isScrollable: false,
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Tab(
                    child: Container(

                      height: 50,
                      width: 130,
                      decoration: BoxDecoration( color: Colors.deepPurple.withOpacity(0.6),borderRadius: BorderRadius.circular(20)),
                      child:Center(child: Text("Random Data")) ,

                    ),
                  ),
                ),
                Tab(
                  child: Container(

                    height: 50,
                    width: 130,
                    decoration: BoxDecoration( color: Colors.deepPurple.withOpacity(0.6),borderRadius: BorderRadius.circular(20)),
                    child:Center(child: Text("Random Data")) ,

                  ),
                    // text: "Randsim Data"
                ),
                Tab(
                  child: Container(

                    height: 50,
                    width: 130,
                    decoration: BoxDecoration( color: Colors.deepPurple.withOpacity(0.6),borderRadius: BorderRadius.circular(20)),
                    child:Center(child: Text("Graphical view")) ,

                  ),
                ),
              ],
            ),
          ),
          body:  TabBarView(

            // physics: NeverScrollableScrollPhysics(),

            children: [
              MGSscreen(),
              const  RandsimScreen(),
              GraphicalResultScreen(),
            ],
          ),
        ));
  }
}
