// ignore_for_file: prefer_const_constructors

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
  Future<List<Cuisine>?> cuisines =  DatabaseService().cuisines;
  // [
  //   Cuisine(
  //       "Italian",
  //       "https://www.thespruceeats.com/thmb/X6mg_2VBCQQ2X8VrLcPTf8_4ce0=/2733x2050/smart/filters:no_upscale()/chinese-take-out-472927590-57d31fff3df78c5833464e7b.jpg",
  //       67),
  //   Cuisine(
  //       "Maharashtra",
  //       "https://i0.wp.com/mayuris-jikoni.com/wp-content/uploads/2020/09/Gujarati-thali-4.jpg?fit=3024%2C4032&ssl=1",
  //       67),
  //   Cuisine(
  //       "Chinese",
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       67),
  //   Cuisine(
  //       "South Indian",
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       67),
  //   Cuisine(
  //       "Gujarati",
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       67),
  //   Cuisine(
  //       "Punjabi",
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       67),
  // ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      childAspectRatio: 0.9,
      crossAxisCount: 2,
      children: cuisines!.map((cuisine) => CuisineCard(cuisine)).toList(),
    ));
  }
}
