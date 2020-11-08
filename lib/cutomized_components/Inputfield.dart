import 'package:flutter/material.dart';
import 'package:credo_inventory/utility/constant.dart';

class Inputfield extends StatelessWidget {
  Inputfield(
      {this.margin,
      this.hintText,
      this.prefixicon,
      this.function,
      this.obscuretext,
      this.keyBoardtype});

  final double margin;
  final Icon prefixicon;
  final String hintText;
  final bool obscuretext;
  final Function function;
  final TextInputType keyBoardtype;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      width: KFieldWidth,
      height: KFieldHeight,
      child: TextField(
        keyboardType: keyBoardtype,
        obscureText: obscuretext,
        onChanged: function,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          prefixIcon: prefixicon,
          enabledBorder: KoutlineInputBorder,
          focusedBorder: KoutlineInputBorder,
        ),
      ),
    );
  }
}
