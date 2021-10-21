// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dish.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DishCard extends StatelessWidget {
  final Dish dish = Dish("Veg manchurian", 300, "Tasty", 4.5, "", true);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(10),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU"),
                        height: 100,
                        width: 150,
                      ),
                      RatingBarIndicator(
                        rating: dish.stars,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(dish.name),
                          Icon(
                            Icons.circle,
                            color: dish.veg ? Colors.green : Colors.red,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(dish.price.toString()),
                      Text(dish.description)
                    ],
                  )
                ],
              ))),
    );
  }
}
