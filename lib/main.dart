import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/bloc/notification/notification_bloc.dart';
import 'package:mobile_project/bloc/teller/teller_bloc.dart';
import 'package:mobile_project/bloc/video/video_bloc.dart';
import 'package:mobile_project/constants.dart';
import 'package:mobile_project/home_page.dart';
import 'package:mobile_project/service/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Service().initialize();

    super.initState();
  }

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
        BlocProvider<NotificationBloc>(
          create: (BuildContext context) => NotificationBloc(),
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
