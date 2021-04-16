import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/Login/login_screen.dart';
import 'package:ui_authen/Screens/Signup/components/background.dart';
import 'package:ui_authen/Screens/Signup/components/signup_form.dart';
import 'package:ui_authen/Screens/Signup/components/social_icon.dart';
import 'package:ui_authen/components/already_have_an_account_acheck.dart';
import 'package:ui_authen/components/doNotSupportYet.dart';

import 'or_divider.dart';

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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.225),
            Container(
              width: size.width * 0.8,
              child: SignUpForm(),
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {
                    doNotSupportDialog(context);
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {
                    doNotSupportDialog(context);
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-icon.svg",
                  press: () {
                    doNotSupportDialog(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
