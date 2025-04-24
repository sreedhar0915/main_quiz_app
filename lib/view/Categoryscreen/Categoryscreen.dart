import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/view/DummyDB.dart';
import 'package:main_quiz_app/view/Globalwidget/categorycontainer.dart';
import 'package:main_quiz_app/view/Profilescreen/Profilescreen.dart';
import 'package:main_quiz_app/view/Quizscreen/Quizscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  String username = "";
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name') ?? 'No Data Stored';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.black,
        appBar: AppBar(
          backgroundColor: ColorConstants.black,
          title: Center(
            child: Image(
                height: 120,
                image: AssetImage("Assets/images/quiz-removebg-preview.png")),
          ),
          toolbarHeight: 100,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              UsernameRow(),
              SizedBox(height: 10),
              Carouselslidersection(),
              _letsplay(),
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quizscreen(
                                        item: Dummydb.categorylist[index]
                                            ["categoryname"])));
                          }))),
            ])));
  }

  Padding _letsplay() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text("Let's play",
              style: TextStyle(
                  color: ColorConstants.maincolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Spacer(),
        ],
      ),
    );
  }

  CarouselSlider Carouselslidersection() {
    return CarouselSlider(
        options: CarouselOptions(
          height: 280.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
        items: [
          Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorConstants.maincolor)),
              child: Image.asset(
                "Assets/images/quiz cs1.jpg",
                fit: BoxFit.cover,
              )),
          Container(
              height: 100,
              width: 400,
              child: Image.asset(
                "Assets/images/quiz cs2.png",
                fit: BoxFit.cover,
              )),
          Container(
              height: 100,
              width: 400,
              child: Image.asset(
                "Assets/images/quiz cs3.jpg",
                fit: BoxFit.cover,
              )),
        ]);
  }

  Row UsernameRow() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi,$username",
                style: TextStyle(
                    color: ColorConstants.maincolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Let's make this day productive",
                style: TextStyle(
                    color: ColorConstants.maincolor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profilescreen()));
          },
          child: CircleAvatar(
              radius: 30,
              backgroundColor: ColorConstants.blue,
              child: Image.asset(
                "Assets/images/profiledp-removebg-preview.png",
                fit: BoxFit.cover,
              )),
        )
      ],
    );
  }
}
