// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dish.dart';
import 'dish_card.dart';

class DishList extends StatelessWidget {
  List<Dish> dishes = [
    Dish(
        "Veg Manchurian",
        250,
        "Soft vegetable balls served with chinese gravy",
        4.5,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
        true),
    Dish(
        "Chicken Chilly",
        350,
        "Marinated chicken pieces deep fried and served with spicy chinese gravy",
        4,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
        false),
    Dish(
        "Schezwan Noodles",
        300,
        "Boiled noodles sauted in a variety of sauces and served with half boiled egg",
        3.75,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
        true),
    Dish(
        "Schezwan fried rice",
        350,
        "Vegetable rice fried in schezwan sauce and served with chutney",
        4.75,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: dishes.map((dish) => DishCard(dish)).toList(),
        ),
      ),
    );
  }
}