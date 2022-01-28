import 'package:flutter/material.dart';
import 'package:move_demo/Theme/app_colors.dart';
import 'package:move_demo/navigation/main_navigation.dart';
import 'package:move_demo/widgets/app/my_app_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final myAppModel = MyAppModel();
  await myAppModel.checkAuth();
  runApp(MyApp(
    myAppModel: myAppModel,
  ));
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({required this.myAppModel, Key? key});
  final MyAppModel myAppModel;
  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(myAppModel.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
