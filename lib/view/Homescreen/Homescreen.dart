import 'package:flutter/material.dart';
import 'package:main_quiz_app/main.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              UsernameRow(),
              SizedBox(height: 20),
              _rankingandpoints(),
              SizedBox(height: 20),
              _letsplay(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Quizscreen(
                                    category: "sports",
                                  ),
                                ));
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorConstants.grey,
                              border: Border.all(color: ColorConstants.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 180,
                                    child: Image(
                                        image: AssetImage(
                                            "Assets/images/sports-removebg-preview.png")),
                                  ),
                                  Spacer(),
                                  Text("Sports",
                                      style: TextStyle(
                                          color: ColorConstants.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text("10 Questions"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Quizscreen(category: "Chemistry"),
                                ));
                          },
                          child: Container(
                            height: 250,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorConstants.grey,
                              border: Border.all(color: ColorConstants.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 160,
                                    width: 180,
                                    child: Image(
                                        image: AssetImage(
                                            "Assets/images/chemistry-removebg-preview.png")),
                                  ),
                                  Spacer(),
                                  Text("Chemistry",
                                      style: TextStyle(
                                          color: ColorConstants.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text("10 Questions"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Quizscreen(category: "Mathematics"),
                                ));
                          },
                          child: Container(
                            height: 250,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorConstants.grey,
                              border: Border.all(color: ColorConstants.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 160,
                                    width: 180,
                                    child: Image(
                                        image: AssetImage(
                                            "Assets/images/maths-removebg-preview.png")),
                                  ),
                                  Spacer(),
                                  Text("Mathematics",
                                      style: TextStyle(
                                          color: ColorConstants.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text("10 Questions"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Quizscreen(category: "History"),
                                ));
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorConstants.grey,
                              border: Border.all(color: ColorConstants.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 180,
                                    child: Image(
                                        image: AssetImage(
                                            "Assets/images/history-removebg-preview.png")),
                                  ),
                                  Spacer(),
                                  Text("History",
                                      style: TextStyle(
                                          color: ColorConstants.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text("10 Questions"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Quizscreen(category: "Biology"),
                                ));
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorConstants.grey,
                              border: Border.all(color: ColorConstants.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 180,
                                    child: Image(
                                        image: AssetImage(
                                            "Assets/images/biological-removebg-preview.png")),
                                  ),
                                  Spacer(),
                                  Text("Biology",
                                      style: TextStyle(
                                          color: ColorConstants.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text("10 Questions"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Quizscreen(category: ""),
                                ));
                          },
                          child: Container(
                            height: 250,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorConstants.grey,
                              border: Border.all(color: ColorConstants.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 160,
                                    width: 180,
                                    child: Image(
                                        image: AssetImage(
                                            "Assets/images/geography-removebg-preview.png")),
                                  ),
                                  Spacer(),
                                  Text("Geography",
                                      style: TextStyle(
                                          color: ColorConstants.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text("10 Questions"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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
