import 'package:flutter/material.dart';
import 'package:main_quiz_app/main.dart';
import 'package:main_quiz_app/view/DummyDB.dart';
import 'package:main_quiz_app/view/Globalwidget/categorycontainer.dart';
import 'package:main_quiz_app/view/Quizscreen/Quizscreen.dart';
import 'package:main_quiz_app/view/Utils/constants/color_constants/color_constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.black,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              UsernameRow(),
              SizedBox(height: 20),
              _rankingandpoints(),
              SizedBox(height: 20),
              _letsplay(),
              SizedBox(height: 20),
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.7),
                      itemCount: Dummydb.categorylist.length,
                      itemBuilder: (context, index) => Categorycontainer(
                          categoryimages: Dummydb.categorylist[index]
                              ["categoryimage"],
                          categorynames: Dummydb.categorylist[index]
                              ["categoryname"],
                          oncategorytap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quizscreen(
                                        item: Dummydb.categorylist[index]
                                            ["categoryname"])));
                          }))),
            ])));
  }

  Container _rankingandpoints() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstants.grey,
        border: Border.all(color: ColorConstants.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text("Ranking",
                          style: TextStyle(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("348",
                          style: TextStyle(
                              color: ColorConstants.blue,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5),
              Divider(color: ColorConstants.black),
              SizedBox(width: 5),
              Expanded(
                child: Container(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text("Points",
                          style: TextStyle(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("1209",
                          style: TextStyle(
                              color: ColorConstants.blue,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _letsplay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text("Let's play",
              style: TextStyle(
                  color: ColorConstants.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Spacer(),
        ],
      ),
    );
  }

  Row UsernameRow() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi,$Username",
                style: TextStyle(
                    color: ColorConstants.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Let's make this day productive",
                style: TextStyle(
                    color: ColorConstants.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Spacer(),
        CircleAvatar(
            radius: 30,
            backgroundColor: ColorConstants.blue,
            child: Image.asset(
              "Assets/images/profiledp-removebg-preview.png",
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}
