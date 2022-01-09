import 'package:flutter/material.dart';
import 'package:move_demo/Theme/app_colors.dart';
import 'package:move_demo/widgets/auth/auth_widget.dart';
import 'package:move_demo/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget()
      },
      initialRoute: '/auth',
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute<void>(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('Route Error'),
                  ),
                ));
      },
    );
  }
}
