import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/home_page.dart';
import 'package:mobile_project/storyteller_page.dart';

import 'bloc/teller_bloc.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TellerBloc(),
      child: MaterialApp(
        title: 'Dab Neeg Hmoob',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.saralaTextTheme(Theme.of(context).textTheme),
          primaryColor: kSecondaryColor,
        ),
        home: HomePage(),
        // routes: {
        //   '/video': (ctx) => SongScreen()
        // },
      ),
    );
  }
}
