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
        create: (context) => NavigationBloc(HomePage()),
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
