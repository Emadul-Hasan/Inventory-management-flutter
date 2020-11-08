import 'package:credo_inventory/screen/addcomponent.dart';
import 'package:credo_inventory/screen/componentdetails.dart';
import 'package:credo_inventory/screen/login.dart';
import 'package:credo_inventory/screen/splash.dart';
import 'package:credo_inventory/utility/searchbrain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AdminPageView extends StatelessWidget {
  static const String id = 'adminview';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Admin Control Panel'),
        leading: IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () async {
              try {
                await _auth.signOut();
                Navigator.pushReplacementNamed(context, LoginPage.id);
              } catch (e) {
                print(e);
              }
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: AdminPageBody(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        width: double.infinity,
        child: RaisedButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, AddComponentForm.id);
          },
          child: Text(
            'Tap To add a Component',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AdminPageBody extends StatefulWidget {
  @override
  _AdminPageBodyState createState() => _AdminPageBodyState();
}

class _AdminPageBodyState extends State<AdminPageBody> {
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
              child: Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ComponentDetailsPage.id);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 320.0,
                      height: 45.0,
                      child: Text(componentNameValue[index],
                          style: TextStyle(color: Colors.black87)),
                    ),
                  ),
                  Container(
                    child: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                          Navigator.pushNamed(context, SplashScreen.id);
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
