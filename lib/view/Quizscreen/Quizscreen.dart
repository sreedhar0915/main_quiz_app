import 'dart:async';

import 'package:flutter/material.dart';
import 'package:main_quiz_app/view/DummyDB.dart';
import 'package:main_quiz_app/view/resultscreen/Resultscreen.dart';

class Quizscreen extends StatefulWidget {
  final String category;
  const Quizscreen({super.key, required this.category});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  late Timer timer;
  int remainingtime = 30;
  dynamic currentindex = 0;
  int rightanswercount = 0;
  int? selectedanswerindex;
  var categorylist = [];
  @override
  void initState() {
    starttimer();
    categorys();
    super.initState();
  }

  void categorys() {
    print(widget.category);
    if (widget.category == "sports") {
      categorylist = Dummydb.Sportslist;
    } else if (widget.category == "Chemistry") {
      categorylist = Dummydb.ChemistryList;
    } else if (widget.category == "Mathematics") {
      categorylist = Dummydb.MathematicsList;
    } else if (widget.category == "History") {
      categorylist = Dummydb.HistoryList;
    } else if (widget.category == "Biology") {
      categorylist = Dummydb.BiologyList;
    } else
      () {
        categorylist = Dummydb.GeographyList;
      };
  }

  void starttimer() {
    remainingtime = 30;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingtime > 0) {
          remainingtime--;
        } else {
          timer.cancel();
          handlingnextquestion();
        }
      });
    });
  }

  void handlingnextquestion() {
    if (currentindex < categorylist.length - 1) {
      setState(() {
        currentindex++;
        selectedanswerindex = null;
        remainingtime = 30;
        starttimer();
      });
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Resultscreen(rightanswercount: rightanswercount)));
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("${currentindex + 1} / ${Dummydb.Sportslist.length}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: CircularProgressIndicator(
                    value: remainingtime / 30,
                    backgroundColor: Colors.black,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "$remainingtime",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Center(
                          child: Text(
                        Dummydb.Sportslist[currentindex]["questions"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ),
                    // if (selectedanswerindex ==
                    //     Dummydb.Questionlist[currentindex]["answerindex"])
                    //   Center(
                    //     child: Lottie.asset(
                    //         AnimationConstant.rightansweranimation,
                    //         fit: BoxFit.cover),
                    //   ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
                children: List.generate(
                    Dummydb.Sportslist[currentindex]["options"].length,
                    (optionindex) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    if (selectedanswerindex == null) {
                      selectedanswerindex = optionindex;
                      setState(() {
                        if (optionindex ==
                            Dummydb.Sportslist[currentindex]["answerindex"]) {
                          rightanswercount++;
                        }
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: getColor(optionindex), width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                              Dummydb.Sportslist[currentindex]["options"]
                                  [optionindex],
                              style: TextStyle(color: Colors.white)),
                          Spacer(),
                          Icon(Icons.circle_outlined, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })),
            SizedBox(
              height: 20,
            ),
            if (selectedanswerindex != null)
              InkWell(
                onTap: () {
                  setState(() {});

                  selectedanswerindex = null;
                  if (currentindex < Dummydb.Sportslist.length - 1) {
                    currentindex++;
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Resultscreen(
                            rightanswercount: rightanswercount,
                          ),
                        ));
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color getColor(int currentoptionindex) {
    if (selectedanswerindex != null &&
        currentoptionindex == Dummydb.Sportslist[currentindex]["answerindex"]) {
      return Colors.green;
    }
    if (selectedanswerindex == currentoptionindex) {
      if (selectedanswerindex ==
          Dummydb.Sportslist[currentindex]["answerindex"]) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.grey;
    }
  }
}
