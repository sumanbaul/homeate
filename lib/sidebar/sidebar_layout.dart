import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeate/bloc.navigation_bloc/navigation_bloc.dart';

import 'package:homeate/pages/homepage.dart';
import 'package:homeate/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage(
          height: 55,
          width: 55,
          color: Color(0xFFe6ebf2),
          offsetBlack: Offset(-2, -2),
          offsetWhite: Offset(2, 2),
          icon: Icons.ac_unit,
          iconSize: 30.0,
          blurLevel: 15.0,
        )),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
              return navigationState as Widget;
            }),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
