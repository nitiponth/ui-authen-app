import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_authen/Screens/Welcome/welcome_screen.dart';
import 'package:ui_authen/constants.dart';
import 'package:ui_authen/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class AppNoSQL extends StatelessWidget {
//   final CollectionReference users =
//       FirebaseFirestore.instance.collection('users');
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           child: Center(
//             child: Column(
//               //mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // createUser(),
//                 // updateUser(),
//                 // deletePropField(),
//                 // deleteUser(),
//                 // OneTimeRead(users: users),
//                 // RealTimeRead(users: users),
//                 StreamBuilder(
//                     stream: users.snapshots(),
//                     builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
//                       if (snap.hasError != false) {
//                         return Text('Error!');
//                       }

//                       if (snap.connectionState == ConnectionState.waiting) {
//                         return Text('Loading...');
//                       }

//                       return ListView(
//                         children: snap.data.docs.map((doc) {
//                           print(doc.data().toString());
//                           //return Text(doc.data().toString());
//                         }).toList(),
//                       );
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   ElevatedButton deleteUser() {
//     return ElevatedButton(
//       onPressed: () {
//         final CollectionReference users =
//             FirebaseFirestore.instance.collection('users');
//         users
//             .doc('1')
//             .delete()
//             .then((value) => print("User Deleted"))
//             .catchError((e) => print("Failed to deleted user: $e"));
//       },
//       child: Text("delete USER!!"),
//     );
//   }

//   ElevatedButton deletePropField() {
//     return ElevatedButton(
//         onPressed: () {
//           final CollectionReference users =
//               FirebaseFirestore.instance.collection('users');
//           users
//               .doc('1')
//               .update({'job': FieldValue.delete()})
//               .then((value) => print("User's Property Deleted"))
//               .catchError(
//                   (e) => print("Failed to deleted user's property: $e"));
//         },
//         child: Text("remove Job property"));
//   }

//   ElevatedButton updateUser() {
//     return ElevatedButton(
//         onPressed: () {
//           final CollectionReference users =
//               FirebaseFirestore.instance.collection('users');
//           users
//               .doc('1')
//               .update({'type': 'Sniper', 'job': 1})
//               .then((value) => print("users Updated"))
//               .catchError((e) => print("Failed to update user: $e"));
//         },
//         child: Text("Update data"));
//   }

//   ElevatedButton createUser() {
//     return ElevatedButton(
//       onPressed: () {
//         final CollectionReference users =
//             FirebaseFirestore.instance.collection('users');
//         users
//             .doc('1')
//             .set({'name': 'Gorgi4s', 'type': 'Hunter'})
//             .then((value) => print('success'))
//             .catchError((e) => print(e));
//       },
//       child: Text('create data'),
//     );
//   }
// }

// class RealTimeRead extends StatelessWidget {
//   const RealTimeRead({
//     Key key,
//     @required this.users,
//   }) : super(key: key);

//   final CollectionReference users;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: users.doc('1').snapshots(),
//       builder: (context, snap) {
//         if (snap.connectionState == ConnectionState.waiting) {
//           return Text('Loading...');
//         }
//         print(snap.data.data());
//         return Text(User.fromJson(snap.data.data()).toString());
//       },
//     );
//   }
// }

// class OneTimeRead extends StatelessWidget {
//   const OneTimeRead({
//     Key key,
//     @required this.users,
//   }) : super(key: key);

//   final CollectionReference users;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: users.doc('1').get(),
//         builder: (context, snap) {
//           if (snap.connectionState == ConnectionState.done) {
//             final User user = new User.fromJson(snap.data.data());
//             print(user);
//             return Text(user.toString());
//           }
//           return Text('data!');
//         });
//   }
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
