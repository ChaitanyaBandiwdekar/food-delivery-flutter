import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String uname = '', password = '';
  bool enabled = false;
  bool _validate = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
