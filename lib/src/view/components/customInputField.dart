import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  var controller ;
   CustomInputField({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      controller: controller,

      decoration:  InputDecoration(

          fillColor: Colors.deepPurple,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
            // borderRadius: BorderRadius.circular(25.0),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)
          )
      ),
    );
  }
}
