import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/Add_Data/add_screen.dart';
import 'package:ui_authen/Screens/Login/components/background.dart';
import 'package:ui_authen/Screens/Login/login_screen.dart';
import 'package:ui_authen/Screens/login_success/components/content.dart';
import 'package:ui_authen/Screens/login_success/components/signout.dart';
import 'package:ui_authen/components/rounded_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool checkAuth() {
    if(_auth.currentUser != null)
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            (checkAuth() ? Content() : Text("Please login to view monster information.")),
            SizedBox(height: size.height * 0.08),
            SizedBox(
              width: size.width * 0.6,
              child: (checkAuth() ? AddMonsterData() : null),
            ),
            SizedBox(
              width: size.width * 0.6,
              child: (checkAuth() ? SignOutButton() : SignInButton()),
            ),
            SizedBox(height: size.height * 0.08),
          ],
        ),
      ),
    );
  }
}

class AddMonsterData extends StatelessWidget {
  const AddMonsterData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
    text: "Add Data",
    press: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AddScreen();
          },
        ),
      );
    });
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
    text: "LOGIN",
    press: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    },
            );
  }
}
