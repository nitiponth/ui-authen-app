import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/Edit_Data/components/body.dart';
import 'package:ui_authen/Screens/login_success/components/Monster.dart';

class EditScreen extends StatelessWidget {
  final Monster monster;
  final String monsterId;

  const EditScreen({Key key, @required this.monster, @required this.monsterId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(monster: this.monster, monsterId: this.monsterId),
    );
  }
}
