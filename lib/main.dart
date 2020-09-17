import 'package:flutter/material.dart';
import 'package:homeate/pages/splashscreen.dart';
//import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeAte',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        primaryColorDark: Colors.blue,
        primaryColor: Colors.blue,
        primaryColorBrightness: Brightness.light,
        brightness: Brightness.light,
      ),
      home: SpashScreen(),
    );
  }
}
