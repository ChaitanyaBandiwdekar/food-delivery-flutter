import 'package:flutter/material.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';

class CuisineCard extends StatelessWidget {
  final Cuisine cuisine;
  CuisineCard(this.cuisine);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      Image(
                          image: NetworkImage(cuisine.image),
                          height: 120,
                          width: 160,
                          fit: BoxFit.fill),
                      SizedBox(height: 10,),
                      Text(
                          cuisine.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Text(
                        "(" + cuisine.num.toString() + ")",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),

                      )


                    ],
                  ),
                ],
              ),
            ],
          ),
          margin: EdgeInsets.all(14),
        )
    );
  }
}
