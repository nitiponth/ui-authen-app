import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/Login/login_screen.dart';
import 'package:ui_authen/Screens/Signup/components/background.dart';
import 'package:ui_authen/Screens/Signup/components/signup_form.dart';
import 'package:ui_authen/Screens/Signup/components/social_icon.dart';
import 'package:ui_authen/components/already_have_an_account_acheck.dart';
import 'package:ui_authen/components/doNotSupportYet.dart';
import 'package:ui_authen/components/rounded_button.dart';

import 'or_divider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FirebaseAuth _auth = FirebaseAuth.instance;
    bool checkAuth() {
      if (_auth.currentUser != null) return true;
      return false;
    }

    void signOut() {
      _auth.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    }

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
            (!checkAuth() ? Column(
              children: [
                Container(
                  width: size.width * 0.8,
                  child: SignUpForm(),
                ),
                AlreadyHaveAccount(),
                OrDivider(),
                SocialButton(),
              ],
            ) : Column(
              children: [ 
                SizedBox(height: size.height * 0.2),
                Text('Already sign in!'),
                SizedBox(height: size.height * 0.03),
                RoundedButton(
                    text: "log out?",
                    press: () {
                      signOut();
                    },
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlreadyHaveAnAccountCheck(
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
    );
  }
}
