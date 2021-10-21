// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dish.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DishCard extends StatelessWidget {
  final Dish dish = Dish(
      "Veg Manchurian",
      300,
      "Soft vegetable balls served with chinese gravy",
      4.5,
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
      true);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(15),
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
                              style: TextStyle(fontSize: 19),
                            ),
                            // Expanded(
                            //   flex: 1, // default
                            //   child: SizedBox(), // required field
                            // ),
                            Spacer(),
                            Icon(
                              Icons.circle,
                              color: dish.veg ? Colors.green : Colors.red,
                              size: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "₹ " + dish.price.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          dish.description,
                          style: TextStyle(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          softWrap: false,
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
                                      primary: Colors
                                          .black87, //background color of button
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ))),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: Colors.greenAccent[600]),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                                height: 30, //height of button
                                width: 30, //width of button
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.add),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .black87, //background color of button
                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )))
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
