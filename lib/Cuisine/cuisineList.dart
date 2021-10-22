

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';
import 'package:food_delivery/Cuisine/cuisineCard.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';

class CuisineList extends StatefulWidget {
  @override
  _CuisineListState createState() => _CuisineListState();
}

class _CuisineListState extends State<CuisineList> {
  List<Cuisine> cuisines = [
    Cuisine("Italian", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU", 67),
    Cuisine("Maharashtra", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU", 67),
    Cuisine("Chinese", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU", 67),
    Cuisine("South Indian", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU", 67),
    Cuisine("Gujarati", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU", 67),
    Cuisine("Punjabi", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU", 67),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: cuisines.map((cuisine) => CuisineCard(cuisine)).toList(),

          )));

  }
}