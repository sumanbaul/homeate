import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:homeate/topbar/topbar.dart';
import 'package:homeate/widget/headerTitle.dart';
import 'package:homeate/widget/temperatureChart.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:homeate/reader/SwitchStateReader.dart';
import 'package:homeate/reader/ConfigurationReader.dart';
import 'package:homeate/widget/btnWidget.dart';

//Reader Class initialization
var swtichStateReader = new SwtichStateReader();
var configurationReader = new ApiUrlBuilder();

//constants
const int activeColor = 0xFF262AAA;
const int inActiveColor = 0x88D9E6FF;
const String activeText = "Active";
const String inActiveText = "InActive";

class AccountPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              TopBar(),
              Header(
                headerTitle: 'Homeate',
              ),
            ]),
            Temperature(),
            RoomTitle(
              roomTitle: 'Bedroom',
            ),
            Container(
              height: 160,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    height: 120.0,
                    width: (MediaQuery.of(context).size.width - 60) / 2,
                    child: UpdateRaisedBtnD2(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 120.0,
                    width: (MediaQuery.of(context).size.width - 60) / 2,
                    child: UpdateRaisedBtnD3(),
                  ),
                ],
              ),
            ),
            RoomTitle(
              roomTitle: 'Lights',
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UpdateRaisedBtnD4(),
                  UpdateRaisedBtnD4(),
                  UpdateRaisedBtnD4(),
                  UpdateRaisedBtnD4(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
