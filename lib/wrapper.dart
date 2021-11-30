import 'package:flutter/material.dart';
import 'package:food_delivery/Accounts/customer.dart';
import 'package:food_delivery/Accounts/login.dart';
import 'package:food_delivery/Cuisine/cuisine.dart';
import 'package:food_delivery/Cuisine/cuisines.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Customer?>(context);
    if (user == null) {
      return Scaffold(body: LoginPage());
    }
    return Cuisines();
  }
}
