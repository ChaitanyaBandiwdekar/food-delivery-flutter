// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';
import 'package:food_delivery/Restaurant/restaurants.dart';

class CuisineCard extends StatelessWidget {
  final Cuisine cuisine;
  CuisineCard(this.cuisine);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Restaurants(cuisine: cuisine.name),
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                  image: NetworkImage(cuisine.image),
                  height: 125,
                  width: 211,
                  fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
              child: Text(
                cuisine.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Text(
                "(" + cuisine.num.toString() + ")",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
