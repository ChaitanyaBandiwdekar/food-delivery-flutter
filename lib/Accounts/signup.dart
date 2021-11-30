// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Services/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String uname = '', password = '', mobile = '';
  bool enabled = false;
  bool _validate = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final AuthService _auth = AuthService();

  Widget SignupForm() {
    final _formKey = GlobalKey<FormState>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
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
                  validator: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regex = RegExp(pattern);

                    if (value!.isEmpty) {
                      return 'Please enter valid email ID';
                    } else if (!regex.hasMatch(value)) {
                      return 'Invalid Email ID!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    String pattern = r'(^[0-9]*$)';
                    RegExp regexp = RegExp(pattern);

                    if (value!.isEmpty) {
                      return "Phone number is required";
                    } else if (!regexp.hasMatch(value)) {
                      return "Phone number must contain digits only";
                    } else if (value.length != 10) {
                      return "Phone number must contain only 10 digits";
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    String pattern =
                        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
                    RegExp regex = RegExp(pattern);

                    if (!regex.hasMatch(value!)) {
                      return 'Invalid Password!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !_confirmPasswordVisible,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_confirmPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Passwords should match';
                    } else {
                      return null;
                    }
                  },
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
                        print('phone ' + phoneController.text);
                        print('pass ' + passwordController.text);
                        print('cpass ' + confirmPasswordController.text);

                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                                emailController.text, passwordController.text);

                        if (result == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Signup failed! Please try again')),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.amber, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ]),
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
                Container(
                  width: 30,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        primary: Color(0xFFF6F5F5), //background color of button
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 40,
                        color: Colors.black87,
                      )),
                ),
                Text(
                  "SIGNUP",
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
              Icons.person_outline_rounded,
              size: 100,
            ),
            SignupForm()
          ],
        ),
      ),
    );
  }
}
