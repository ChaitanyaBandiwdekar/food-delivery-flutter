// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Cuisines())));

    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: Image(
                image: NetworkImage(
                    "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX34988581.jpg"),
                height: 150,
                width: 150,
              ),
            ),
            Text(
              "RASOI",
              style: TextStyle(
                  fontFamily: "PostNoBillsJaffna",
                  fontSize: 60,
                  letterSpacing: 1),
            ),
            Text(
              "Food delivered wherever life takes you",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ) //<- place where the image appears
          ),
    );
  }
}
