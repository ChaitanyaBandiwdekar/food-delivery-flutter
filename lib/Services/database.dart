// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:food_delivery/Cuisine/cuisine.dart';
//
// class DatabaseService {
//
//   // collection reference
//   final CollectionReference cuisineCollection = FirebaseFirestore.instance
//       .collection('Cuisines');
//
//   // brew list from snapshot
//   void fetchCuisine() async {
//     final cuisines = <Cuisine>[];
//     final doc = await FirebaseFirestore.instance.collection('Cuisines').get();
//     final questionsTmp = doc;
//     // questionsTmp.forEach((questionTmp) {
//     //   ;
//     // });
//     // return questions;
//     print(doc);
//   }
//
//   // List<Cuisine>? _cuisineListFromSnapshot() {
//   //   return FirebaseFirestore.instance
//   //       .collection('Cuisines')
//   //       .get()
//   //       .then((QuerySnapshot querySnapshot) {
//   //     querySnapshot.docs.map((doc) {
//   //       return Cuisine(
//   //           doc['title'] ?? '',
//   //           doc['img'] ?? '',
//   //           doc['count'] ?? 69
//   //       );
//   //     }).toList();
//   //   });
//   // }
//   List<Cuisine> _brewListFromSnapshot(QuerySnapshot snapshot) {
//     return FirebaseFirestore.instance
//           .collection('Cuisines')
//           .get()
//           .then((QuerySnapshot querySnapshot) {
//         querySnapshot.docs.map((doc){
//       //print(doc.data);
//       return Brew(
//           name: doc.data['name'] ?? '',
//           strength: doc.data['strength'] ?? 0,
//           sugars: doc.data['sugars'] ?? '0'
//       );
//     }).toList();
//   }
//
//
//   // get brews stream
//   List<Cuisine>? get cuisines {
//     return _cuisineListFromSnapshot();
//   }
//
// }
//
//   // user data from snapshots
// //   UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
// //     return UserData(
// //         uid: uid,
// //         name: snapshot.data['name'],
// //         sugars: snapshot.data['sugars'],
// //         strength: snapshot.data['strength']
// //     );
// //   }
// //
// //   // get brews stream
// //   Stream<List<Brew>> get brews {
// //     return brewCollection.snapshots()
// //         .map(_brewListFromSnapshot);
// //   }
// //
// //   // get user doc stream
// //   Stream<UserData> get userData {
// //     return brewCollection.document(uid).snapshots()
// //         .map(_userDataFromSnapshot);
// //   }
// //
// // }