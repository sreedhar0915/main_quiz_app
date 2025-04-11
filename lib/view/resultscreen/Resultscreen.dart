import 'package:flutter/material.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/view/DummyDB.dart';
import 'package:main_quiz_app/view/Homescreen/Categoryscreen.dart';
import 'package:main_quiz_app/view/Quizscreen/Quizscreen.dart';

class Resultscreen extends StatefulWidget {
  const Resultscreen({super.key, required this.rightanswercount});
  final int rightanswercount;

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  int starcount = 0;
  calculatestarcount() {
    var percentage =
        (widget.rightanswercount / Dummydb.Sportslist.length) * 100;

    if (percentage >= 80) {
      starcount = 3;
    } else if (percentage >= 50) {
      starcount = 2;
    } else if (percentage >= 30) {
      starcount = 1;
    } else {
      starcount = 0;
    }
  }

  @override
  void initState() {
    calculatestarcount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
                3,
                (index) => Icon(
                      Icons.star,
                      color: index < starcount
                          ? ColorConstants.yellow
                          : ColorConstants.maincolor,
                      size: index == 1 ? 80 : 40,
                    )),
          ),
          SizedBox(height: 20),
          Text("Congratulations",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 20),
          Text("Your Score",
              style: TextStyle(color: ColorConstants.maincolor, fontSize: 15)),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("${widget.rightanswercount} / 10",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: ColorConstants.yellow)),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Quizscreen(
                          item: Dummydb.categorylist[0]["categoryname"],
                        ),
                      ));
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.maincolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: ColorConstants.black,
                            child: Icon(Icons.replay,
                                color: ColorConstants.maincolor)),
                        SizedBox(width: 20),
                        Text("RETRY",
                            style: TextStyle(color: ColorConstants.black)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Categoryscreen(),
                      ));
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.maincolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.replay,
                                color: ColorConstants.maincolor)),
                        SizedBox(width: 20),
                        Text("OTHER Categories",
                            style: TextStyle(color: ColorConstants.black)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
