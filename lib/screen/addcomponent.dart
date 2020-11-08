import 'dart:ui';
import 'package:credo_inventory/cutomized_components/inputformforaddcomponent.dart';
import 'package:credo_inventory/cutomized_components/newcomponentInputform.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddComponentForm extends StatefulWidget {
  static const String id = 'addcomponent';
  @override
  _AddComponentFormState createState() => _AddComponentFormState();
}

class _AddComponentFormState extends State<AddComponentForm> {
  String name;
  String inputValue;
  String manufName;
  String manufPartNo;
  String credoSPartNo;
  String description;
  String formFactor;
  String qty;
  String location;
  String datasheet;
  List list = [];
  var componentType = [
    'Diode',
    'IC',
    'Power Supply',
    'Transformer',
    'Led',
    ' Switch',
    'USB',
    'LDO',
    'Timer',
    'Display',
    ' Box',
    'Soldering tool',
    'Transistor',
    'Chip resistor',
    ' Battery holder',
    'Battery',
    'sensor',
    'Antena',
    'RF',
    'Pin Head',
    'Cable',
    'Jumper wire',
    'Inductor',
    'Resistor',
    'Capacitor',
    'PCB sample',
    'Crystal',
    'CAN',
    'Others'
  ];
  var currentSelectedType;
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add A New Component'),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              'Please provide proper components details, If you don\'t have any of the field data please put N/A instead of leaving it empty.',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          RowWithInputForm(
            leftFormHintText: 'Component Name',
            rightFormHintText: 'Value with Unit',
            leftfunction: (value) {
              name = value;
            },
            rightfunction: (value) {
              inputValue = value;
            },
          ),
          RowWithInputForm(
            leftFormHintText: 'Manuf. Name',
            rightFormHintText: 'Manuf. Part Number',
            leftfunction: (value) {
              manufName = value;
            },
            rightfunction: (value) {
              manufPartNo = value;
            },
          ),
          RowWithInputForm(
            leftFormHintText: 'CredSense Part Num',
            rightFormHintText: 'Quantity',
            leftfunction: (value) {
              credoSPartNo = value;
            },
            rightfunction: (value) {
              qty = value;
            },
          ),
          RowWithInputForm(
            leftFormHintText: 'Location',
            rightFormHintText: 'Description',
            leftfunction: (value) {
              location = value;
            },
            rightfunction: (value) {
              description = value;
            },
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  height: 47.5,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: Colors.blueGrey,
                          style: BorderStyle.solid)),
                  child: DropdownButton(
                    elevation: 5,
                    iconSize: 30.0,
                    isExpanded: true,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    hint: Text('Select Item type'),
                    items: componentType.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem));
                    }).toList(),
                    onChanged: (selectedItem) {
                      setState(() {
                        this.currentSelectedType = selectedItem;
                        print(selectedItem);
                      });
                    },
                    value: currentSelectedType,
                  ),
                ),
              ),
              InputForm(
                hintText: 'Form Factor',
                function: (value) {
                  formFactor = value;
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 2.0,
                ),
                InputForm(
                  hintText: 'Give data sheet link',
                  function: (value) {
                    datasheet = value;
                  },
                ),
                SizedBox(
                  width: 2.0,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text('Cancel'),
                  onPressed: () async {
//                    final re = await _firestore
//                        .collection('Components')
//                        .where('capacitor-2010-22uF',
//                            arrayContains: 'capacitor-2010-22uF')
//                        .getDocuments();
//                    print(re.documents);

                    final rev = await _firestore
                        .collection('Components')
                        .where('type', isEqualTo: 'Resistor-0603-200K')
                        .getDocuments();
                    print(rev);
                    for (var message in rev.documents) {
                      var data = message.data();
//                      print(data['Name']);
//                      print(data['Description']);
//                      print(data['type']);// get individual field data for detail page

                      list.add(data['Name']);
                    }
                    print(list);
                  },
                ),
              ),
            ],
          ),
          Container(
            child: RaisedButton(
                child: Text('Save'),
                color: Colors.orange,
                onPressed: () {
                  String fullName = '$name-$formFactor-$inputValue';

                  try {
                    _firestore.collection('Components').add({
                      'Description': description,
                      'Name': fullName,
                      'type': currentSelectedType,
                    });
                  } catch (e) {
                    print(e);
                  }
                }),
          )
        ],
      ),
    );
  }
}
