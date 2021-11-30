// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Services/auth.dart';

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
  bool _passwordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  Widget LoginForm() {
    final _formKey = GlobalKey<FormState>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Container(
            child: ListView(children: [
              Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email_outlined),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        primary: Colors.black87, //background color of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print('uname ' + emailController.text);
                          print('pass ' + passwordController.text);
                          dynamic result =
                              await _auth.signInWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text);

                          if (result == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Error logging in. Please try again')),
                            );
                          }
                          print(FirebaseAuth.instance.currentUser);
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.amber, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFFF6F5F5),
        child: Column(
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
                      fontFamily: "PostNoBillsJaffna",
                      fontSize: 35,
                      letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // Container(
                //   width: 30,
                //   child: TextButton(
                //       style: TextButton.styleFrom(
                //         padding: EdgeInsets.all(0),
                //         primary: Color(0xFFF6F5F5), //background color of button
                //       ),
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       child: Icon(
                //         Icons.keyboard_arrow_left_outlined,
                //         size: 40,
                //         color: Colors.black87,
                //       )),
                // ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontFamily: 'Oregano',
                    fontSize: 40,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.login_outlined,
              size: 100,
            ),
            LoginForm(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Signup", style: TextStyle(color: Colors.amber)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  primary: Colors.black87, //background color of button
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ))
          ],
        ),
      ),
    );
  }
}
