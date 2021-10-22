import 'package:flutter/material.dart';
import '../Menu/dish.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CuisineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Image(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU"),
                              height: 140,
                              width: 190,
                              fit: BoxFit.fill),
                          Text(
                            "Italian",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
