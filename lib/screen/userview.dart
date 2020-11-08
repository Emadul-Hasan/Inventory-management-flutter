import 'package:credo_inventory/utility/searchbrain.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Userview extends StatelessWidget {
  static const String id = 'userview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('User Control Panel'),
        leading: IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: UserPageBody(),
    );
  }
}

class UserPageBody extends StatefulWidget {
  @override
  _UserPageBodyState createState() => _UserPageBodyState();
}

class _UserPageBodyState extends State<UserPageBody> {
  final componentNameValue = [
    'Resistor-20ohm',
    'Resistor-40ohm',
    'Resistor-60ohm',
    'Resistor-80ohm',
    'Resistor-100ohm',
    'Resistor-120ohm',
    'Resistor-140ohm',
    'Resistor-180ohm',
    'Resistor-200ohm',
    'Resistor-220ohm',
    'Resistor-275ohm',
    'Resistor-1K',
    'Resistor-1.1K',
    'Resistor-2K',
    'Resistor-10K',
    'Resistor-1M',
    'Resistor-2M',
    'Resistor-2.5M',
    'Resistor-100K',
    'Resistor-200K',
    'Inductor-2.3uH',
    'Capacitor- 0.1uF',
    'Capacitor- 0.2uF',
    'Capacitor- 22pF',
    'Capacitor- 10uF',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      dragStartBehavior: DragStartBehavior.start,
      child: Column(
        children: List.generate(
          componentNameValue.length,
          (index) {
            return Card(
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 45.0,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/componentDetails');
                  },
                  child: Text(componentNameValue[index],
                      style: TextStyle(color: Colors.black87)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
