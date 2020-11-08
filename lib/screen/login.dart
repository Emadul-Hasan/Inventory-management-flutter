import 'package:credo_inventory/screen/adminview.dart';
import 'package:credo_inventory/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:credo_inventory/cutomized_components/Inputfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login';
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
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
                obscuretext: false,
                margin: 20.0,
                hintText: 'Enter Your Email',
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
                function: (value) {
                  password = value;
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  color: Colors.black,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, AdminPageView.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationPage.id);
                },
                child: Text('Don\'t have an account? Register'),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
