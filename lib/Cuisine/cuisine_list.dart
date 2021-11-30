// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';
import 'package:food_delivery/Cuisine/cuisine_card.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';
import 'package:food_delivery/Services/database.dart';


class CuisineList extends StatefulWidget {
  @override
  _CuisineListState createState() => _CuisineListState();
}

class _CuisineListState extends State<CuisineList> {
  List<Cuisine> cuisines =  [
    Cuisine(
        "Italian",
        "https://www.thespruceeats.com/thmb/X6mg_2VBCQQ2X8VrLcPTf8_4ce0=/2733x2050/smart/filters:no_upscale()/chinese-take-out-472927590-57d31fff3df78c5833464e7b.jpg",
        67),
    Cuisine(
        "Maharashtra",
        "https://www.indiafoodnetwork.in/wp-content/uploads/2020/07/Patodi-Rassa.jpg",
        67),
    Cuisine(
        "Chinese",
        "https://content3.jdmagicbox.com/comp/def_content/chinese_restaurants/default-chinese-restaurants-5.jpg",
        67),
    Cuisine(
        "South Indian",
        "https://d4t7t8y8xqo0t.cloudfront.net/admin/eazymedia/trends/3091/16164196070.jpg",
        67),
    Cuisine(
        "Gujarati",
        "https://i0.wp.com/mayuris-jikoni.com/wp-content/uploads/2020/09/Gujarati-thali-4.jpg?fit=3024%2C4032&ssl=1",
        67),
    Cuisine(
        "Punjabi",
        "https://www.sidechef.com/recipe/5e5eb4ba-76bb-46ae-93e4-92ad63e8047d.jpg?d=1408x1120",
        67),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      childAspectRatio: 0.9,
      crossAxisCount: 2,
      children: cuisines.map((cuisine) => CuisineCard(cuisine)).toList(),
    ));
  }
}
