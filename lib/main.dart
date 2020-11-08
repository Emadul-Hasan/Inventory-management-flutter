import 'package:flutter/material.dart';
import 'screen/splash.dart';
import 'screen/login.dart';
import 'screen/register.dart';
import 'screen/addcomponent.dart';
import 'package:credo_inventory/screen/adminview.dart';
import 'package:credo_inventory/screen/componentdetails.dart';
import 'package:credo_inventory/screen/splash.dart';
import 'package:credo_inventory/screen/userview.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        ComponentDetailsPage.id: (context) => ComponentDetailsPage(),
        AddComponentForm.id: (context) => AddComponentForm(),
        Userview.id: (context) => Userview(),
        AdminPageView.id: (context) => AdminPageView(),
      },
    );
  }
}
