// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/Accounts/signup.dart';
import 'package:food_delivery/Accounts/login.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';
import 'package:food_delivery/Cuisine/cuisine_card.dart';
import 'package:food_delivery/Cuisine/cuisine_list.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';
import 'package:food_delivery/Menu/menu.dart';
import 'package:food_delivery/Restaurant/restaurant_card.dart';
import 'package:food_delivery/Restaurant/restaurant_list.dart';
import 'package:food_delivery/Restaurant/rc.dart';
import 'package:food_delivery/Restaurant/restaurants.dart';

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
  Cuisine cuisine = Cuisine(
      "Italian",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
      67);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Cuisines()));
  }
}
