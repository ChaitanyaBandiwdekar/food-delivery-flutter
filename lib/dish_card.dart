// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dish.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  DishCard(this.dish);
  // final Dish dish = Dish(
  //     "Veg Manchurian",
  //     300,
  //     "Soft vegetable balls served with chinese gravy",
  //     4.5,
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //     true);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                            image: NetworkImage(dish.image),
                            height: 100,
                            width: 125,
                            fit: BoxFit.fill),
                      ),
                      // Container(
                      //   child: Image.network(
                      //       "https://holycowvegan.net/wp-content/uploads/2020/03/veg-manchurian-6.jpg"),
                      //   width: 100,
                      //   height: 100,
                      // ),
                      Spacer(),
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              dish.name,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            // Expanded(
                            //   flex: 1, // default
                            //   child: SizedBox(), // required field
                            // ),
                            Spacer(),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: dish.veg
                                          ? Colors.green
                                          : Colors.red)),
                              child: Icon(
                                Icons.circle,
                                color: dish.veg ? Colors.green : Colors.red,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "₹ " + dish.price.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          flex: 5,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              dish.description,
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              softWrap: false,
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: 30, //height of button
                                width: 30, //width of button

                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.remove_sharp),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      primary: Colors
                                          .black87, //background color of button
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ))),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              width: 30,
                              height: 30,
                              child: Center(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: 30, //height of button
                                width: 30, //width of button

                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.add),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      primary: Colors
                                          .black87, //background color of button
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ))),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
