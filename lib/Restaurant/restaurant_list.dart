// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'restaurant_card.dart';
import 'rc.dart';

class RestaurantList extends StatelessWidget {
  final String cuisine;
  RestaurantList({Key? key, required this.cuisine}) : super(key: key);
  List<Restaurant> restaurants = [
    // Restaurant(
    //   "China Bistro",
    //   "Dadar West",
    //   "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
    //   "Flat 21% off if you order using coupon code “Diwali21”",
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5c_yHX2htBSQmrKUo6h4bw5rctcQn4LRsLg&usqp=CAU",
    //   ["Italian", "Chinese"],
    //   1
    // ),
    // Restaurant(
    //   "La Lola",
    //   "Bandra West",
    //   "Ranjit Estate, Sector A, Bandra(E)",
    //   "Flat 21% off if you order using coupon code “Diwali21”",
    //   "https://assets.gqindia.com/photos/5dcd32036cce8200089fcb49/master/pass/LaLola-Interiors.jpg",
    //     ["Italian", "Chinese"],
    //   2
    // ),
    // Restaurant(
    //   "Italy In India",
    //   "Prabhadevi",
    //   "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
    //   "Flat 21% off if you order using coupon code “Diwali21”",
    //   "https://media-cdn.tripadvisor.com/media/photo-s/11/c4/89/d7/authentic-italian-food.jpg",
    //     ["Italian"],
    //   3
    // ),
    // Restaurant(
    //   "Chaitanya Misal",
    //   "Dadar West",
    //   "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
    //   "Flat 21% off if you order using coupon code “Diwali21”",
    //   "https://content3.jdmagicbox.com/comp/mumbai/w3/022pxx22.xx22.181112184936.h4w3/catalogue/mamledar-misal-mumbai-pgtdwnioza.jpg",
    //     ["Maharashtrian"],
    //   4
    // ),
    // Restaurant(
    //   "Amar Punjab",
    //   "Thane East",
    //   "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
    //   "Flat 21% off if you order using coupon code “Diwali21”",
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQslmR3QIgahO20I9EvGwMwJahpRy_f3q7Ezg&usqp=CAU",
    //     ["Punjabi"],
    //   5
    // ),
    // Restaurant(
    //     "Shreeram Punjab",
    //     "Andheri East",
    //     "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
    //     "Flat 21% off if you order using coupon code “Diwali21”",
    //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQslmR3QIgahO20I9EvGwMwJahpRy_f3q7Ezg&usqp=CAU",
    //     ["Punjabi"],
    //     6
    // ),
    // Restaurant(
    //     "Shiv Prasad",
    //     "CST",
    //     "Ground Floor, Vidya Bhavan, Near Sena Bhavan, Dadar Shivaji Park, Mumbai, Maharashtra 400028",
    //     "Flat 21% off if you order using coupon code “Diwali21”",
    //     "https://media-cdn.tripadvisor.com/media/photo-s/17/78/05/a0/img-20190507-224941-largejpg.jpg",
    //     ["Maharashtrian"],
    //     7
    // ),

  ];

  @override
  Widget build(BuildContext context) {
    // CollectionReference restaurantsCollection = FirebaseFirestore.instance.collection('Restaurants');
    //
    // Future<void> addrestaurants() async {
    //   restaurants.forEach((element) {
    //     restaurantsCollection.doc(element.id.toString()).set({
    //       'name': element.name,
    //       'address': element.address,
    //       'img': element.image,
    //       'location': element.location,
    //       'offers': element.offers,
    //       'rid': element.id,
    //       'tags': element.tags,
    //     });
    //   });
    // }
    //
    // return TextButton(
    //   onPressed: addrestaurants,
    //   child: Text(
    //     "Add restaurants",
    //   ),
    // );
    final Stream<QuerySnapshot> _restaurantStream = FirebaseFirestore.instance.collection('Restaurants').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _restaurantStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        print(snapshot.data!.docs);
        snapshot.data!.docs.forEach((element) {
          var data = element.data()! as Map<String, dynamic>;
          print(data);
          var restaurantObj = Restaurant(data['name'], data['location'], data['address'], data['offers'], data['img'], data['tags'], data['rid']);
          restaurants.add(restaurantObj);
        });

        return Expanded(
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: restaurants.where((element) => element.tags.contains(cuisine)).toList()
                  .map((restaurant) => RestaurantCard(restaurant: restaurant, cuisine: cuisine)
              ).toList(),
            ),
          ),
        );
        // return Text("Success");
      },
    );
  }
}
