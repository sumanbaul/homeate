import 'package:flutter/material.dart';
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text('Homeate',
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
                color: Color(0x88D9E6FF),
                width: MediaQuery.of(context).size.width,
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Center(
            child: Row(children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
            ]),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 150.0,
                width: (MediaQuery.of(context).size.width - 60) / 2,
                child: UpdateRaisedBtnD2(),
              ),
              Container(
                height: 150.0,
                width: (MediaQuery.of(context).size.width - 60) / 2,
                child: UpdateRaisedBtnD3(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UpdateRaisedBtnD2 extends StatefulWidget {
  UpdateRaisedBtnD2State createState() => UpdateRaisedBtnD2State();
}

class UpdateRaisedBtnD3 extends StatefulWidget {
  UpdateRaisedBtnD3State createState() => UpdateRaisedBtnD3State();
}
