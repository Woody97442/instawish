// ignore: file_names
import 'package:flutter/material.dart';
import 'package:instawish/screens/layout.dart';
import '../components/user_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      childWidget: Column(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < 25; i++)
                  Column(
                    children: [
                      UserAvatar(
                          filename: "avatar2.jpg", border: true, radius: 35),
                      Text("User $i")
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            height: 200,
            child: Stack(children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, left: 50),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 15,
                      offset: Offset(0.0, 0.75),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                  ),
                ),
                child: Container(
                    margin: EdgeInsets.only(left: 20), child: Text("Username")),
              ),
              Positioned(
                left: -10,
                child:
                    UserAvatar(filename: "img1.jpg", border: false, radius: 32),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
