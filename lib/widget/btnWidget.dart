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
            return Flexible(
              child: RaisedButton.icon(
                onPressed: () => changeText(),
                label: Text('$btnText',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                color: Color(int.parse('$color')),
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black12),
                ),
                icon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            btnText = snapshot.data[1];
            color = snapshot.data[2];
            return Flexible(
              child: RaisedButton.icon(
                onPressed: () => changeText(),
                label: Text('$btnText',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                color: Color(int.parse('$color')),
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black12),
                ),
                icon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                ),
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
              elevation: 15,
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
              elevation: 15,
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
