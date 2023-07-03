

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:or_simulator/src/controller/randomResultScreenController.dart';

import '../../services/gantDataModel.dart';



class MultiServerGanttChart extends StatelessWidget {
  List<Customer> customers=[];
  MultiServerGanttChart({required this.customers});

  @override
  Widget build(BuildContext context) {

    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    int server1CompletionTime = 0;
    int server2CompletionTime = 0;
    return Container(
      height: 100,
      child: GetBuilder(
        init: randomResultScreenController,
        builder: (_) {
          return ListView.separated(
            separatorBuilder: (context,index)=>Icon(Icons.arrow_forward,color: Colors.white,size: 40,),
            scrollDirection: Axis.horizontal,
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              final arrivalTime = customer.arrivalTime;
              var serviceTime = customer.serviceTime;

              // Assign customer to the available server
              if (server1CompletionTime <= arrivalTime) {
                customer.server = 1;
                customer.waitingTime = 0;
                server1CompletionTime = arrivalTime + serviceTime;
              } else if (server2CompletionTime <= arrivalTime) {
                customer.server = 2;
                customer.waitingTime = 0;
                server2CompletionTime = arrivalTime + serviceTime;
              } else {
                // Both servers are busy, assign to the server with the earliest completion time
                if (server1CompletionTime <= server2CompletionTime) {
                  customer.server = 1;
                  customer.waitingTime = server1CompletionTime - arrivalTime;
                  server1CompletionTime += (serviceTime);
                } else {
                  customer.server = 2;
                  customer.waitingTime = server2CompletionTime - arrivalTime;
                  server2CompletionTime += (serviceTime);
                }
              }

              final updatedArrivalTime = arrivalTime + customer.waitingTime;
              final startOffset = (customer.server == 1)
                  ? (server1CompletionTime < updatedArrivalTime)
                  ? updatedArrivalTime
                  : server1CompletionTime
                  : (server2CompletionTime < updatedArrivalTime)
                  ? updatedArrivalTime
                  : server2CompletionTime;

              final endOffset = startOffset + serviceTime;
              serviceTime+=updatedArrivalTime;



              return CircleAvatar(
                radius: 50,
                backgroundColor: (customer.server == 1) ? Colors.deepPurple : Colors.deepOrange,

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text(
                        'ST: $updatedArrivalTime',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),


                      Text(
                        'ET: $serviceTime',
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}