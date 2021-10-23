// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'restaurant_card.dart';
import 'rc.dart';



class RestaurantList extends StatelessWidget {
  List<Restaurant> restaurants = [
    Restaurant(
        "China Bistro",
        "Dadar West",
        "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
        "Flat 21% off if you order using coupon code “Diwali21”",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
     ),
    Restaurant(
      "China Bistro",
      "Dadar West",
      "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
      "Flat 21% off if you order using coupon code “Diwali21”",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: restaurants.map((restaurant) => RestaurantCard(restaurant)).toList(),
        ),
      ),
    );
  }
}
