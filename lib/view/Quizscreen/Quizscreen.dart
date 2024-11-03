import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/view/DummyDB.dart';
import 'package:main_quiz_app/view/resultscreen/Resultscreen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Quizscreen extends StatefulWidget {
  final String item;
  const Quizscreen({super.key, required this.item});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  late Timer timer;
  int remainingtime = 30;
  int currentindex = 0;
  int rightanswercount = 0;
  int? selectedanswerindex;
  List categorylist = [];

  @override
  void initState() {
    super.initState();
    item();
    starttimer(); // Start the timer after item is initialized
  }

  void item() {
    if (widget.item == "Sports") {
      categorylist = Dummydb.Sportslist;
    } else if (widget.item == "Chemistry") {
      categorylist = Dummydb.ChemistryList;
    } else if (widget.item == "Mathematics") {
      categorylist = Dummydb.MathematicsList;
    } else if (widget.item == "History") {
      categorylist = Dummydb.HistoryList;
    } else if (widget.item == "Biology") {
      categorylist = Dummydb.BiologyList;
    } else if (widget.item == "Geography") {
      categorylist = Dummydb.GeographyList;
    }
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
        selectedanswerindex = null; // Reset selected answer
        starttimer(); // Restart the timer for the next question
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
        title: LinearPercentIndicator(
          width: 300,
          lineHeight: 20,
          percent: (currentindex + 1) / categorylist.length,
          center: Text(
            "${((currentindex + 1) / categorylist.length * 100).toStringAsFixed(1)}%",
          ),
          backgroundColor: Colors.grey[300],
          progressColor: Colors.blue,
          barRadius: Radius.circular(10),
          animation: true,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("${currentindex + 1} / ${categorylist.length}",
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
                  backgroundColor: ColorConstants.red,
                  radius: 30,
                  child: CircularProgressIndicator(
                    value: remainingtime / 30,
                    backgroundColor: Colors.black,
                    color: ColorConstants.grey,
                  ),
                ),
                Text(
                  "$remainingtime",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.black),
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
                        color: ColorConstants.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                            child: Text(
                          categorylist[currentindex]["questions"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    if (selectedanswerindex ==
                        categorylist[currentindex]["answerindex"])
                      Center(
                        child: Lottie.asset(
                            "Assets/Animations/Animation - 1729829786990.json"),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
                children: List.generate(
                    categorylist[currentindex]["options"].length,
                    (optionindex) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              if (selectedanswerindex == null) {
                                selectedanswerindex = optionindex;
                                setState(() {
                                  if (optionindex ==
                                      categorylist[currentindex]
                                          ["answerindex"]) {
                                    rightanswercount++;
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstants.black,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: getColor(optionindex), width: 2)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Text(
                                        categorylist[currentindex]["options"]
                                            [optionindex],
                                        style: TextStyle(
                                            color: ColorConstants.white)),
                                    Spacer(),
                                    Icon(Icons.circle_outlined,
                                        color: ColorConstants.grey),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))),
            SizedBox(height: 20),
            if (selectedanswerindex != null)
              InkWell(
                onTap: () {
                  setState(() {
                    selectedanswerindex = null; // Reset selected answer
                  });

                  handlingnextquestion(); // Move to next question
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
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold),
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
        currentoptionindex == categorylist[currentindex]["answerindex"]) {
      return ColorConstants.green;
    }
    if (selectedanswerindex == currentoptionindex) {
      if (selectedanswerindex == categorylist[currentindex]["answerindex"]) {
        return ColorConstants.green;
      } else {
        return ColorConstants.red;
      }
    } else {
      return ColorConstants.grey;
    }
  }
}








// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:main_quiz_app/Utilis/color_constants.dart';
// import 'package:main_quiz_app/view/DummyDB.dart';
// import 'package:main_quiz_app/view/resultscreen/Resultscreen.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// class Quizscreen extends StatefulWidget {
//   final String item;
//   const Quizscreen({super.key, required this.item});

//   @override
//   State<Quizscreen> createState() => _QuizscreenState();
// }

// class _QuizscreenState extends State<Quizscreen> {
//   late Timer timer;
//   int remainingtime = 30;
//   dynamic currentindex = 0;
//   int rightanswercount = 0;
//   int? selectedanswerindex;
//   var categorylist = [];
//   @override
//   void initState() {
//     starttimer();
//     item();
//     super.initState();
//   }

//   void item() {
//     print(widget.item);
//     if (widget.item == "Sports") {
//       categorylist = Dummydb.Sportslist;
//     } else if (widget.item == "Chemistry") {
//       categorylist = Dummydb.ChemistryList;
//     } else if (widget.item == "Mathematics") {
//       categorylist = Dummydb.MathematicsList;
//     } else if (widget.item == "History") {
//       categorylist = Dummydb.HistoryList;
//     } else if (widget.item == "Biology") {
//       categorylist = Dummydb.BiologyList;
//     } else if (widget.item == "Geography") {
//       categorylist = Dummydb.GeographyList;
//     }
//     ;
//   }

//   void starttimer() {
//     remainingtime = 30;
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (remainingtime > 0) {
//           remainingtime--;
//         } else {
//           timer.cancel();
//           handlingnextquestion();
//         }
//       });
//     });
//   }

//   void handlingnextquestion() {
//     if (currentindex < categorylist.length - 1) {
//       setState(() {
//         currentindex++;
//         selectedanswerindex = null;
//         remainingtime = 30;
//         starttimer();
//       });
//     } else {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   Resultscreen(rightanswercount: rightanswercount)));
//     }
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: LinearPercentIndicator(
//           width: 300,
//           lineHeight: 20,
//           percent: (currentindex + 1) / categorylist.length,
//           center: Text(""),
//           // "${((currentindex + 1) / categorylist.length * 100).tostringasfixed(1)}%"),
//           backgroundColor: Colors.grey[300],
//           progressColor: Colors.blue,
//           barRadius: Radius.circular(10),
//           animation: true,
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Text("${currentindex + 1} / ${categorylist.length}",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.grey)),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Column(
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: ColorConstants.red,
//                   radius: 30,
//                   child: CircularProgressIndicator(
//                     value: remainingtime / 30,
//                     backgroundColor: Colors.black,
//                     color: ColorConstants.grey,
//                   ),
//                 ),
//                 Text(
//                   "$remainingtime",
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: ColorConstants.black),
//                 )
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: ColorConstants.grey,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Center(
//                             child: Text(
//                           categorylist[currentindex]["questions"],
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         )),
//                       ),
//                     ),
//                     // if (selectedanswerindex ==
//                     //     categorylist[currentindex]["answerindex"])
//                     //   Center(
//                     //     child: Lottie.asset(
//                     //         "Assets/Animations/Animation - 1729829786990.json"),
//                     //   ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Column(
//                 children: List.generate(
//                     categorylist[currentindex]["options"].length,
//                     (optionindex) => Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: InkWell(
//                             onTap: () {
//                               if (selectedanswerindex == null) {
//                                 selectedanswerindex = optionindex;
//                                 setState(() {
//                                   if (optionindex ==
//                                       categorylist[currentindex]
//                                           ["answerindex"]) {
//                                     rightanswercount++;
//                                   }
//                                 });
//                               }
//                             },
//                             child: Container(
//                               height: 50,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   color: ColorConstants.black,
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(
//                                       color: getColor(optionindex), width: 2)),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                         categorylist[currentindex]["options"]
//                                             [optionindex],
//                                         style: TextStyle(
//                                             color: ColorConstants.white)),
//                                     Spacer(),
//                                     Icon(Icons.circle_outlined,
//                                         color: ColorConstants.grey),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ))),
//             SizedBox(
//               height: 20,
//             ),
//             if (selectedanswerindex != null)
//               InkWell(
//                 onTap: () {
//                   setState(() {});

//                   selectedanswerindex = null;
//                   if (currentindex < categorylist.length - 1) {
//                     currentindex++;
//                   } else {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Resultscreen(
//                             rightanswercount: rightanswercount,
//                           ),
//                         ));
//                   }
//                 },
//                 child: Container(
//                   height: 50,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.grey)),
//                   child: Center(
//                       child: Text(
//                     "Next",
//                     style: TextStyle(
//                         color: ColorConstants.black,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Color getColor(int currentoptionindex) {
//     if (selectedanswerindex != null &&
//         currentoptionindex == categorylist[currentindex]["answerindex"]) {
//       return ColorConstants.green;
//     }
//     if (selectedanswerindex == currentoptionindex) {
//       if (selectedanswerindex == categorylist[currentindex]["answerindex"]) {
//         return ColorConstants.green;
//       } else {
//         return ColorConstants.red;
//       }
//     } else {
//       return ColorConstants.grey;
//     }
//   }
// }