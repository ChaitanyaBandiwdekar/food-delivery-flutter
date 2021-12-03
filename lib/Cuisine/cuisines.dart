// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Cart/cart.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';
import 'package:food_delivery/Cuisine/cuisine_list.dart';
import 'package:food_delivery/Profile/profileDrawer.dart';
import 'package:food_delivery/Services/auth.dart';
import '../Menu/dish.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../wrapper.dart';

class Cuisines extends StatefulWidget {
  const Cuisines({Key? key}) : super(key: key);

  @override
  _CuisinesState createState() => _CuisinesState();
}

class _CuisinesState extends State<Cuisines> {
  int _selectedIndex = 1;
  final _pageOptions = [
    Profile(),
    Cuisines(),
    Cart(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => _pageOptions[_selectedIndex]));
  }
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          color: Color(0xFFF6F5F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "CUISINES",
                  style: TextStyle(
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Oregano',
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 20),
              CuisineList(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,         //New
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],

        ),
      ),
    );
  }
}
