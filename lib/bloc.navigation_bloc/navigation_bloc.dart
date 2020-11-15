import 'package:bloc/bloc.dart';
import '../pages/aboutpage.dart';
import '../pages/accountpage.dart';
import '../pages/configurepage.dart';
import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AccountClickedEvent,
  ConfigureClickedEvent,
  AboutClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.AccountClickedEvent:
        yield AccountPage();
        break;
      case NavigationEvents.ConfigureClickedEvent:
        yield ConfigurePage();
        break;
      case NavigationEvents.AboutClickedEvent:
        yield AboutPage();
        break;
    }
  }
}
