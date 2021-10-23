// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/Accounts/signup.dart';
import 'package:food_delivery/Cuisine/cuisineList.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';
import 'package:food_delivery/Menu/menu.dart';
import 'package:food_delivery/Restaurant/restaurant_card.dart';
import 'package:food_delivery/Restaurant/restaurant_list.dart';
import 'package:food_delivery/Restaurant/rc.dart';

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
  Restaurant r = Restaurant(
    "China Bistro",
    "Dadar West",
    "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
    "Flat 21% off if you order using coupon code “Diwali21”",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // body: Menu(),
            body: SignUpPage() //RestaurantCard(r),
            ));
  }
}
