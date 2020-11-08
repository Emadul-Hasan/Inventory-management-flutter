import 'package:flutter/material.dart';

class ExpandedCard extends StatelessWidget {
  ExpandedCard({this.value, this.inputname, this.cardcolor});
  final String value;
  final String inputname;
  final Color cardcolor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Card(
        color: cardcolor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 25.0,
                color: Color(0xFFBDBDBD),
                width: double.maxFinite,
                child: Text(
                  '$inputname',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                ' \n$value',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
