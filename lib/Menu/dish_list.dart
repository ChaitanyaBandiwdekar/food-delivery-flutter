// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dish.dart';
import 'dish_card.dart';

class DishList extends StatelessWidget {
  final int rid;
  final String cuisine;
  DishList({Key? key, required this.rid, required this.cuisine}) : super(key: key);
  List<Dish> dishes = [
  ];
  // Map<int, List> dishes = {
  // 1: [
  //
  // ], 2: [
  //   Dish(
  //       "Veg Manchurian",
  //       250,
  //       "Soft vegetable balls served with chinese gravy",
  //       4.5,
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       true, "Chinese"),
  //   Dish(
  //       "Chicken Chilly",
  //       350,
  //       "Marinated chicken pieces deep fried and served with spicy chinese gravy",
  //       4,
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       false, "Chinese"),
  //   Dish(
  //       "Schezwan Noodles",
  //       300,
  //       "Boiled noodles sauted in a variety of sauces and served with half boiled egg",
  //       3.75,
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       true, "Chinese"),
  //   Dish(
  //       "Schezwan fried rice",
  //       350,
  //       "Vegetable rice fried in schezwan sauce and served with chutney",
  //       4.75,
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //       true, "Chinese"),
  //     ], 3: [
  //     Dish(
  //     "Veg Manchurian",
  //     250,
  //     "Soft vegetable balls served with chinese gravy",
  //     4.5,
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //     true, "Chinese"),
  //     Dish(
  //     "Chicken Chilly",
  //     350,
  //     "Marinated chicken pieces deep fried and served with spicy chinese gravy",
  //     4,
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //     false, "Chinese"),
  //     Dish(
  //     "Schezwan Noodles",
  //     300,
  //     "Boiled noodles sauted in a variety of sauces and served with half boiled egg",
  //     3.75,
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //     true, "Chinese"),
  //     Dish(
  //     "Schezwan fried rice",
  //     350,
  //     "Vegetable rice fried in schezwan sauce and served with chutney",
  //     4.75,
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
  //     true, "Chinese"),
  //     ], 4: [
  //   Dish(
  //       "Misal Pav",
  //       250,
  //       "Tikhat Misal with Pav",
  //       4.5,
  //       "https://mytastycurry.com/wp-content/uploads/2020/06/Misal-pav.jpg",
  //       true, "Maharashtrian"),Dish(
  //       "Vada Pav",
  //       250,
  //       "Vada with Pav",
  //       4.5,
  //       "https://static.toiimg.com/thumb/80920657.cms?imgsize=251331&width=800&height=800",
  //       true, "Maharashtrian"),
  //   Dish(
  //       "Vada Usal",
  //       20,
  //       "Vada Usal",
  //       4.5,
  //       "https://a8g4i9g5y.ssl.hwcdn.net/files/styles/food_image/public/a8wn4hw/im/16/c4/2dfa67feca71abb809a698e54a29f8dd.jpg",
  //       true, "Maharashtrian"),
  // ], 5: [
  //   Dish(
  //       "Chicken Tikka Masala",
  //       250,
  //       "",
  //       4.5,
  //       "https://www.licious.in/blog/wp-content/uploads/2020/12/Chicken-Tikka-Masala-min.jpg",
  //       false, "Punjabi"),Dish(
  //       "Butter Nan",
  //       50,
  //       "",
  //       4.5,
  //       "https://c.ndtvimg.com/2021-02/271krdvo_garlic-naan_625x300_16_February_21.jpg",
  //       true, "Punjabi")
  // ],  6: [
  //   Dish(
  //       "Chicken Tikka Masala",
  //       300,
  //       "",
  //       3.5,
  //       "https://www.licious.in/blog/wp-content/uploads/2020/12/Chicken-Tikka-Masala-min.jpg",
  //       false, "Punjabi"),Dish(
  //       "Butter Nan",
  //       60,
  //       "",
  //       4.5,
  //       "https://c.ndtvimg.com/2021-02/271krdvo_garlic-naan_625x300_16_February_21.jpg",
  //       true, "Punjabi")
  // ],  7: [
  //   Dish(
  //       "Puran Poli",
  //       150,
  //       "",
  //       3.5,
  //       "https://recipes.timesofindia.com/thumb/msid-55045560,width-1600,height-900/55045560.jpg",
  //       true, "Maharashtrian"),
  //     Dish(
  //       "Chicken Kolhapuri",
  //       60,
  //       "",
  //       4.5,
  //       "https://i2.wp.com/kalimirchbysmita.com/wp-content/uploads/2020/05/Veg-Kolhapuri-01.jpg?resize=1024%2C682&ssl=1",
  //       false, "Maharashtrian"),
  // ]
  // };

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _menuStream = FirebaseFirestore.instance
        .collection('Restaurants').doc(rid.toString()).collection("Menu").snapshots();

    // FirebaseFirestore.instance.collection('Restaurants').doc(rid).collection('Menu').where('rid', isEqualTo: rid).snapshots().forEach((element) {
    //   print(element.docs);
    // });

    return StreamBuilder<QuerySnapshot>(
      stream: _menuStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)  {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        snapshot.data!.docs.forEach((element) {
          var data = element.data()! as Map<String, dynamic>;
          var dishObj = Dish(data['name'],data['price'],data['description'],data['stars'], data['img'], data['veg'], data['cuisine']);
          dishes.add(dishObj);
          print(data['title']);
        });

        return Expanded(
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: dishes.map((dish) => DishCard(dish)).toList(),
            ),
              //             .where((element) => element.tags.contains(cuisine)).toList()
              //     .map((restaurant) => RestaurantCard(restaurant)
              // ).toList()
            ),
        );


        // return Expanded(
        //     child: GridView.count(
        //       childAspectRatio: 0.9,
        //       crossAxisCount: 2,
        //       children: cuisines.map((cuisine) => CuisineCard(cuisine)).toList(),
        //     ));



      },
    );
  }
}
