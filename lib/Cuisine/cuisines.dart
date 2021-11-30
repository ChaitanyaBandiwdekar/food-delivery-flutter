// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';
import 'package:food_delivery/Cuisine/cuisine_list.dart';
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
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                Container(
                    // height: 30, //height of button
                    // width: 30, //width of button
                    child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          // Navigator.of(context).pushNamed('/wrapper');
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              Wrapper()), (Route<dynamic> route) => false);


                          print("In cusines, after signout");
                          print(FirebaseAuth.instance.currentUser);
                        },
                        child: Text("Logout",
                            style: TextStyle(color: Colors.amber)),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          primary: Colors.black87, //background color of button
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )))
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
            Container(
              height: 40,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            CuisineList(),
          ],
        ),
      ),
    );
  }
}
