import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphName extends StatelessWidget {
 final  String graphName;
   GraphName({Key? key, required this.graphName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 55.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(graphName,
              style: TextStyle(
                  fontSize: 15.sp, color: Colors.white)),
        ));
  }
}
