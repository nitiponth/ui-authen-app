import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/login_success/login_success.dart';
import 'package:ui_authen/components/rePassAleart.dart';
import 'package:ui_authen/components/rounded_button.dart';
import 'package:ui_authen/constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: size.height * 0.02),
          buildPasswordFormField(),
          SizedBox(height: size.height * 0.025),
          buildPasswordCheckFormField(),
          SizedBox(height: size.height * 0.025),
          RoundedButton(
            text: "SIGN UP",
            press: () {
              signUp();
            },
          ),
        ],
      ),
    );
  }

  signUp() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String passwordCheck = passwordCheckController.text.trim();
    if (password == passwordCheck && password.length >= 6) {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        print("Sign up user successful.");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginSuccessScreen();
        }));
      }).catchError((error) {
        print(error.message);
      });
    } else {
      print("Password and Confirm-password is not match.");
      showRePassAlertDialog(context);
    }
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: emailController,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.person,
          color: kPrimaryColor,
        ),
        labelText: "Email",
        hintText: "Enter your email",
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: passwordController,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        labelText: "Password",
        hintText: "Enter your password",
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPasswordCheckFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: passwordCheckController,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        labelText: "Re - Password",
        hintText: "Enter your password",
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
