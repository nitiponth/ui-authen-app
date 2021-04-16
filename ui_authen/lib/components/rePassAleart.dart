import 'package:flutter/material.dart';

showRePassAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("close"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Hey!",
      style: TextStyle(color: Colors.red[300]),
    ),
    content: Text(
      "Password and Confirm-password is not match.",
      style: TextStyle(color: Colors.black54),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
