import 'package:flutter/material.dart';
import 'package:homeate/pages/homepage.dart';

//Button D2
class UpdateRaisedBtnD2State extends State {
  String btnText = "";
  int color = 0;

  var getPinUrl = configurationReader.getPinValue('D2');
  var activePinUrl = configurationReader.writePinValueViaGet('D2', 1);
  var inActivePinUrl = configurationReader.writePinValueViaGet('D2', 0);

  changeText() async {
    //Change PIN State
    await swtichStateReader.btnSwitch(getPinUrl.toString(),
        activePinUrl.toString(), inActivePinUrl.toString());

    //Get PIN State
    var status = await swtichStateReader.getBtnState(getPinUrl.toString(),
        activeText, inActiveText, activeColor, inActiveColor);

    setState(() {
      btnText = status[1];
      color = status[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: swtichStateReader.getBtnState(
            getPinUrl.toString(), "Active", "InActive", 0xFF262AAA, 0x88D9E6FF),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Future hasn't finished yet, return a placeholder
            btnText = "Loading..";

            color = 0x88D9E6FF;
            return RaisedButton.icon(
              onPressed: () => changeText(),
              label: Text('$btnText',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Color(int.parse('$color')),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.transparent),
              ),
              icon: Icon(
                Icons.lightbulb_outline,
                color: Colors.white,
              ),
            );
          } else {
            btnText = snapshot.data[1];
            color = snapshot.data[2];
            return RaisedButton.icon(
              onPressed: () => changeText(),
              label: Text('$btnText',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Color(int.parse('$color')),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.transparent),
              ),
              icon: Icon(
                Icons.lightbulb_outline,
                color: Colors.white,
              ),
            );
          }
        });
  }
}

//Button D3
class UpdateRaisedBtnD3State extends State {
  String btnText = "";
  int color = 0;

  var getPinUrl = configurationReader.getPinValue('V2');
  var activePinUrl = configurationReader.writePinValueViaGet('V2', 1);
  var inActivePinUrl = configurationReader.writePinValueViaGet('V2', 0);

  changeText() async {
    //Change PIN State
    await swtichStateReader.btnSwitch(getPinUrl.toString(),
        activePinUrl.toString(), inActivePinUrl.toString());

    //Get PIN State
    var status = await swtichStateReader.getBtnState(getPinUrl.toString(),
        activeText, inActiveText, activeColor, inActiveColor);

    setState(() {
      btnText = status[1];
      color = status[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: swtichStateReader.getBtnState(
            getPinUrl.toString(), "Active", "InActive", 0xFF262AAA, 0x88D9E6FF),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Future hasn't finished yet, return a placeholder
            //return Text('Loading');
            btnText = "Loading..";
            color = 0x88D9E6FF;
            return RaisedButton.icon(
              onPressed: () => changeText(),
              label: Text('$btnText',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Color(int.parse('$color')),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black12),
              ),
              icon: Icon(
                Icons.ac_unit,
                color: Colors.white,
              ),
            );
          } else {
            btnText = snapshot.data[1];
            color = snapshot.data[2];
            return RaisedButton.icon(
              onPressed: () => changeText(),
              label: Text('$btnText',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Color(int.parse('$color')),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black12),
              ),
              icon: Icon(
                Icons.ac_unit,
                color: Colors.white,
              ),
            );
          }
        });
  }
}

class UpdateRaisedBtnD4State extends State {
  String btnText = "";
  int color = 0;

  var getPinUrl = configurationReader.getPinValue('D2');
  var activePinUrl = configurationReader.writePinValueViaGet('D2', 1);
  var inActivePinUrl = configurationReader.writePinValueViaGet('D2', 0);

  changeText() async {
    //Change PIN State
    await swtichStateReader.btnSwitch(getPinUrl.toString(),
        activePinUrl.toString(), inActivePinUrl.toString());

    //Get PIN State
    var status = await swtichStateReader.getBtnState(getPinUrl.toString(),
        activeText, inActiveText, activeColor, inActiveColor);

    setState(() {
      //btnText = status[1];
      // color = status[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      // padding: EdgeInsets.all(20),
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(-4, -4),
                color: Colors.white,
                spreadRadius: 1.0),
            BoxShadow(
                blurRadius: 10,
                offset: Offset(4, 4),
                color: Colors.grey[500],
                spreadRadius: 1.0)
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[350],
                Colors.grey[350],
                Colors.grey[300],
                Colors.grey[100],
              ],
              stops: [
                0,
                0.25,
                0.4,
                1
              ])),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      offset: Offset(-3, -3),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    BoxShadow(
                      blurRadius: 20.0,
                      offset: Offset(3, 3),
                      color: Colors.white.withOpacity(0.25),
                    )
                  ],
                ),
              ),
              Positioned.fill(
                child: Icon(
                  Icons.ac_unit,
                  size: 30.0,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
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

class UpdateRaisedBtnD4 extends StatefulWidget {
  UpdateRaisedBtnD4State createState() => UpdateRaisedBtnD4State();
}
