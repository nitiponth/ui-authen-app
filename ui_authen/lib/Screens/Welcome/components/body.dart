import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_authen/Screens/Login/login_screen.dart';
import 'package:ui_authen/Screens/Signup/signup_screen.dart';
import 'package:ui_authen/Screens/Welcome/components/background.dart';
import 'package:ui_authen/Screens/login_success/login_success.dart';
import 'package:ui_authen/components/rounded_button.dart';
import 'package:ui_authen/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hi, KMUTNB",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            LoginButt(),
            SignUpbutt(),
            ContentButt(),
          ],
        ),
      ),
    );
  }
}

class ContentButt extends StatelessWidget {
  const ContentButt({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: "Monster Data",
      color: Color(0xFFBA68C8),
      textColor: Colors.white,
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginSuccessScreen();
            },
          ),
        );
      },
    );
  }
}

class SignUpbutt extends StatelessWidget {
  const SignUpbutt({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: "SIGN UP",
      color: kPrimaryLightColor,
      textColor: Colors.black,
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SignUpScreen();
            },
          ),
        );
      },
    );
  }
}

class LoginButt extends StatelessWidget {
  const LoginButt({
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
