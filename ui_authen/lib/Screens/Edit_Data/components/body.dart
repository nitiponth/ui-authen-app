import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/Edit_Data/components/edit_form.dart';
import 'package:ui_authen/Screens/Login/components/background.dart';
import 'package:ui_authen/Screens/login_success/components/Monster.dart';

class Body extends StatelessWidget {
  final Monster monster;
  final String monsterId;
  const Body({Key key, @required this.monster, @required this.monsterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.065),
            Text(
              "Edit monster information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              width: size.width * 0.8,
              child: EditForm(monster: this.monster, monsterId: this.monsterId),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
