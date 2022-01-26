import 'package:components/models/models.dart';
import 'package:components/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'listview1',
      name: 'List View 1',
      screen: const ListView1Screen(),
      icon: Icons.list,
    ),
    MenuOption(
      route: 'listview2',
      name: 'List View 2',
      screen: const ListView2Screen(),
      icon: Icons.list_alt,
    ),
    MenuOption(
      route: 'alerts',
      name: 'Alerts',
      screen: const AlertScreen(),
      icon: Icons.add_alert,
    ),
    MenuOption(
      route: 'cards',
      name: 'Cards',
      screen: const CardScreen(),
      icon: Icons.credit_card,
    ),
    MenuOption(
      route: 'avatar',
      name: 'Circle Avatar',
      screen: const AvatarScreen(),
      icon: Icons.supervised_user_circle_outlined,
    ),
    MenuOption(
      route: 'animated',
      name: 'Animated',
      screen: const AnimatedScreen(),
      icon: Icons.play_circle_outline_outlined,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({
        option.route: (context) => option.screen,
      });
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const ListView1Screen(),
  //   'listview2': (BuildContext context) => const ListView2Screen(),
  //   'alerts': (BuildContext context) => const AlertScreen(),
  //   'cards': (BuildContext context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) => const AlertScreen(),
    );
  }
}
