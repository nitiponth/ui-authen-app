import 'package:flutter/material.dart';

doNotSupportDialog(BuildContext context) {
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
      "Sorry...",
      style: TextStyle(color: Colors.red[300]),
    ),
    content: Text(
      "We're not support this function yet \n\n\n😢",
      style: TextStyle(color: Colors.black54),
      textAlign: TextAlign.center,
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
