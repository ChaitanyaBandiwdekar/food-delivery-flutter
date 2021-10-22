// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/Menu/dish_list.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      "https://cdn.w600.comps.canstockphoto.com/luxury-gold-spoon-knife-and-fork-logo-clip-art-vector_csp61369165.jpg"),
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
              Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 40,
              ),
              Text(
                "MENU",
                style: TextStyle(
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
          DishList()
        ],
      ),
    );
  }
}
