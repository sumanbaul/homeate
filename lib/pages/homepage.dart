import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class HomePage extends StatelessWidget with NavigationStates {
  GlobalKey<RefreshIndicatorState> refreshKey;

  var scaffold;

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
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text('Homeate',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 28)),
                        color: Color(0x88D9E6FF),
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: 600,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          height: 150.0,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          child: UpdateRaisedBtnD2(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 150.0,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          child: UpdateRaisedBtnD3(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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

class UpdateRaisedBtnD2 extends StatefulWidget {
  UpdateRaisedBtnD2State createState() => UpdateRaisedBtnD2State();
}

class UpdateRaisedBtnD3 extends StatefulWidget {
  UpdateRaisedBtnD3State createState() => UpdateRaisedBtnD3State();
}
