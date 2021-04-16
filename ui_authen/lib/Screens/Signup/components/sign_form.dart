import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/login_success/login_success.dart';
import 'package:ui_authen/components/rounded_button.dart';
import 'package:ui_authen/constants.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          RoundedButton(
            text: "LOG IN",
            press: () {
              signIn();
            },
          ),
        ],
      ),
    );
  }

  signIn() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((user) {
      print("signed in ${emailController.text.trim()} Success!!");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginSuccessScreen();
      }));
    }).catchError((error) {
      print(error);
    });

    print(emailController.text.trim());
    print(passwordController.text.trim());
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
}
