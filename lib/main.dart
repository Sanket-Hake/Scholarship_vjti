import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholarship_vjti/Details/form2.dart';
import 'package:scholarship_vjti/AllSchemes/eligible_Schemes.dart';
import 'package:scholarship_vjti/Home/home_main.dart';
import 'package:scholarship_vjti/Payment_history/pHistory.dart';
import 'package:scholarship_vjti/about/info.dart';
import 'package:scholarship_vjti/pdf_generate/second.dart';
import 'Authentication/login.dart';
import 'Authentication/registartion.dart';
import 'Details/form1.dart';
import 'download/dummy.dart';
import 'download/pdfViewer.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// FirebaseMessaging messaging = FirebaseMessaging.instance;
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
        '/': (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        
        '/paymentHistory': (context) => paymentHistory(),
        "/MySchemes": (context) => MySchemes(),
      },
    );
  }
}
