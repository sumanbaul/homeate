import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.cyan,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
