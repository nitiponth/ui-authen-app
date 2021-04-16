import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/login_success/login_success.dart';
import 'package:ui_authen/components/aleart.dart';
import 'package:ui_authen/components/rounded_button.dart';
import 'package:ui_authen/constants.dart';

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  CollectionReference monster =
      FirebaseFirestore.instance.collection('monsters');
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController baseController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: size.height * 0.02),
          buildLevelFormField(),
          SizedBox(height: size.height * 0.025),
          buildTypeFormField(),
          SizedBox(height: size.height * 0.025),
          buildHPFormField(),
          SizedBox(height: size.height * 0.025),
          buildBaseFormField(),
          SizedBox(height: size.height * 0.025),
          buildJobFormField(),
          SizedBox(height: size.height * 0.025),
          RoundedButton(
            text: "ADD INFORMATION",
            press: () {
              addDataIn();
            },
          ),
        ],
      ),
    );
  }

  addDataIn() {
    monster.add({
      'name': nameController.text.trim(),
      'level': int.parse(levelController.text.trim()),
      'type': typeController.text.trim(),
      'HP': int.parse(hpController.text.trim()),
      'base': int.parse(baseController.text.trim()),
      'job': int.parse(jobController.text.trim()),
    }).then((value) {
      print('Data Added!');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginSuccessScreen();
      }));
    }).catchError((e) {
      print('Failed: $e');
      showAlertDialog(context);
    });
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: nameController,
      decoration: InputDecoration(
        labelText: "Monster name",
        hintText: "Example : Baphomet",
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

  TextFormField buildLevelFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: levelController,
      decoration: InputDecoration(
        labelText: "Monster level",
        hintText: "Example : 81",
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

  TextFormField buildTypeFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: typeController,
      decoration: InputDecoration(
        labelText: "Monster type",
        hintText: "Example : Shadow",
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

  TextFormField buildHPFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: hpController,
      decoration: InputDecoration(
        labelText: "Monster HP",
        hintText: "Example : 668000",
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

  TextFormField buildBaseFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: baseController,
      decoration: InputDecoration(
        labelText: "Monster Base Exp",
        hintText: "Example : 107250",
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

  TextFormField buildJobFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {},
      controller: jobController,
      decoration: InputDecoration(
        labelText: "Monster Job Exp",
        hintText: "Example : 37895",
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
