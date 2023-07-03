import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonOptionButton extends StatelessWidget {
  String buttonName;
   CommonOptionButton({Key? key ,required this.buttonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 5.h,

      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Center(child: Text(buttonName,style: TextStyle(fontSize: 15.sp,color: Colors.white),)),
    );
  }
}
