import 'package:flutter/material.dart';
import 'expandedcard.dart';

class RowWithExpandedCard extends StatelessWidget {
  RowWithExpandedCard(
      {this.leftFieldName,
      this.leftValue,
      this.leftCardColor,
      this.rightFieldName,
      this.rightValue,
      this.rightCardColor});

  final String leftValue;
  final String leftFieldName;
  final String rightFieldName;
  final String rightValue;
  final Color leftCardColor;
  final Color rightCardColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExpandedCard(
            inputname: leftFieldName,
            value: leftValue,
            cardcolor: leftCardColor),
        ExpandedCard(
            inputname: rightFieldName,
            value: rightValue,
            cardcolor: rightCardColor),
      ],
    );
  }
}
