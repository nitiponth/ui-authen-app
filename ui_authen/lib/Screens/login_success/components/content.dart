import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_authen/Screens/Edit_Data/edit_screen.dart';
import 'package:ui_authen/Screens/login_success/components/Monster.dart';

class Content extends StatefulWidget {
  Content({Key key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  CollectionReference monsters =
      FirebaseFirestore.instance.collection('monsters');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: monsters.orderBy('level', descending: false).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: size.width * 0.9,
              child: Column(
                  children:
                      snapshot.data.docs.map((doc) => buildItem(doc)).toList()),
            );
          } else {
            return SizedBox();
          }
        });
  }

  Card buildItem(DocumentSnapshot doc) {
    Monster monster = new Monster.fromJson(doc.data());
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(monster.name),
            subtitle: Text(
              'Level ' + monster.level.toString(),
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            onLongPress: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return EditScreen(monster: monster, monsterId: doc.id.toString());
              }))
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "Element : ${monster.type} | HP : ${monster.hp.toString()} | Base Exp: ${monster.base.toString()} | Job Exp ${monster.job.toString()}",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class DataContent extends StatelessWidget {
  const DataContent({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SUCCESS!!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.15),
        SvgPicture.asset(
          "assets/icons/signup.svg",
          height: size.height * 0.35,
        ),
      ],
    );
  }
}
