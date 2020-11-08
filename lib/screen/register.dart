import 'package:credo_inventory/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:credo_inventory/cutomized_components/Inputfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrationPage extends StatelessWidget {
  static const String id = 'register';
  @override
  Widget build(BuildContext context) {
    return RegistrationScreen();
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "images/signup_top.png",
              scale: 2,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "images/login_bottom.png",
              scale: 2,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "images/main_bottom.png",
              scale: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "images/credologo.png",
                    height: 80.0,
                    width: 80.0,
                  ),
                ),
                Inputfield(
                  margin: 20.0,
                  hintText: 'Enter Your Email',
                  obscuretext: false,
                  keyBoardtype: TextInputType.emailAddress,
                  prefixicon: Icon(Icons.mail),
                  function: (value) {
                    email = value;
                    print(email);
                  },
                ),
                Inputfield(
                  obscuretext: true,
                  margin: 5.0,
                  hintText: 'Enter Your Password',
                  prefixicon: Icon(Icons.lock),
                  keyBoardtype: TextInputType.text,
                  function: (value) {
                    password = value;
                    print(password);
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                    color: Colors.black,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    // onPressed: () {},
                    onPressed: () async {
                      try {
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Great",
                            desc: "You have successfully registered",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, LoginPage.id);
                                },
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: Text('Already Registered? Login'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
