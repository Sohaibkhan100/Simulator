import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreenButton extends StatelessWidget {
 final String buttonText;
 final Color borderColor;
 final Color buttonColor;

   MainScreenButton({Key? key, required this.buttonText, required this.borderColor, required this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepPurple,

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(buttonText,style: TextStyle(fontSize: 15.sp,color: Colors.white),)),
      ),
    );
  }
}
