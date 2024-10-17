import 'package:flutter/material.dart';
import 'package:main_quiz_app/view/DummyDB.dart';
import 'package:main_quiz_app/view/Homescreen/Homescreen.dart';
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
      backgroundColor: Colors.black,
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
                      color: index < starcount ? Colors.amber : Colors.grey,
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
              style: TextStyle(color: Colors.white, fontSize: 15)),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
                "${widget.rightanswercount} / ${Dummydb.Sportslist.length}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.amber)),
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
                          category: "category",
                        ),
                      ));
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
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
                            child: Icon(Icons.replay, color: Colors.white)),
                        SizedBox(width: 20),
                        Text("RETRY", style: TextStyle(color: Colors.black)),
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
                        builder: (context) => Homescreen(),
                      ));
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
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
                            child: Icon(Icons.replay, color: Colors.white)),
                        SizedBox(width: 20),
                        Text("OTHER SECTIONS",
                            style: TextStyle(color: Colors.black)),
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
