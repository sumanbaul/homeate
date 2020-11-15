import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  //const name({Key key}) : super(key: key);
  Header({@required this.headerTitle});
  final headerTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
        child: Text(
          headerTitle,
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 32, color: Colors.white),
        ),
        //color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

class RoomTitle extends StatelessWidget {
  RoomTitle({@required this.roomTitle});
  final roomTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            roomTitle,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.grey[800]),
          ),
        ),
      ]),
    );
  }
}
