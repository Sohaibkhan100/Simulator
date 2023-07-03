import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class DialogBoxButton extends StatelessWidget {

  const DialogBoxButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 40.w,
      decoration: BoxDecoration(      color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15)),
      child: Center
        (child: Text("Simmulate",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.sp),)),
    );
  }
}
