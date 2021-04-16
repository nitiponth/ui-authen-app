import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_authen/Screens/Add_Data/components/add_form.dart';
import 'package:ui_authen/Screens/Login/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add monster information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              width: size.width * 0.8,
              child: AddForm(),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
