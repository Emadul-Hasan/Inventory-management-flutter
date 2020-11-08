import 'package:flutter/material.dart';
import 'inputformforaddcomponent.dart';

class RowWithInputForm extends StatelessWidget {
  RowWithInputForm(
      {this.leftFormHintText,
      this.rightFormHintText,
      this.leftfunction,
      this.rightfunction});
  final String leftFormHintText;
  final String rightFormHintText;
  final Function leftfunction;
  final Function rightfunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 2.0,
          ),
          InputForm(
            hintText: leftFormHintText,
            function: leftfunction,
          ),
          SizedBox(
            width: 2.0,
          ),
          InputForm(
            hintText: rightFormHintText,
            function: rightfunction,
          ),
          SizedBox(
            width: 2.0,
          )
        ],
      ),
    );
  }
}
