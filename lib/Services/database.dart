import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';

class DatabaseService {

  // collection reference
  final CollectionReference cuisineCollection = FirebaseFirestore.instance
      .collection('Cuisines');

  // brew list from snapshot
  Future<List<Cuisine>?> _cuisineListFromSnapshot() async{
    await FirebaseFirestore.instance
        .collection('Cuisines')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.map((doc) {
        return Cuisine(
            doc['title'] ?? '',
            doc['img'] ?? '',
            doc['count'] ?? 69
        );
      }).toList();
    });
  }
  // get brews stream
  Future<List<Cuisine>?> get cuisines async{
    return await _cuisineListFromSnapshot();
  }

}

  // user data from snapshots
//   UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//     return UserData(
//         uid: uid,
//         name: snapshot.data['name'],
//         sugars: snapshot.data['sugars'],
//         strength: snapshot.data['strength']
//     );
//   }
//
//   // get brews stream
//   Stream<List<Brew>> get brews {
//     return brewCollection.snapshots()
//         .map(_brewListFromSnapshot);
//   }
//
//   // get user doc stream
//   Stream<UserData> get userData {
//     return brewCollection.document(uid).snapshots()
//         .map(_userDataFromSnapshot);
//   }
//
// }