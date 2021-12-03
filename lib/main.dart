// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Accounts/customer.dart';
import 'package:food_delivery/Accounts/signup.dart';
import 'package:food_delivery/Accounts/login.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';
import 'package:food_delivery/Menu/menu.dart';
import 'package:food_delivery/Restaurant/restaurants.dart';
import 'package:food_delivery/Services/auth.dart';
import 'package:food_delivery/splash_screen.dart';
import 'package:food_delivery/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/cuisines': (context) => Cuisines(),
      // '/restaurants': (context) => Restaurants(),
      // '/menu': (context) => Menu(),
      '/login': (context) => Scaffold(body: LoginPage()),
      '/signup': (context) => Scaffold(body: SignUpPage()),
      '/wrapper': (context) => Wrapper(),
    },
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SplashScreen(),
    ));
  }
}
