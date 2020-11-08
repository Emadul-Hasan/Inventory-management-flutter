import 'package:flutter/material.dart';

class ExpandedCardContainer extends StatelessWidget {
  ExpandedCardContainer(
      {this.fieldName, this.cardColor, this.widthInFlex, this.alignment});

  final String fieldName;
  final Color cardColor;
  final int widthInFlex;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widthInFlex,
      child: Card(
        color: cardColor,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
            ),
          ),
          alignment: alignment,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
          child: Text(
            fieldName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
