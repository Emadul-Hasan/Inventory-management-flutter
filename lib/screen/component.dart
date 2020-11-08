import 'package:credo_inventory/cutomized_components/expandedcard.dart';
import 'package:credo_inventory/cutomized_components/rowwithexpandedcard.dart';
import 'package:flutter/material.dart';

class ComponentPage extends StatefulWidget {
  @override
  _ComponentPageState createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  String value = '20uF';
  String quantity = '500';
  String location = 'Box 01';
  String description =
      'project1, project 2,voltage:250v, concentration: high, solution don\' know';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component Details '),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Text(
              'Capacitor- 20uF',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          RowWithExpandedCard(
            leftFieldName: 'value',
            leftValue: value,
            leftCardColor: Colors.deepPurple,
            rightFieldName: 'Manuf. Name',
            rightValue: 'China Electric Company',
            rightCardColor: Colors.deepPurple,
          ),
          RowWithExpandedCard(
            leftFieldName: 'Quantity in Stock',
            leftValue: quantity,
            leftCardColor: Colors.deepPurple,
            rightFieldName: 'Manuf. Part Number',
            rightValue: 'B0768',
            rightCardColor: Colors.lightBlue,
          ),
          RowWithExpandedCard(
            leftFieldName: 'Location',
            leftValue: location,
            leftCardColor: Colors.lightBlue,
            rightFieldName: 'CredoS. Part Number',
            rightValue: 'CS1354',
            rightCardColor: Colors.lightBlue,
          ),
          ExpandedCard(
            inputname: 'Description',
            value: description,
            cardcolor: Colors.grey,
          ),
          RaisedButton(
            color: Colors.red,
            child: Text(
              'Click Here to Download Data Sheet',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            onPressed: () {
              //Todo : add download Functionality
            },
          )
        ],
      ),
    );
  }
}
