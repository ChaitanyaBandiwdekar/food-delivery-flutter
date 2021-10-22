// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/Cuisine/cuisineList.dart';
import 'package:food_delivery/Menu/dish.dart';
import 'package:food_delivery/Menu/dish_card.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';
import 'package:food_delivery/Menu/dish_list.dart';
import 'package:food_delivery/Menu/menu.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
    return SafeArea(
        child: Scaffold(
      // body: Menu(),
          body: Cuisines(),
    ));
  }
}
