import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:or_simulator/src/controller/randomResultScreenController.dart';


class MGSscreen extends StatelessWidget {
   MGSscreen({Key? key}) : super(key: key);
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.black,
        child: DataTable(
          headingRowColor:
          MaterialStateColor.resolveWith((states) => Colors.black),
          columns: const [
            DataColumn(label: Text("S/NO",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("Commulitave probab",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("CP-lookup",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("Interarrival time",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("Arrival",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("arrival time",style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text("service time",style: TextStyle(color: Colors.white),)),
          ],
          rows: [
            for (int i = 0; i < 10; i++)
              DataRow(
                  cells: [
                DataCell(Text(list[i].toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(randomResultScreenController.probablityList[i]
                    .toStringAsFixed(4).toString(),style: TextStyle(color: Colors.white),)),
                DataCell(i==0?Text(i.toString(),style: TextStyle(color: Colors.white),):Text(randomResultScreenController.probablityList[i-1]
                    .toStringAsFixed(4).toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(i.toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(randomResultScreenController.interArrivalList[i].toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(randomResultScreenController.arrivalList[i].toString(),style: TextStyle(color: Colors.white),)),
                DataCell(Text(randomResultScreenController.serviceList[i].toString(),style: TextStyle(color: Colors.white),)),
              ])
          ],
        ),
      ),
    );
  }
}
