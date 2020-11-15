import 'package:flutter/material.dart';
import 'package:homeate/helper/constants.dart';
import 'package:homeate/pages/splashscreen.dart';
//import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(MyApp());
  demo();
}

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeAte',
      theme: ThemeData.dark().copyWith(
        //primarySwatch: Colors.blue,

        scaffoldBackgroundColor: backgroundColor, //Colors.grey[300],
        primaryColorDark: Colors.blue,
        primaryColor: Colors.blue,
        primaryColorBrightness: Brightness.light,
        brightness: Brightness.light,
        bottomAppBarTheme:
            BottomAppBarTheme(color: Colors.deepOrange, elevation: 2),
        bottomAppBarColor: Colors.red,
        //textTheme: TextTheme(body1: TextStyle(color: Colors.blueAccent))
      ),
      home: SpashScreen(),
    );
  }
}

void demo() {
  logger.d('Log message with 2 methods');

  loggerNoStack.i('Info message');

  loggerNoStack.w('Just a warning!');

  logger.e('Error! Something bad happened', 'Test Error');

  loggerNoStack.v({'key': 5, 'value': 'something'});

  Logger(printer: SimplePrinter(colors: true)).v('boom');
}
