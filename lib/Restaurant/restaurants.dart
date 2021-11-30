// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/Restaurant/restaurant_list.dart';

class Restaurants extends StatefulWidget {
  final String cuisine;
  const Restaurants({Key? key, required this.cuisine}) : super(key: key);
  // SecondScreen({Key key, @required this.text}) : super(key: key);
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFFF6F5F5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image(
                    image: NetworkImage(
                        "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX34988581.jpg"),
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "RASOI",
                  style: TextStyle(
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                      fontFamily: "PostNoBillsJaffna",
                      fontSize: 35,
                      letterSpacing: 1),
                ),
                Spacer(),
                ButtonBar(
                  children: [
                    Container(
                        // height: 30, //height of button
                        // width: 30, //width of button
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Login",
                                style: TextStyle(color: Colors.amber)),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0),
                              primary:
                                  Colors.black87, //background color of button
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ))),
                    Container(
                        // height: 30, //height of button
                        // width: 30, //width of button
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Signup",
                                style: TextStyle(color: Colors.amber)),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0),
                              primary:
                                  Colors.black87, //background color of button
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            )))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 35,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        primary: Color(0xFFF6F5F5), //background color of button
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 40,
                        color: Colors.black87,
                      )),
                ),
                Text(
                  "RESTAURANTS",
                  style: TextStyle(
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Oregano',
                    fontSize: 40,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            RestaurantList(cuisine: widget.cuisine),
          ],
        ),
      ),
    );
  }
}
