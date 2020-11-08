import 'package:flutter/material.dart';
import 'package:credo_inventory/utility/constant.dart';

class InputForm extends StatelessWidget {
  InputForm({this.hintText, this.function});

  final Function function;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          enabledBorder: KoutlineInputBorder,
          focusedBorder: KoutlineInputBorder,
        ),
        onChanged: function,
      ),
    );
  }
}
