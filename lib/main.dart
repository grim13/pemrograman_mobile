import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/screens/home_screen.dart';
import 'package:pemrograman_mobile/screens/login_screen.dart';
import 'package:pemrograman_mobile/screens/payment_add_sceen.dart';
import 'package:pemrograman_mobile/screens/payment_screen.dart';
import 'package:pemrograman_mobile/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  String initialRoute = LoginScreen.routeName;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  if (token != null) {
    initialRoute = HomeScreen.routeName;
  }
  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String _initialRoute;
  MyApp(String initialRoute, {Key? key})
    : _initialRoute = initialRoute,
      super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: _initialRoute,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        PaymentScreen.routeName: (ctx) => PaymentScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        PaymentAddSceen.routeName: (ctx) => PaymentAddSceen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
      },
    );
  }
}
