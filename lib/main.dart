import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_vjti/AllSchemes/my_Schemes.dart';
import 'package:scholarship_vjti/Authentication/login.dart';
import 'package:scholarship_vjti/Authentication/registartion.dart';
import 'package:scholarship_vjti/Home/home_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Activity_Status/registration.dart';
import 'Home/fetch.dart';
import 'Notice/N_main.dart';


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
        '/fetch': (context) => fetch(),
        "/MySchemes": (context) => MySchemes(),
        // "/register": (context) => registration_page(),
        // "/Shop_Registartion": (context) => Shop_Registration(),
        // "/Buy_home": (context) => const Buy_home(),
        // "/Add_Product": (context) => const Add_Product()
      },
    );
  }
}
