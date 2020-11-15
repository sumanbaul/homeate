import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:homeate/topbar/topbar.dart';
import 'package:homeate/widget/temperatureChart.dart';
//import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:homeate/reader/SwitchStateReader.dart';
import 'package:homeate/reader/ConfigurationReader.dart';
import 'package:homeate/widget/btnWidget.dart';

//Reader Class initialization
var swtichStateReader = new SwtichStateReader();
var configurationReader = new ApiUrlBuilder();
//var initConfigurationValues = configurationReader.getTokenAuth();

DateTime currentBackPressTime;

//constants
const int activeColor = 0xFF262AAA;
const int inActiveColor = 0x88D9E6FF;
const String activeText = "Active";
const String inActiveText = "InActive";
// final double blurLevel;
// final Offset offsetWhite;
// final Offset offsetBlack;
// final IconData icon;
// final double iconSize;

class HomePage extends StatefulWidget with NavigationStates {
  final Color color;
  final double blurLevel;
  final Offset offsetWhite;
  final Offset offsetBlack;
  final double height;
  final double width;
  final IconData icon;
  final double iconSize;

  const HomePage(
      {Key key,
      this.color,
      this.blurLevel,
      this.offsetWhite,
      this.offsetBlack,
      this.height,
      this.width,
      this.icon,
      this.iconSize})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<RefreshIndicatorState> refreshKey;

  var scaffold;

  // ignore: must_call_super
  void initState() {
    refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Color(0xFF262AAA));
    scaffold = Scaffold.of(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: RefreshIndicator(
          onRefresh: () => Future.delayed(const Duration(seconds: 3)),
          key: refreshKey,
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                          child: Text(
                            'Homeate',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 28),
                          ),
                          //color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          "Bed Room",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.grey[800]),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          height: 120.0,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          child: UpdateRaisedBtnD2(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 120.0,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          child: UpdateRaisedBtnD3(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 25),
                          child: Text(
                            "Lights",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UpdateRaisedBtnD4(),
                        UpdateRaisedBtnD4(),
                        UpdateRaisedBtnD4(),
                        //UpdateRaisedBtnD4(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      CupertinoAlertDialog(
        title: Text('Exit?'),
        content: Text('Do you want to exit?'),
        actions: [
          CupertinoDialogAction(isDefaultAction: true, child: new Text("No")),
          CupertinoDialogAction(isDefaultAction: true, child: new Text("Yes")),
        ],
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
