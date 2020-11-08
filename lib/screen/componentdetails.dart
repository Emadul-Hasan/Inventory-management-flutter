import 'package:credo_inventory/cutomized_components/expandedcontainercard.dart';
import 'package:credo_inventory/cutomized_components/rowwithexpandedcardcontainer.dart';
import 'package:flutter/material.dart';

class ComponentDetailsPage extends StatelessWidget {
  static const String id = 'componentdetails';
  @override
  Widget build(BuildContext context) {
    return ComponentsDetails();
  }
}

class ComponentsDetails extends StatefulWidget {
  @override
  _ComponentsDetailsState createState() => _ComponentsDetailsState();
}

class _ComponentsDetailsState extends State<ComponentsDetails> {
  String fieldName1 = 'Value';
  String fieldName2 = 'Qty in Stock';
  String fieldName3 = 'Location';
  String fieldName4 = 'Manuf. part No.';
  String fieldName5 = 'CredoS. Part No.';
  String fieldName6 = 'Form Factor';
  String fieldName7 = 'Category';
  String fieldName8 = 'Manuf. Name';

  String value = '20uF';
  String qtyInStock = '500';
  String location = 'Box 008';
  String manufPartNo = 'B0768';
  String credosPartNo = 'CS1354';
  String formFactor = '0603';
  String category = 'Capacitor';
  String manufName = 'China electric manufacturer limited';
  String description =
      'project1, project 2,voltage:250v, concentration: high, solution don\' know';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component Details'),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
            alignment: Alignment.center,
            width: double.infinity,
            color: Color(0xFF404040),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Capacitor-22uF',
              style: TextStyle(color: Colors.white),
            ),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName1,
            value: value,
            color: Color(0xFFB4C6E7),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName2,
            value: qtyInStock,
            color: Color(0xFFFFD966),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName3,
            value: location,
            color: Color(0xFFB4C6E7),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName4,
            value: manufPartNo,
            color: Color(0xFFFFD966),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName5,
            value: credosPartNo,
            color: Color(0xFFB4C6E7),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName6,
            value: formFactor,
            color: Color(0xFFFFD966),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName7,
            value: category,
            color: Color(0xFFB4C6E7),
          ),
          RowWithExpandedCardContainer(
            fieldName: fieldName8,
            value: manufName,
            color: Color(0xFFFFD966),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 0.0),
            alignment: Alignment.center,
            width: double.infinity,
            color: Color(0xFF404040),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Description',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ExpandedCardContainer(
            alignment: Alignment.topLeft,
            widthInFlex: 1,
            fieldName: description,
            cardColor: Color(0xFFFFD966),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 0.0),
            width: double.infinity,
            child: RaisedButton(
                color: Color(0xFFC65911),
                child: Text(
                  'Click Here to Download Data Sheet',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                onPressed: () {
                  //Todo : add download Functionality
                }),
          )
        ],
      ),
    );
  }
}
