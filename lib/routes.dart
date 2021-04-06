import 'package:de_project/screens/Scanner/scannerpage.dart';
import 'package:de_project/screens/cart/cart_screen.dart';
import 'package:de_project/screens/complete_profile/complete_profile_screen.dart';
import 'package:de_project/screens/details/details_screen.dart';
import 'package:de_project/screens/fav_items/fav_items.dart';
import 'package:de_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:de_project/screens/home/home_screen.dart';
import 'package:de_project/screens/login_success/login_success_screen.dart';
import 'package:de_project/screens/otp/otp_screen.dart';
import 'package:de_project/screens/profile/profile_screen.dart';
import 'package:de_project/screens/sign_in/sign_in_screen.dart';
import 'package:de_project/screens/sign_up/sign_up_screen.dart';
import 'package:de_project/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ScannerPage.routeName: (context) => ScannerPage(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  favourite_items.routeName: (context) => favourite_items(),
};