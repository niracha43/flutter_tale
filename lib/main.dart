import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/bloc/video/video_bloc.dart';
import 'package:mobile_project/login.dart';
import 'package:mobile_project/searchPage.dart';
import 'package:mobile_project/storyteller_page.dart';

import 'bloc/teller/teller_bloc.dart';
import 'constants.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TellerBloc>(
          create: (BuildContext context) => TellerBloc(),
        ),
        BlocProvider<VideoBloc>(
          create: (BuildContext context) => VideoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Dab Neeg Hmoob',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.saralaTextTheme(Theme.of(context).textTheme),
          primaryColor: kSecondaryColor,
        ),
        home: HomePage(),
        // routes: {
        //   StorytellerPage.routesName: (ctx) => StorytellerPage(),
        // },
      ),
    );
  }
}
