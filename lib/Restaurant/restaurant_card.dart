import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rc.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  RestaurantCard(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
        child: new InkWell(
          onTap: () {
            print("tapped");
          },
          child: Container(
            child:Row(
              children: [
                Expanded(
                  flex:2,

                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                            image: NetworkImage(restaurant.image),
                            height: 120,
                            width: 200,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(height: 10,),
                      Text(restaurant.offers),
              ],
            ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                          restaurant.name
                      ),
                      SizedBox(height: 5,),
                      Text(restaurant.location),
                      SizedBox(height: 5,),
                      Text(restaurant.address),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
}
}
