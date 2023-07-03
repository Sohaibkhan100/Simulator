import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/gantDataModel.dart';

class SingleServerGanttChart extends StatelessWidget {
  List<Customer> customers;

  SingleServerGanttChart({required this.customers});

  @override
  Widget build(BuildContext context) {
    int serverCompletionTime = 0;

    return Container(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context,index)=>Icon(Icons.arrow_forward,color: Colors.white,size: 40,),

        scrollDirection: Axis.horizontal,
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          final arrivalTime = customer.arrivalTime;
          final serviceTime = customer.serviceTime;

          // Assign customer to the available server
          if (serverCompletionTime <= arrivalTime) {
            customer.server = 1;
            customer.waitingTime = 0;
            serverCompletionTime = arrivalTime + serviceTime;
          } else {
            // Server is busy, calculate waiting time and update completion time
            customer.server = 1;
            customer.waitingTime = serverCompletionTime - arrivalTime;
            serverCompletionTime += (serviceTime);
          }

          final updatedArrivalTime = arrivalTime + customer.waitingTime;
          final startOffset = (serverCompletionTime < updatedArrivalTime)
              ? updatedArrivalTime
              : serverCompletionTime;

          final endOffset = startOffset + serviceTime;

          return CircleAvatar(
            radius: 50,
            backgroundColor: (customer.server == 1) ? Colors.deepPurple : Colors.deepOrange,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,              children: [
                  Text(
                    'Arr: $updatedArrivalTime',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  Text(
                    'Svc: $serviceTime',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
