// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/dish_card.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DishList(),
  ));
}

class DishList extends StatefulWidget {
  const DishList({Key? key}) : super(key: key);

  @override
  _DishListState createState() => _DishListState();
}

class _DishListState extends State<DishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Quotes"),
          centerTitle: true,
        ),
        body: DishCard());
  }
}
