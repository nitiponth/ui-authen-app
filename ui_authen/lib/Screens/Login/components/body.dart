import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_authen/Screens/Login/components/background.dart';
import 'package:ui_authen/Screens/Login/components/sign_form.dart';
import 'package:ui_authen/Screens/Login/login_screen.dart';
import 'package:ui_authen/Screens/Signup/signup_screen.dart';
import 'package:ui_authen/components/already_have_an_account_acheck.dart';
import 'package:ui_authen/components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    FirebaseAuth _auth = FirebaseAuth.instance;
    bool checkAuth() {
      if (_auth.currentUser != null) return true;
      return false;
    }

    void signOut() {
      _auth.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              width: size.width * 0.8,
              child: SignForm(),
            ),
            SizedBox(height: size.height * 0.03),
            (!checkAuth()
                ? AlreadyHaveAnAccountCheck(
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
                  )
                : RoundedButton(
                    text: "log out?",
                    press: () {
                      signOut();
                    },
                  )),
          ],
        ),
      ),
    );
  }
}
