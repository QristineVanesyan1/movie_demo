import 'package:flutter/material.dart';
import 'package:move_demo/library/widgets/notifier_provider/notifier_provider.dart';
import 'package:move_demo/widgets/auth/auth_model.dart';
import 'package:move_demo/widgets/auth/auth_widget.dart';
import 'package:move_demo/widgets/main_screen/main_screen_widget.dart';
import 'package:move_demo/widgets/movie_details_widget/movie_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext context)>{
    MainNavigationRouteNames.auth: (context) =>
        CustomNotifyProvider(model: AuthModel(), child: const AuthWidget()),
    MainNavigationRouteNames.mainScreen: (context) => const MainScreenWidget(),
  };
  Route<Object> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = setting.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (context) => MovieDetailsWidget(id: movieId));
      default:
        return MaterialPageRoute(
            builder: (context) => const Text('route not found '));
    }
  }
}
