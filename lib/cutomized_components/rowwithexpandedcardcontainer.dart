import 'package:flutter/material.dart';

import 'expandedcontainercard.dart';

class RowWithExpandedCardContainer extends StatelessWidget {
  RowWithExpandedCardContainer({this.value, this.color, this.fieldName});
  final String fieldName;
  final String value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpandedCardContainer(
          alignment: Alignment.centerLeft,
          fieldName: fieldName,
          cardColor: color,
          widthInFlex: 1,
        ),
        ExpandedCardContainer(
          alignment: Alignment.centerLeft,
          cardColor: color,
          widthInFlex: 2,
          fieldName: value,
        ),
      ],
    );
  }
}
