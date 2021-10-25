// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dish.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DishCard extends StatefulWidget {
  Dish dish;
  DishCard(this.dish);

  @override
  _DishCardState createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
          color: Colors.white,
          shadowColor: Colors.grey[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
          child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                            image: NetworkImage(widget.dish.image),
                            height: 100,
                            width: 125,
                            fit: BoxFit.fill),
                      ),
                      Spacer(),
                      RatingBarIndicator(
                        rating: widget.dish.stars,
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
                              widget.dish.name,
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
                                      color: widget.dish.veg
                                          ? Colors.green
                                          : Colors.red)),
                              child: Icon(
                                Icons.circle,
                                color:
                                    widget.dish.veg ? Colors.green : Colors.red,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "₹ " + widget.dish.price.toString(),
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
                              widget.dish.description,
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
                                    onPressed: () {
                                      setState(() {
                                        if (_count > 0) {
                                          _count--;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_sharp,
                                      color: Colors.amber,
                                    ),
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
                                  _count.toString(),
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
                                    onPressed: () {
                                      setState(() {
                                        _count++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.amber,
                                    ),
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
