
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_vjti/Home/home_main.dart';

import 'Activity_Status/registration.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
        '/': (context) => HomeMain()  , 

        "/first": (context) => first(),
        // "/Password": (context) => ResetP(),
        // "/MyAccount": (context) => MyAccount(),
        // "/Order": (context) => Order(),
        // "/Home": (context) => Home(),
        // "/register": (context) => registration_page(),
        // "/Shop_Registartion": (context) => Shop_Registration(),
        // "/Buy_home": (context) => const Buy_home(),
        // "/Add_Product": (context) => const Add_Product()
      },
    );
  }
}
