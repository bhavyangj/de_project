import 'package:de_project/screens/profile/data/UploadData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../sign_in/sign_in_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logout() async{
    User user = auth.signOut() as User;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => UploadData()))
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              // auth.signOut();
              logout();
              // context.read<AuthenticationService>().logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
            },
          ),
        ],
      ),
    );
  }
}
