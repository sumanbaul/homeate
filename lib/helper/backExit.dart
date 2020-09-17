// import 'package:flutter/material.dart';

// class BackExit{

//   DateTime currentBackPressTime;
// final scaffold = Scaffold.of(context);

//   Future<bool> onWillPop() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime) > Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       SnackBar(
//           content: const Text('Values not correct'),
//           action: SnackBarAction(
//               label: 'CLOSE', onPressed: scaffold.hideCurrentSnackBar),
//         ),
//       return Future.value(false);
//     }
//     return Future.value(true);
//   }
// }
