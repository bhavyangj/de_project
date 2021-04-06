// import 'dart:js';

import 'package:de_project/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatefulWidget {
  static String routeName = "/login_success";

  @override
  _LoginSuccessScreenState createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User user;

  bool isloggedin = false;

  // checkAuthentification() async {
  //   auth.authStateChanges().listen((user) {
  //     if (user == null) {
  //       Navigator.of(context).pushReplacementNamed(MaterialPageRoute(builder: (context) => SignInScreen()));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}
