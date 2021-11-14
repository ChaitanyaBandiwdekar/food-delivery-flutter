// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/Accounts/signup.dart';
import 'package:food_delivery/Accounts/login.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';
import 'package:food_delivery/Menu/menu.dart';
import 'package:food_delivery/Restaurant/restaurants.dart';
import 'package:food_delivery/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/cuisines': (context) => Cuisines(),
      '/restaurants': (context) => Restaurants(),
      '/menu': (context) => Menu(),
      '/login': (context) => Scaffold(body: LoginPage()),
      '/signup': (context) => Scaffold(body: SignUpPage()),
    },
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SplashScreen()));
  }
}
