import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:or_simulator/src/controller/randomResultScreenController.dart';

class RandsimScreen extends StatelessWidget {

  const RandsimScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());

    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.black,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("StartTime",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("End Time",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("Turnaround time",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("wait time",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("response time",style: TextStyle(color: Colors.white),)),
          ],
          rows: [
            for (int i = 0; i <10; i++)
              DataRow(cells: [
                DataCell(Text(randomResultScreenController.startTimeList[i].toString(),style: TextStyle(color: Colors.white),)),
                DataCell(randomResultScreenController.servers.value==2?Text(randomResultScreenController.endTimeList[i].toString(),style: TextStyle(color: Colors.white),):
                Text(randomResultScreenController.endTimeList[i+1].toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(randomResultScreenController.turnAroundTimeList[i].toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(randomResultScreenController.waitTimeList[i].toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(randomResultScreenController.responseTimeList[i].toString(),style: TextStyle(color: Colors.white),)),
              ])
          ],
        ),
      ),
    );
  }
}
