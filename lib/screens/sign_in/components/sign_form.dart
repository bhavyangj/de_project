import 'package:de_project/screens/home/home_screen.dart';
import 'package:de_project/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:de_project/components/custom_surfix_icon.dart';
import 'package:de_project/components/form_error.dart';
import 'package:de_project/helper/keyboard.dart';
import 'package:de_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:de_project/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool remember = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final List<String> errors = [];

  Future<String> logIn() async {
    String user = (await auth.signInWithEmailAndPassword(
        email: _email, password: _password)).toString();
    return user;
  }

  // checkAuthentification() async{
  //   auth.authStateChanges().listen((user) {
  //     if(user != null){
  //       print(user);
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  //     }
  //   });
  // }

  @override
  void initState(){
    super.initState();
    Future(() async{
      if(await auth!=null){
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginSuccessScreen()));
      }
    });
    // this.checkAuthentification();
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
            child: Text(
              "Skip for now",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Future<String> check = logIn();
                if(check!=null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginSuccessScreen()));
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _password = newValue /*as TextEditingController*/,
      onChanged: (value) {
        setState(() {
          _password = value.trim();
        });
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "Please Enter Username";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "Password should be greater than 8 character";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _email = newValue/* as TextEditingController*/,
      onChanged: (value) {
        setState(() {
          _email = value.trim();
        });
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "Please Enter Email Id";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "Email is not Valid";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
