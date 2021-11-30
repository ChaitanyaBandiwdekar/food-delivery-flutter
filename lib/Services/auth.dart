import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/Accounts/customer.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  Customer _userFromFirebaseUser(User user) {
    return Customer(user.uid, user.email, user.phoneNumber);
  }

  // auth change user stream
  Stream<Customer?> get user {
    return _auth.authStateChanges().map((User? user) =>
            //if (user != null) {
            _userFromFirebaseUser(user!)
        //}
        );
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      // create a new document for the user with the uid
      // await DatabaseService(uid: user.uid)
      //     .updateUserData('0', 'new crew member', 100);
      if (user != null) {
        return _userFromFirebaseUser(user);
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
