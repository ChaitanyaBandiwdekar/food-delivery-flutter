// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'rc.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  RestaurantCard(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
        child: InkWell(
          onTap: () {
            print("tapped");
          },
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                            image: NetworkImage(restaurant.image),
                            height: 105,
                            width: 200,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(restaurant.offers,
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        restaurant.location,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        restaurant.address,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
