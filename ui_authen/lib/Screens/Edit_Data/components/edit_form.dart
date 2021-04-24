import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/login_success/components/Monster.dart';
import 'package:ui_authen/Screens/login_success/login_success.dart';
import 'package:ui_authen/components/aleart.dart';
import 'package:ui_authen/components/rounded_button.dart';
import 'package:ui_authen/constants.dart';

class EditForm extends StatefulWidget {
  final Monster monster;
  final String monsterId;

  const EditForm({Key key, @required this.monster, @required this.monsterId})
      : super(key: key);
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
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
            text: "EDIT INFORMATION",
            press: () {
              editData();
              print('edit!');
            },
          ),
          RoundedButton(
            text: "DELETE THIS INFORMATION",
            color: Colors.red,
            press: () {
              deleteData();
            },
          ),
        ],
      ),
    );
  }

  deleteData(){
    monster.doc(widget.monsterId).delete().then((value) {
      print('Data deleted!');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginSuccessScreen();
      }));
    }).catchError((e) {
      print('Failed: $e');
      showAlertDialog(context);
    });
  }

  editData() {
    monster.doc(widget.monsterId).update({
      'name': nameController.text.trim(),
      'level': int.parse(levelController.text.trim()),
      'type': typeController.text.trim(),
      'HP': int.parse(hpController.text.trim()),
      'base': int.parse(baseController.text.trim()),
      'job': int.parse(jobController.text.trim()),
    }).then((value) {
      print('Data edited!');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
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
      controller: nameController..text = widget.monster.name,
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
      controller: levelController..text = widget.monster.level.toString(),
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
      controller: typeController..text = widget.monster.type,
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
      controller: hpController..text = widget.monster.hp.toString(),
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
      controller: baseController..text = widget.monster.base.toString(),
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
      controller: jobController..text = widget.monster.job.toString(),
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
