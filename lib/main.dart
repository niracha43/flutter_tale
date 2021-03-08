import 'package:flutter/material.dart';
// import 'package:mobile_project/app_sign_in/sign_in_page.dart';
// import 'package:mobile_project/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/myaccount.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dab Neeg Hmoob',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.saralaTextTheme(Theme.of(context).textTheme),
        primaryColor: kSecondaryColor,
        
      ),
      home: Myaccount(),
    );
  }
}


