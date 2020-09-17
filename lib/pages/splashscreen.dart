import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homeate/helper/configuration_helper.dart';
import 'package:homeate/helper/database_helper.dart';
import 'package:homeate/sidebar/sidebar_layout.dart';

final ConfigurationHelper configurationHelper = new ConfigurationHelper();
final dbHelper = DatabaseHelper.instance;
List getTokenAuthData;

class SpashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    getTokenAuthData = await getTokenAuth();
    var duration = new Duration(seconds: 3);
    //binding values with singleton Class
    if (getTokenAuthData == null) {
      configurationHelper.setStateAuthUrl(
          "U4iKtD5QG0oQcmPJrf8LmPwo0YK8n2bl", "http://blynk-cloud.com");
    } else {
      configurationHelper.setStateAuthUrl(
          getTokenAuthData[1], getTokenAuthData[2]);
    }

    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SideBarLayout()));
  }

  Future<List> getTokenAuth() async {
    var tokenAuthData = await dbHelper.query();
    print("Inside Splashscreen: $tokenAuthData");

    return tokenAuthData;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFF262AAA)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.hdr_strong,
                          color: Color(0xFF262AAA),
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Homeate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Brighten Up Your Home",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
