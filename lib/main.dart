import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholarship_vjti/Activity_Status/registration.dart';
import 'package:scholarship_vjti/AllSchemes/eligible_Schemes.dart';
import 'package:scholarship_vjti/Home/home_main.dart';
import 'package:scholarship_vjti/Payment_history/pHistory.dart';


import 'Authentication/registartion.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.playfairDisplayTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/',
      routes: {
          // '/': (context) => LoginPage(),
        '/': (context) => HomeMain(),
        "/register" :(context) => RegisterPage() ,
        "/first": (context) => first(),
        '/paymentHistory': (context) => paymentHistory(),
        "/MySchemes": (context) => MySchemes(),
     
      },
    );
  }
}
